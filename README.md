# cron-docker

[![version)](https://img.shields.io/docker/v/crashvb/cron/latest)](https://hub.docker.com/repository/docker/crashvb/cron)
[![image size](https://img.shields.io/docker/image-size/crashvb/cron/latest)](https://hub.docker.com/repository/docker/crashvb/cron)
[![linting](https://img.shields.io/badge/linting-hadolint-yellow)](https://github.com/hadolint/hadolint)
[![license](https://img.shields.io/github/license/crashvb/cron-docker.svg)](https://github.com/crashvb/cron-docker/blob/master/LICENSE.md)

## Overview

This docker image contains [cron](https://github.com/cronie-crond/cronie).

## Entrypoint Scripts

### cron

The embedded entrypoint script is located at `/etc/entrypoint.d/cron` and performs the following actions:

1. A new cron configuration is generated using the following environment variables:

 | Variable | Default Value | Description |
 | -------- | ------------- | ----------- |
 | CRONTAB\_* | | The contents of `/etc/cron.d/*`. For example, `CRONTAB_FOO` will create `/etc/cron.d/foo`. |
 | CRONTAB\_ENVSUBST\_* | | The contents of `/etc/cron.d/*`. For example, `CRONTAB_ENVSUBST_BAR` will create `/etc/cron.d/bar`, after envsubst has been applied. |
 | CRON\_TRUNCATION\_SCHEDULE | 0 0 &ast; &ast; 0  | Schedule at which to truncate the crontab log. |

## Standard Configuration

### Container Layout

```
/
└─ etc/
   ├─ cron.d/
   ├─ entrypoint.d/
   │  └─ cron
   ├─ healthcheck.d/
   │  └─ cron
   └─ supervisor/
      └─ config.d/
         └─ cron.conf
```

### Exposed Ports

None.

### Volumes

None.

## Development

[Source Control](https://github.com/crashvb/cron-docker)

