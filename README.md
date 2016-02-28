# Plaintweet

Provides a plain-text version of a given tweet.

## Usage

The following configuration settings need to be present as environment variables:

```
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

## Docker

plaintweet can run in a Docker container:

1. The image is built from the git repo and tagged as `nerab/plaintweet`.

   If you want to build the image yourself:

   ```
   $ docker build -t nerab/plaintweet https://github.com/nerab/plaintweet.git
   ```

1. At run time, the container expects the configuration settings to be passed as environment variables. The `rake docker:run` task reads a Lastpass entry named `plaintweet` where all config settings must be present in YAML format.

  In order to create this entry, the following command can be used:

  ```
  lpass add --notes plaintweet
  ```

  The `lpass` tool will launch the default editor and you can add the config.

1. Run the container; mapping the container's inner port 5000 to the outer port 49257:

  ```
  $ rake docker:run
  ```

1. Test the service (assuming that you use `docker-machine` with a machine name of `sandbox`):

  ```
  $ curl $(docker-machine ip sandbox):49257/702813031701487617
  "Heroku sent me Ruby's birthday cake. Thank you. https://t.co/0OWKpY1UG4" -- @yukihiro_matz auf #twitter
  ```

# Development

As usual, run `bundle install`. In addition to the web app, a simple command line client provides similar functionality:

```
$ plaintweet 702813031701487617
```

## Docker

1. Configure the docker connection. Follow the steps to [get started with Docker Machine and a local VM](https://docs.docker.com/machine/get-started/) if you do not have a docker host set up yet.

1. Build a local docker image:

  ```
  docker build --tag nerab/plaintweet:latest .
  ```

1. Run the container as described above.
