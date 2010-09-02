#!/usr/bin/env ruby

TWITTER_CONSUMER_KEY    = `./find-password.sh twitter_consumer_key`.strip
TWITTER_CONSUMER_SECRET = `./find-password.sh twitter_consumer_secret`.strip
TWITTER_ACCESS_TOKEN    = `./find-password.sh twitter_access_token`.strip
TWITTER_ACCESS_SECRET   = `./find-password.sh twitter_access_secret`.strip

require 'rubygems'
require 'twitter'
auth = Twitter::OAuth.new(TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET)
auth.authorize_from_access(TWITTER_ACCESS_TOKEN, TWITTER_ACCESS_SECRET)
client = Twitter::Base.new(auth)

client.update('tweet.sh is working, now back to work :-)')

