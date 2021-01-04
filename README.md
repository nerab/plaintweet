# Plaintweet

[![Build Status](https://travis-ci.org/nerab/plaintweet.svg?branch=master)](https://travis-ci.org/nerab/plaintweet)

Provides a plain-text version of a given tweet.

## Usage

The following configuration settings need to be present as environment variables:

```bash
export TWITTER_CONSUMER_KEY=********
export TWITTER_CONSUMER_SECRET=********
```

Then, the web app can be started:

```
$ rackup
```

Now we can show the plaintext version of a tweet, passing its id:

```
$ curl localhost:9292/702813031701487617
```

# Development

As usual, run `bundle install`. In addition to the web app, a simple command line client provides similar functionality:

```
$ plaintweet 702813031701487617
```
