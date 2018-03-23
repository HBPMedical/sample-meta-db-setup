[![CHUV](https://img.shields.io/badge/CHUV-LREN-AF4C64.svg)](https://www.unil.ch/lren/en/home.html) [![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/LREN-CHUV/sample-meta-db-setup/blob/master/LICENSE) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/c3ca609e0e51436d9a3278e6cea41432)](https://www.codacy.com/app/hbp-mip/sample-meta-db-setup?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=LREN-CHUV/sample-meta-db-setup&amp;utm_campaign=Badge_Grade)
[![CircleCI](https://circleci.com/gh/LREN-CHUV/sample-meta-db-setup.svg?style=svg)](https://circleci.com/gh/LREN-CHUV/sample-meta-db-setup)

# Setup for database 'meta-db' with the selection of variables for sample-data-db

## Introduction

This Docker image uses Flyway to manage the database migration scripts for the 'meta-db' database used by MIP.

This database contains the metadata for sample data useful for testing and debugging purpose.

## Usage

Run:

```console
$ docker run -i -t --rm -e FLYWAY_HOST=`hostname` hbpmip/sample-meta-db-setup:0.6.0 migrate
```

where the environment variables are:

* FLYWAY_HOST: database host, default to 'db'.
* FLYWAY_PORT: database port, default to 5432.
* FLYWAY_DATABASE_NAME: name of the database or schema, default to 'meta'
* FLYWAY_URL: JDBC url to the database, constructed by default from FLYWAY_DBMS, FLYWAY_HOST, FLYWAY_PORT and FLYWAY_DATABASE_NAME
* FLYWAY_DRIVER: Fully qualified classname of the jdbc driver (autodetected by default based on flyway.url)
* FLYWAY_USER: database user, default to 'meta'.
* FLYWAY_PASSWORD: database password, default to 'meta'.
* FLYWAY_SCHEMAS: Optional, comma-separated list of schemas managed by Flyway
* FLYWAY_TABLE: Optional, name of Flyway's metadata table (default: schema_version)

## Build

Run: `./build.sh`

## Publish on Docker Hub

Run: `./publish.sh`

## License

### sample-meta-db-setup

(this project)

Copyright (C) 2017 [LREN CHUV](https://www.unil.ch/lren/en/home.html)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

### Flyway

Copyright (C) 2016-2017 [Boxfuse GmbH](https://boxfuse.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

## Trademark
Flyway is a registered trademark of [Boxfuse GmbH](https://boxfuse.com).

# Acknowledgements

This work has been funded by the European Union Seventh Framework Program (FP7/2007­2013) under grant agreement no. 604102 (HBP)

This work is part of SP8 of the Human Brain Project (SGA1).
