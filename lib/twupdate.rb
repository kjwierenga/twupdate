require 'rubygems'
require 'twitter'

class Twupdate
  
  def initialize
    establish_connection
  end
  
  def establish_connection
    twitter_consumer_key    = password_from_keychain('twitter_consumer_key')
    twitter_consumer_secret = password_from_keychain('twitter_consumer_secret')
    twitter_access_token    = password_from_keychain('twitter_access_token')
    twitter_access_secret   = password_from_keychain('twitter_access_secret')
    
    auth = Twitter::OAuth.new(twitter_consumer_key, twitter_consumer_secret)
    auth.authorize_from_access(twitter_access_token, twitter_access_secret)
    @client = Twitter::Base.new(auth)
  end
  
  def update(msg)
    @client.update(msg)
  end
  
  def run!(*argv)
    update(argv[0])
  end

  private
  
  def get_credentials
  end
  
  def password_from_keychain(key)
    if Kernel::`("security -q find-generic-password -gs #{key} 2>&1 | grep password").strip =~ /^password: \"(.*)\"$/
      password = $1
    else
      raise StandardError
    end
    password
  end
  
end