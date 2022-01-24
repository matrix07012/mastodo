* How to activate FTS on Mastodon without having to use ElasticSearch ?
1. We need to add a column in the statuses table. That column will store a tsvector index
that will be used to speedup the search.
`ALTER TABLE statuses ADD COLUMN tsv tsvector;CREATE INDEX tsv_idx ON statuses USING gin(tsv);`
2. We need to update that index with the correct values. Ideally this would be done in the code to avoid the trigger running each time the 
text column is mentionned in a query ( due to Rails ORM of course, hand designed query would not cause trouble ). As we won't modify the code
to ease the fork maintenance, we have to go with stored procedures and triggers in psql:
`CREATE FUNCTION tsv_update_trigger() RETURNS trigger AS $$ begin new.tsv := to_tsvector(new.text); return new; end $$ LANGUAGE plpgsql;`
And now let's create the triggers that will update that index using the function we previously defined:
`CREATE TRIGGER tsvectorupdate BEFORE UPDATE ON statuses FOR EACH ROW WHEN (old.text IS DISTINCT FROM new.text) EXECUTE PROCEDURE tsv_update_trigger();`
`CREATE TRIGGER tsvectorinsert BEFORE INSERT ON statuses FOR EACH ROW EXECUTE PROCEDURE tsv_update_trigger();`
3. You now need to fill the index for the previous rows (it will take some time):
`UPDATE statuses SET tsv = to_tsvector(text);`
4. You should be done now on the postgresl side, let's patch the code !
That patch is available in the docs folder, but no longer works so you need to do the changes manually
5. That's it, congratulations, you enabled Full Text Search with Postgresql.
6. That patch will only allow you to find the 20 latest public toots that your instance received ( which is what we use on mastodon.host ). If you want the same function as the original, there's a few more filters to add to that query to ensure returning only toots that were posted/boosted by the account triggering the search. If someone wants me to put the code needed for that in the patch, send a Pr on that repo and I will merge it !

* How to go further/Faq ?
1. Why did you do that ?  https://github.com/tootsuite/mastodon/pull/6423 , or check the fediverse and you'll understand that to be fair among instances, there was a need for it.
2. If you are running a big instance, I would suggest switching from GIN to RUM for the index type. You'll be using more disk space, but the ordering/ranking 
of results can happen during the initial index scan => Instant huge speed bump.
3. If you want to upstream that, I would suggest looking at the gem 'pg_search' that could help quite a bit.
4. Why not ES ? It is not necessary, even at scale. It creates dual tiered instances depending on the admin finances, was used as a shortcut to search and a way to ensure that not all the instances would deploy it, etc.. No need to go back there.
5. But they say that it will impact performance to use Postgres instead of Elastic Search ? Think about it, using ES you are moving a subset of your queries to another process ( ideally on another server, if not then the impact of performance is also true for ES, as it will consume system resources instead of leaving it for Pg ), what prevents you from routing only the search requests to a separate DB server ?
What prevents you from running the triggers only on that separate instance ? You get the Bs about that now I hope ;)
6. Need more info ? Good luck, because I'm as clueless as you are
7. Why is ES bad ? Es is not bad, it is a fantastic tool for data aggregation from different sources, there is plenty of great frontends too to create analytics, reporting, behaviour analysis, etc... It is not a tool adapted imho for the feature of searching the toot db of 99.999% of the instances, and even for the very few instances which have a huge database, it is debatable compared to the benefits of a R/O slave.
