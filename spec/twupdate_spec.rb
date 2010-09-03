require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'twupdate'

describe Twupdate do
  
  before(:all) do
    @consumer_key    = 'password: "ljlkjgolikjlkajdsf"'
    @consumer_secret = 'password: "aldkjlashdfiahsdfkjh"'
    @access_token    = 'password: "d0s988uq34lfsdl89agf"'
    @access_secret   = 'password: "870hjk.czndao"'
  end
  
  it "should initialise properly" do
    
    Kernel.should_receive(:`).once.with(/consumer_key/).and_return(@consumer_key)
    Kernel.should_receive(:`).once.with(/consumer_secret/).and_return(@consumer_secret)
    Kernel.should_receive(:`).once.with(/access_token/).and_return(@access_token)
    Kernel.should_receive(:`).once.with(/access_secret/).and_return(@access_secret)
    
    Twupdate.new.should_not be_nil
  end
  
  it "should update the status" do
    Kernel.should_receive(:`).once.with(/consumer_key/).and_return(@consumer_key)
    Kernel.should_receive(:`).once.with(/consumer_secret/).and_return(@consumer_secret)
    Kernel.should_receive(:`).once.with(/access_token/).and_return(@access_token)
    Kernel.should_receive(:`).once.with(/access_secret/).and_return(@access_secret)
    
    twitter_client = mock('TwitterClient')

    Twitter::Base.should_receive(:new).and_return(twitter_client)
    twitter_client.should_receive(:update).with('test tweet')
    
    Twupdate.new.run!('test tweet')
  end
end
