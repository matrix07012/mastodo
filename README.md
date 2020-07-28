What is Mastodo ?
=================
This is an attempt at continuing the Mastodo fork by [@gled@mastodon.host](https://mastodon.host/@gled).

This is Mastodo, a Mastodon's fork implementing useful features that will not be implemented upstream.

We tend to integrate all the upstream commits, but allow more features to be available for both admins and users, while pooling the effort of maintaining a fork between multiple instances.

The goal is to have a fork with on/off switches for features that are not available upstream, allowing the admin a lot of customization to suit better their community.

## Patches implemented:
- Full Text search for statuses ( upstream code only allow searching users and hashtags, or needs Elastic Search to allow searching your own statuses only ).
- FTS for your home timeline ( not only your own toots, but also people you follow, WIP ).
- 20 results instead of 5 per type of search (pagination not working)
- The FAQ link on the homepage points to /about/more instead of the github repo.
- Configurable character limit for posts with `MAX_TOOT_CHARS` in `.env.production` (default is 2048) by <a href="https://github.com/lambadalambda">@lambadalambda</a>.
- Configurable character limit instead of 160 for profile bio with `MAX_BIO_CHARS` in `.env.production` (default is 512).
- Configurable display name limit with `MAX_DISPLAY_NAME_CHARS` in `.env.production`.
- Configurable number of profile fields with `MAX_PROFILE_FIELDS` in `.env.production`.
- Configurable media upload limit with with `MAX_IMG_SIZE` and `MAX_VID_SIZE` in `.env.production`.
- replies and reboosts are displayed in the timelines instead of being ignored.
- CI to check every user facing function is behaving correctly.
- A few other minor tweaks like full column display to fill bigger screen, multiples themes, and other improvements...
- Oauth patch to allow authentication by either the local username or the email ( necessary for the XMPP integration ).
- Trending tags that got removed from upstream is available
- Moderation tools for trending tags has been added.
- Quite a few other tweaks I can't recall...

## Policy on this fork:
- Everyone willing to contribute can request R/W privileges on this repo ( via GitHub, or via Mastodon to [@matrix@gameliberty.club
](https://gameliberty.club/@matrix) ).
- We want to provide a customisable mastodon instance for the admins, allowing them to choose the feature set they want, and a full featured instance for your users. 
- Pull Request welcomed and accepted, whatever your rationale ( if you code something though just for you, or a niche feature, please make it optional and we'll merge it ! )
- We won't reject a feature or a modification because 'I dont like it', ever.

## Notes:
- For admins that want to just integrate the patch for FTS ( to allow not using ES and save a bit of resources ): Check the unmaintained FTS_NOES.md file !
- If you are wondering why such a fork exists, take a look at the different topics about features on https://discourse.joinmastodon.org or check the upstream repository issue lists and the replies. Not every feature will make it upstream, so to make sure our users would get what they wanted, fork was the easiest way to avoid drama. We still merge upstream at each tag, and are grateful for their work.
