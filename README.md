# records.homestreethome.ch

This is the [Rails](https://rubyonrails.org/) project to the Home Street Home music label's webpage [https://records.homestreethome.ch]().
We  manage our records on Discogs, this project takes the data from there and displays it.

## Prerequisites

* Ruby (see version in `./ruby-version`)
* Postgres
* Node (`>= 12`)
* Yarn

## Setup

```shell
bin/setup
```

## Tests

```shell
bin/test
```

## Run locally

### Discogs Token

Set an environment variable named `DISCOGS_TOKEN`, assign a valid Discogs Token.
You need to use your personal token, it's free. You simply have to have/create an account on Discogs.
Your personal Discogs token can then be obtained [here](https://www.discogs.com/settings/developers).

```shell
export DISCOGS_TOKEN=[...your-token...]
```

### Start server

```shell
bin/rails s
```

#### Start webpack-dev-server (optional)

To watch and compile JavaScript and CSS changes as the server is running you may want to run `webpack-dev-server` in a **separate** session.

```shel
bin/webpack-dev-server
```

### Synchronize Discogs

There's a rake task that fetches data from Discogs and stores it in the local database.
This only works if you have your `DISCOGS_TOKEN` configured (see above).

```shell
bin/rails discogs:synchronize
```
