What is Mastodo ?
=================

This is Mastodo, a Mastodon's fork implementing useful features that will not be implemented upstream.

We tend to integrate all the upstream commits, but allow more features to be available for both admins and users, while pooling the effort of maintaining a fork between multiple instances.

The goal is to have a fork with on/off switches for features that are not available upstream, allowing the admin a lot of customization to suit better their community.

## Patches implemented:
- PIWIK integration ( allows to have some nice anonymous, self hosted and opensource analytics on the visitors ).
- Full Text search for statuses ( upstream code only allow searching users and hashtags, or needs Elastic Search to allow searching your own statuses only ).
- FTS for your home timeline ( not only your own toots, but also people you follow, WIP ).
- 20 results instead of 5 per type of search.
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
- Audio upload from @djsundog@toot-lab.reclaim.technology , not only videos...
- Rich text formatting from Thib@social.sitedethib.com ( allow displaying posts as they were written from other fediverse softs rather than stripping everything )
- Quite a few other tweaks I can't recall...
- **Glitch-Soc and Vahnj's patches are merged in the glitch-vahnj branch for now, time to add the necessary on/off switches for all those features !**

## Policy on this fork:
- Everyone willing to contribute can request R/W privileges on this repo ( via GitHub, or via Mastodon to [@gled@mastodon.host](https://mastodon.host/@gled) or to [@kemonine@mastodon.social](https://mastodon.social/@kemonine) ).
- We want to provide a customisable mastodon instance for the admins, allowing them to choose the feature set they want, and a full featured instance for your users. 
- Pull Request welcomed and accepted, whatever your rationale ( if you code something though just for you, or a niche feature, please make it optional and we'll merge it ! )
- We won't reject a feature or a modification because 'I dont like it', ever.

## Notes:
- For admins that want to just integrate the patch for FTS ( to allow not using ES and save a bit of resources ): Check the unmaintained FTS_NOES.md file !
- If you are wondering why such a fork exists, take a look at the different topics about features on https://discourse.joinmastodon.org or check the upstream repository issue lists and the replies. Not every feature will make it upstream, so to make sure our users would get what they wanted, fork was the easiest way to avoid drama. We still merge upstream at each tag, and are grateful for their work.

Original full README is available on the upstream repository, extract below:

Mastodon
=======
![Mastodon](https://i.imgur.com/NhZc40l.png)

[![GitHub release](https://img.shields.io/github/release/tootsuite/mastodon.svg)][releases]
[![Build Status](https://img.shields.io/circleci/project/github/tootsuite/mastodon.svg)][circleci]
[![Code Climate](https://img.shields.io/codeclimate/maintainability/tootsuite/mastodon.svg)][code_climate]
[![Crowdin](https://d322cqt584bo4o.cloudfront.net/mastodon/localized.svg)][crowdin]
[![Docker Pulls](https://img.shields.io/docker/pulls/tootsuite/mastodon.svg)][docker]

[releases]: https://github.com/tootsuite/mastodon/releases
[circleci]: https://circleci.com/gh/tootsuite/mastodon
[code_climate]: https://codeclimate.com/github/tootsuite/mastodon
[crowdin]: https://crowdin.com/project/mastodon
[docker]: https://hub.docker.com/r/tootsuite/mastodon/

Mastodon is a **free, open-source social network server** based on ActivityPub where users can follow friends and discover new ones. On Mastodon, users can publish anything they want: links, pictures, text, video. All Mastodon servers are interoperable as a federated network (users on one server can seamlessly communicate with users from another one, including non-Mastodon software that implements ActivityPub)!

Click below to **learn more** in a video:

[![Screenshot](https://blog.joinmastodon.org/2018/06/why-activitypub-is-the-future/ezgif-2-60f1b00403.gif)][youtube_demo]

[youtube_demo]: https://www.youtube.com/watch?v=IPSbNdBmWKE

## Navigation

- [Project homepage 🐘](https://joinmastodon.org)
- [Support the development via Patreon][patreon]
- [View sponsors](https://joinmastodon.org/sponsors)
- [Blog](https://blog.joinmastodon.org)
- [Documentation](https://docs.joinmastodon.org)
- [Browse Mastodon servers](https://joinmastodon.org/#getting-started)
- [Browse Mastodon apps](https://joinmastodon.org/apps)

[patreon]: https://www.patreon.com/mastodon

## Features

<img src="https://docs.joinmastodon.org/elephant.svg" align="right" width="30%" />

**No vendor lock-in: Fully interoperable with any conforming platform**

It doesn't have to be Mastodon, whatever implements ActivityPub is part of the social network! [Learn more](https://blog.joinmastodon.org/2018/06/why-activitypub-is-the-future/)

**Real-time, chronological timeline updates**

See the updates of people you're following appear in real-time in the UI via WebSockets. There's a firehose view as well!

**Media attachments like images and short videos**

Upload and view images and WebM/MP4 videos attached to the updates. Videos with no audio track are treated like GIFs; normal videos are looped - like vines!

**Safety and moderation tools**

Private posts, locked accounts, phrase filtering, muting, blocking and all sorts of other features, along with a reporting and moderation system. [Learn more](https://blog.joinmastodon.org/2018/07/cage-the-mastodon/)

**OAuth2 and a straightforward REST API**

Mastodon acts as an OAuth2 provider so 3rd party apps can use the REST and Streaming APIs, resulting in a rich app ecosystem with a lot of choices!

## Deployment

**Tech stack:**

- **Ruby on Rails** powers the REST API and other web pages
- **React.js** and Redux are used for the dynamic parts of the interface
- **Node.js** powers the streaming API

**Requirements:**

- **PostgreSQL** 9.5+
- **Redis**
- **Ruby** 2.4+
- **Node.js** 10.13+

The repository includes deployment configurations for **Docker and docker-compose**, but also a few specific platforms like **Heroku**, **Scalingo**, and **Nanobox**. The [**stand-alone** installation guide](https://docs.joinmastodon.org/admin/install/) is available in the documentation.

A **Vagrant** configuration is included for development purposes.

## Contributing

Mastodon is **free, open-source software** licensed under **AGPLv3**.

You can open issues for bugs you've found or features you think are missing. You can also submit pull requests to this repository, or submit translations using Weblate. To get started, take a look at [CONTRIBUTING.md](CONTRIBUTING.md). If your contributions are accepted into Mastodon, you can request to be paid through [our OpenCollective](https://opencollective.com/mastodon).

**IRC channel**: #mastodon on irc.freenode.net

## License

Copyright (C) 2016-2020 Eugen Rochko & other Mastodon contributors (see [AUTHORS.md](AUTHORS.md))

This program is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
