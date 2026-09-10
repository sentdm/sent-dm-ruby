# Changelog

## [0.30.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.29.0...v0.30.0) (2026-09-09)


### Highlights

This release is breaking for the webhook endpoints. Webhook responses now use one shared model instead of a separate type per operation: the create, retrieve, update and toggle-status response types are gone, and all four now return the shared webhook API response model (`ApiResponseWebhook`, in this language's casing). If your code references one of the removed types, or its nested data, error or meta members, point it at the shared model. The list, list-event-types, list-events, rotate-secret and test responses are unchanged, because each returns a different envelope.

### Features

* **api:** repoint dangling model refs at current v3 schema names ([631adad](https://github.com/sentdm/sent-dm-ruby/commit/631adadfe49cd6eb7ae9df2d3ad3c8261ac54984))

## [0.29.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.28.0...v0.29.0) (2026-09-06)


### Features

* **api:** sync OpenAPI spec from production ([d619423](https://github.com/sentdm/sent-dm-ruby/commit/d61942394aee7452e991472c466c1e3d71018cb0))
* **api:** sync OpenAPI spec from production ([c8fa353](https://github.com/sentdm/sent-dm-ruby/commit/c8fa353d8623967fbc94a962b709f6a18771a3d6))

## [0.28.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.27.0...v0.28.0) (2026-08-31)


### Features

* **api:** sync OpenAPI spec from production ([d1e44c2](https://github.com/sentdm/sent-dm-ruby/commit/d1e44c2f20f5397cc0d868af4ac0216f2c78baa8))
* **api:** sync OpenAPI spec from production ([f6354b3](https://github.com/sentdm/sent-dm-ruby/commit/f6354b3dc2a88c39d886349558b605b37a97db3e))


### Bug Fixes

* sync the package version in Gemfile.lock to 0.27.0 ([d6f29cc](https://github.com/sentdm/sent-dm-ruby/commit/d6f29cc70c3d1b1786ed6e31c08dd6c9321552b0))

## [0.27.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.26.0...v0.27.0) (2026-08-17)


### Highlights

Webhook payloads are now typed. The events Sent POSTs to your endpoint — `MessageEvent`, `InboundMessageEvent` and `TemplateEvent`, each with its own payload type — are generated types you can deserialize into, instead of a shape you had to hand-write from the docs.

The webhook delivery log is typed too. `event_data` on `GET /v3/webhooks/{id}/events` returns the exact envelope that was delivered, and now describes itself as one of those three rather than an opaque object.

Also in this release:

- `csp_id` on the brand object is deprecated and will be removed in a later release. It identifies the Campaign Service Provider that registered the brand, which is Sent, so the value is the same for every account. There is no replacement. Your own TCR identifiers, `tcr_brand_id` and `universal_ein`, are unaffected.
- Corrected descriptions for blocked sends, which now name the cases that gate a send before any delivery attempt: insufficient balance, a template not approved for sending, and free-form content with no open conversation.
- `campaign.volume` documents what an omitted value does. Leave it out and the campaign registers as standard, the higher-fee tier, with no error.

### Features

* **api:** sync OpenAPI spec from production ([3913d60](https://github.com/sentdm/sent-dm-ruby/commit/3913d6099298feaa278b76ac8a44f7809e13e815))
* **api:** sync OpenAPI spec from production ([cb9fb87](https://github.com/sentdm/sent-dm-ruby/commit/cb9fb87ae298bc8c33adcc9f3960102215502d47))
* **api:** sync OpenAPI spec from production ([8690f90](https://github.com/sentdm/sent-dm-ruby/commit/8690f905c974d5c45da6f6b1c9b0883b550c871f))
* **sdk:** expose the delivered webhook payloads as models ([4b43f3f](https://github.com/sentdm/sent-dm-ruby/commit/4b43f3f16729ec3ee3736149308ffc7ada08480a))


### Chores

* add eager seal-dispatch workflow ([c005db3](https://github.com/sentdm/sent-dm-ruby/commit/c005db35357a408367f76e964e00912f5fc83116))

## [0.26.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.25.0...v0.26.0) (2026-08-08)


### Features

* **api:** sync OpenAPI spec from production ([2a92d9a](https://github.com/sentdm/sent-dm-ruby/commit/2a92d9a1b29d11d5e4bc57e8119a50b9710a90fe))


### Chores

* mark GitHub Releases as stable releases (prerelease: false) ([153cbe6](https://github.com/sentdm/sent-dm-ruby/commit/153cbe6938b8bc6ad8f593b43103982ffa716148))

## [0.25.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.24.0...v0.25.0) (2026-07-07)


### Features

* enable release-please releases and back-sync trigger ([fa11d84](https://github.com/sentdm/sent-dm-ruby/commit/fa11d84c774c4f15e7314d15fa6c32f9e03a679a))
* initial stlc build ([e0debc2](https://github.com/sentdm/sent-dm-ruby/commit/e0debc2ec4eeac66206d8b16c5a1269272f7072c))
* stlc SDK generation pipeline (workspace, workflows, setup action) ([d7bec91](https://github.com/sentdm/sent-dm-ruby/commit/d7bec91bda777c44961d42a464cb507fa2e3fb3c))


### Chores

* add promote, back-sync, and trunk-lock workflows ([7629b2d](https://github.com/sentdm/sent-dm-ruby/commit/7629b2d33a0fac8d11aa01e4204e3ac90037333d))
* add release back-sync trigger workflow ([f3fed43](https://github.com/sentdm/sent-dm-ruby/commit/f3fed436972793fc49aba34c86ba25408757ca49))
* drop fork-only ruby-readme extra-file (unsupported by stock release-please) ([ffbcf4b](https://github.com/sentdm/sent-dm-ruby/commit/ffbcf4b3be85003f44de972e96442324330046cd))

## 0.24.0 (2026-07-02)

Full Changelog: [v0.23.0...v0.24.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.23.0...v0.24.0)

### Features

* **api:** api update ([d00bd3a](https://github.com/sentdm/sent-dm-ruby/commit/d00bd3a7ab4b86431bde9f69cd95b66cf549316f))

## 0.23.0 (2026-06-30)

Full Changelog: [v0.22.1...v0.23.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.22.1...v0.23.0)

### Features

* **api:** api update ([441c4bd](https://github.com/sentdm/sent-dm-ruby/commit/441c4bdaabc474360f4ad3efd5a1805948e95686))
* **api:** api update ([702b196](https://github.com/sentdm/sent-dm-ruby/commit/702b196e3037740b8980f60bc4c67719d582d261))


### Chores

* **internal:** bound formatter parallelism to CPU count ([65b5f68](https://github.com/sentdm/sent-dm-ruby/commit/65b5f68b53b42df10db46a2ed2b5f1a26cc0949b))

## 0.22.1 (2026-06-18)

Full Changelog: [v0.22.0...v0.22.1](https://github.com/sentdm/sent-dm-ruby/compare/v0.22.0...v0.22.1)

### Bug Fixes

* **client:** send content-type header for requests with an omitted optional body ([cc8d5d4](https://github.com/sentdm/sent-dm-ruby/commit/cc8d5d4eaae4eb4077d2be62c7ed4ca676f49789))

## 0.22.0 (2026-05-21)

Full Changelog: [v0.21.0...v0.22.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.21.0...v0.22.0)

### Features

* **api:** api update ([519290b](https://github.com/sentdm/sent-dm-ruby/commit/519290b8037e9687700578e964b7647a3a144673))
* **api:** api update ([f0bb49f](https://github.com/sentdm/sent-dm-ruby/commit/f0bb49f1b22a80e21f4d8ad19e2d7590b180239e))

## 0.21.0 (2026-05-14)

Full Changelog: [v0.20.0...v0.21.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.20.0...v0.21.0)

### Features

* **api:** manual updates ([7d43ce8](https://github.com/sentdm/sent-dm-ruby/commit/7d43ce874785a1f807876fe11a8ad90b53e9acdc))

## 0.20.0 (2026-05-14)

Full Changelog: [v0.19.0...v0.20.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.19.0...v0.20.0)

### Features

* **api:** manual updates ([f9d7ba9](https://github.com/sentdm/sent-dm-ruby/commit/f9d7ba98c6a8a0fc22eff4d019b3ce4a319ff8c4))

## 0.19.0 (2026-05-14)

Full Changelog: [v0.18.0...v0.19.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.18.0...v0.19.0)

### Features

* **api:** api update ([77b9ef0](https://github.com/sentdm/sent-dm-ruby/commit/77b9ef0062e98c2d3d0531614a31ee61db897df9))


### Bug Fixes

* **client:** elide content type header on requests without body ([b0f835e](https://github.com/sentdm/sent-dm-ruby/commit/b0f835eb138baa4aabbb2d68b4799d9815e257c3))

## 0.18.0 (2026-04-29)

Full Changelog: [v0.17.0...v0.18.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.17.0...v0.18.0)

### Features

* **api:** api update ([144871d](https://github.com/sentdm/sent-dm-ruby/commit/144871d5fdd3214a7467a468519b392d759a6ada))

## 0.17.0 (2026-04-29)

Full Changelog: [v0.16.0...v0.17.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.16.0...v0.17.0)

### Features

* **api:** manual updates ([e91662c](https://github.com/sentdm/sent-dm-ruby/commit/e91662c693727bff3e0179be1b513532aeb168d3))

## 0.16.0 (2026-04-28)

Full Changelog: [v0.15.1...v0.16.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.15.1...v0.16.0)

### Features

* support setting headers via env ([b5821b8](https://github.com/sentdm/sent-dm-ruby/commit/b5821b85bbb068d7625094c579dc26976700c4fb))

## 0.15.1 (2026-04-24)

Full Changelog: [v0.15.0...v0.15.1](https://github.com/sentdm/sent-dm-ruby/compare/v0.15.0...v0.15.1)

### Chores

* **internal:** more robust bootstrap script ([295a55c](https://github.com/sentdm/sent-dm-ruby/commit/295a55c2246fead59e17035e49bbff82c001f860))

## 0.15.0 (2026-04-21)

Full Changelog: [v0.14.0...v0.15.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.14.0...v0.15.0)

### Features

* **api:** api update ([766fd2a](https://github.com/sentdm/sent-dm-ruby/commit/766fd2ab76879a691e35141696b5ea2d2acbb3fc))

## 0.14.0 (2026-04-20)

Full Changelog: [v0.13.1...v0.14.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.13.1...v0.14.0)

### Features

* **api:** api update ([27832ee](https://github.com/sentdm/sent-dm-ruby/commit/27832ee8fb7acf613d181af0a485f79d6523ed26))

## 0.13.1 (2026-04-10)

Full Changelog: [v0.13.0...v0.13.1](https://github.com/sentdm/sent-dm-ruby/compare/v0.13.0...v0.13.1)

### Bug Fixes

* multipart encoding for file arrays ([3bf860f](https://github.com/sentdm/sent-dm-ruby/commit/3bf860f577ef213e769f932545dfe961183ccee9))

## 0.13.0 (2026-04-07)

Full Changelog: [v0.12.1...v0.13.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.12.1...v0.13.0)

### Features

* **api:** api update ([a5d4400](https://github.com/sentdm/sent-dm-ruby/commit/a5d440003671bb86cc0a0df1bdf9589b6ffa96f1))

## 0.12.1 (2026-04-03)

Full Changelog: [v0.12.0...v0.12.1](https://github.com/sentdm/sent-dm-ruby/compare/v0.12.0...v0.12.1)

### Bug Fixes

* align path encoding with RFC 3986 section 3.3 ([23356d5](https://github.com/sentdm/sent-dm-ruby/commit/23356d59410d9fb4e51d5a0c2fac41ebf8e7b4ad))
* variable name typo ([f8be0fa](https://github.com/sentdm/sent-dm-ruby/commit/f8be0faad28f663de88afa1bea075b5c7c139cca))

## 0.12.0 (2026-03-31)

Full Changelog: [v0.11.1...v0.12.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.11.1...v0.12.0)

### Features

* **api:** manual updates ([2b0638c](https://github.com/sentdm/sent-dm-ruby/commit/2b0638c7c22e0f309c769f2ca45ce4c9d9932849))

## 0.11.1 (2026-03-31)

Full Changelog: [v0.11.0...v0.11.1](https://github.com/sentdm/sent-dm-ruby/compare/v0.11.0...v0.11.1)

### Bug Fixes

* **internal:** correct multipart form field name encoding ([f7565bc](https://github.com/sentdm/sent-dm-ruby/commit/f7565bc81745d8eeb2319554d783b4ff8622aeea))


### Chores

* **ci:** support opting out of skipping builds on metadata-only commits ([a7b09ef](https://github.com/sentdm/sent-dm-ruby/commit/a7b09ef0bc8d45db861446221594acd016193d04))

## 0.11.0 (2026-03-25)

Full Changelog: [v0.10.1...v0.11.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.10.1...v0.11.0)

### Features

* **api:** api update ([a135bb7](https://github.com/sentdm/sent-dm-ruby/commit/a135bb7e7d7d58b2a021350e40d31caef272e1d8))
* **api:** api update ([28c1518](https://github.com/sentdm/sent-dm-ruby/commit/28c1518edc74bc69e75c26927e3cc10694080863))


### Chores

* **ci:** skip lint on metadata-only changes ([deb319b](https://github.com/sentdm/sent-dm-ruby/commit/deb319b2a4165820342151a807d6f76577d64dda))
* **internal:** update gitignore ([6b93a57](https://github.com/sentdm/sent-dm-ruby/commit/6b93a579755f49944db2dd97f1719b6b0bf4fa7f))

## 0.10.1 (2026-03-17)

Full Changelog: [v0.10.0...v0.10.1](https://github.com/sentdm/sent-dm-ruby/compare/v0.10.0...v0.10.1)

### Chores

* **internal:** tweak CI branches ([1501c04](https://github.com/sentdm/sent-dm-ruby/commit/1501c0468926ce395397078436bc75effdb20aa5))

## 0.10.0 (2026-03-16)

Full Changelog: [v0.9.0...v0.10.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.9.0...v0.10.0)

### Features

* **api:** api update ([10ca37a](https://github.com/sentdm/sent-dm-ruby/commit/10ca37a59d73cdfa1b27243efb26c7a624474d1d))

## 0.9.0 (2026-03-12)

Full Changelog: [v0.8.0...v0.9.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.8.0...v0.9.0)

### Features

* **api:** manual updates ([85587e2](https://github.com/sentdm/sent-dm-ruby/commit/85587e2b3c4ecce4b78886ffa3d5f6cd24565308))

## 0.8.0 (2026-03-12)

Full Changelog: [v0.7.0...v0.8.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.7.0...v0.8.0)

### Features

* **api:** api update ([f25ebae](https://github.com/sentdm/sent-dm-ruby/commit/f25ebae4c9713c74d6958d1bc3bc83bec52db1a9))
* **api:** manual updates ([7700a0e](https://github.com/sentdm/sent-dm-ruby/commit/7700a0e6b7a4a8e68a4d4bc7fdad40bc51302fcc))
* **api:** manual updates ([3101223](https://github.com/sentdm/sent-dm-ruby/commit/3101223023d236a6b3006f4c9847badc5a98dbab))

## 0.7.0 (2026-03-11)

Full Changelog: [v0.6.0...v0.7.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.6.0...v0.7.0)

### Features

* **api:** api update ([ca96b29](https://github.com/sentdm/sent-dm-ruby/commit/ca96b2943f08c60dcbe3c7d9b2f4afe8af9b14d6))
* **api:** manual updates ([df62aff](https://github.com/sentdm/sent-dm-ruby/commit/df62affd4c31572d0fb8a4bc6b2787cfaabea4f2))
* **api:** manual updates ([843dfa8](https://github.com/sentdm/sent-dm-ruby/commit/843dfa8613623db67382955ee3ba5f116f945f21))


### Bug Fixes

* properly mock time in ruby ci tests ([4c4ebe0](https://github.com/sentdm/sent-dm-ruby/commit/4c4ebe03e980346d3ecc508e2740ad2ded666a8e))


### Chores

* **ci:** add build step ([e67706a](https://github.com/sentdm/sent-dm-ruby/commit/e67706ab8895b76ca683a3e2e47244650be6aca0))
* **ci:** skip uploading artifacts on stainless-internal branches ([1d6bb94](https://github.com/sentdm/sent-dm-ruby/commit/1d6bb94d3b4eb5b4383827200ead9f557c39c72f))
* **internal:** codegen related update ([0dd8713](https://github.com/sentdm/sent-dm-ruby/commit/0dd871352c089d8e40788912ba5c1eec907f4640))
* **internal:** codegen related update ([7b3ead8](https://github.com/sentdm/sent-dm-ruby/commit/7b3ead8de1ffc36ea448af5eed97ac1fc4f462bb))

## 0.6.0 (2026-03-11)

Full Changelog: [v0.5.0...v0.6.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.5.0...v0.6.0)

### Features

* **api:** manual updates ([df62aff](https://github.com/sentdm/sent-dm-ruby/commit/df62affd4c31572d0fb8a4bc6b2787cfaabea4f2))

## 0.5.0 (2026-03-11)

Full Changelog: [v0.4.0...v0.5.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.4.0...v0.5.0)

### Features

* **api:** manual updates ([bdd5b4e](https://github.com/sentdm/sent-dm-ruby/commit/bdd5b4efe70096707888663254558a55d1a3c03b))

## 0.4.0 (2026-03-11)

Full Changelog: [v0.3.1...v0.4.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.3.1...v0.4.0)

### Features

* **api:** api update ([bd1c867](https://github.com/sentdm/sent-dm-ruby/commit/bd1c86786ab541d177d0dab68b56a584becadafd))

## 0.3.1 (2026-03-11)

Full Changelog: [v0.3.0...v0.3.1](https://github.com/sentdm/sent-dm-ruby/compare/v0.3.0...v0.3.1)

### Bug Fixes

* properly mock time in ruby ci tests ([4c4ebe0](https://github.com/sentdm/sent-dm-ruby/commit/4c4ebe03e980346d3ecc508e2740ad2ded666a8e))


### Chores

* **ci:** add build step ([e67706a](https://github.com/sentdm/sent-dm-ruby/commit/e67706ab8895b76ca683a3e2e47244650be6aca0))
* **ci:** skip uploading artifacts on stainless-internal branches ([1d6bb94](https://github.com/sentdm/sent-dm-ruby/commit/1d6bb94d3b4eb5b4383827200ead9f557c39c72f))
* **internal:** codegen related update ([0dd8713](https://github.com/sentdm/sent-dm-ruby/commit/0dd871352c089d8e40788912ba5c1eec907f4640))
* **internal:** codegen related update ([7b3ead8](https://github.com/sentdm/sent-dm-ruby/commit/7b3ead8de1ffc36ea448af5eed97ac1fc4f462bb))

## 0.3.0 (2026-02-18)

Full Changelog: [v0.2.0...v0.3.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.2.0...v0.3.0)

### Features

* **api:** manual updates ([e674172](https://github.com/sentdm/sent-dm-ruby/commit/e674172971f06d5616165303b01e6c0a24cf3744))
* **api:** manual updates ([6262e32](https://github.com/sentdm/sent-dm-ruby/commit/6262e327f30368608f29890d469c0352b9da80c8))
* **api:** manual updates ([33fff26](https://github.com/sentdm/sent-dm-ruby/commit/33fff2647eb26bde013600c8632b160a46f1eb73))

## 0.2.0 (2026-02-16)

Full Changelog: [v0.1.0...v0.2.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.1.0...v0.2.0)

### Features

* **api:** manual updates ([2bbf0b7](https://github.com/sentdm/sent-dm-ruby/commit/2bbf0b7eb75ea163ba7694d3e79d71b5d0e2b804))

## 0.1.0 (2026-02-10)

Full Changelog: [v0.0.3...v0.1.0](https://github.com/sentdm/sent-dm-ruby/compare/v0.0.3...v0.1.0)

### Features

* **api:** api update ([6cf3a01](https://github.com/sentdm/sent-dm-ruby/commit/6cf3a01e1aba9d12465f2880227871d26d7858d0))


### Bug Fixes

* **client:** loosen json header parsing ([91563cf](https://github.com/sentdm/sent-dm-ruby/commit/91563cf9d069d31dd7bb7922d39f58d28723dd17))

## 0.0.3 (2026-02-04)

Full Changelog: [v0.0.2...v0.0.3](https://github.com/sentdm/sent-dm-ruby/compare/v0.0.2...v0.0.3)

### Bug Fixes

* **client:** always add content-length to post body, even when empty ([8ca90a2](https://github.com/sentdm/sent-dm-ruby/commit/8ca90a2ac5b0e539a79049be404c303429dd0776))


### Chores

* **docs:** remove www prefix ([9e13671](https://github.com/sentdm/sent-dm-ruby/commit/9e13671f1324f6963121b724d5afc9e30d7ed03f))

## 0.0.2 (2026-01-28)

Full Changelog: [v0.0.1...v0.0.2](https://github.com/sentdm/sent-dm-ruby/compare/v0.0.1...v0.0.2)

### Chores

* sync repo ([37ed46c](https://github.com/sentdm/sent-dm-ruby/commit/37ed46c02177ecd6643f3af1fc53c65f14faebfd))
* update SDK settings ([88c338d](https://github.com/sentdm/sent-dm-ruby/commit/88c338dab0c0e00dd2eaa5904a399b8c93bfa364))
* update SDK settings ([2ea12ef](https://github.com/sentdm/sent-dm-ruby/commit/2ea12efdcc7bb6a502e7661b6a675f371a982043))
