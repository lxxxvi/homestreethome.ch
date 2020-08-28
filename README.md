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

### Start backend server

```shell
bin/rails s
```

... then open [http://localhost:300](http://localhost:300) in your browser. Manage the releases here.


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

## Frontend

1. Export the releases using the rake task `bin/rails export:releases:as_json`. This writes the data to `./frontend/public/releases.json`, where the Frontend App consumes it.
2. Change to the frontend directory: `cd ./frontend`
3. Install node packages `yarn install`
4. Start the server `yarn serve`
5. Open [http://localhost:8080](http://localhost:8080) in a browser

Note that the frontend only _displays_ data. If there are changes we have to change it in the backend (see above) and then repeat step 1 here.


## Deploy

After managing the releases, the changes can be deployed using this command

```shell
bin/build_and_deploy
```

In order to deploy you should have corresponding privileges on DockerHub Repository `lxxxvi/homestreethome` and on fly.io.
