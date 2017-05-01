# Plaintweet

Provides a plain-text version of a given tweet.

## Usage

The following configuration settings need to be present as environment variables:

```bash
export TWITTER_CONSUMER_KEY=********
export TWITTER_CONSUMER_SECRET=********
export TWITTER_OAUTH_TOKEN=********
export TWITTER_OAUTH_TOKEN_SECRET=********
```

Then, the web app can be started:

```
$ rackup
```

Now we can show the plaintext version of a tweet, passing its id:

```
$ curl localhost:9292/702813031701487617
```

## Deployment

`plaintweet` can run in a Docker container. Deploy it with the following steps:

1. The image is built from the git repo and tagged as `nerab/plaintweet`.

   If you want to build the image yourself:

   ```
   $ docker build -t nerab/plaintweet https://github.com/nerab/plaintweet.git
   ```

1. Run the container; it expects the configuration settings to be passed as environment variables:

  ```bash
  $ docker-compose up -d
  ```

  If you are using additional production settings (e.g. `trafik` as a front-end), add an overlay file like `docker-compose-prod.yml` and run this instead:

  ```bash
  $ docker-compose -f docker-compose.yml -f docker-compose-prod.yml up -d
  ```

1. Test the service (assuming that you use `docker-machine` with a machine name of `default`):

  ```
  $ curl $(docker-machine ip default)/702813031701487617
  "Heroku sent me Ruby's birthday cake. Thank you. https://t.co/0OWKpY1UG4" -- @yukihiro_matz auf #twitter
  ```

# Development

As usual, run `bundle install`. In addition to the web app, a simple command line client provides similar functionality:

```
$ plaintweet 702813031701487617
```

## Re-build the Docker image

1. Configure the docker connection. Follow the steps to [get started with Docker Machine and a local VM](https://docs.docker.com/machine/get-started/) if you do not have a docker host set up yet.

1. Build a local docker image:

  ```
  docker build --tag nerab/plaintweet:latest .
  ```

1. Run the container as described above.
