# twupdate

twupdate is a command line twitter update client that uses OAuth to connect to twitter. I use it with QuickSilver on Mac OSX to send twitter updates.

# TODO

* Fix "twupdate (LoadError)" when running twupdate binary from installed gem.
* Support reading consumer and access credentials from ~/.twupdate file (require mode 600) instead of Mac OSX keychain.
* Modify twupdate\_oauth\_setup to print instructions on how to put credentials in Mac OSX keychain or ~/.twupdate.
* Finish documentation.

# Install

twupdate is written in ruby and can be installed as a ruby gem.

    gem install twupdate
    
This will install a binary `twupdate` that can be used to send twitter updates.

# Authentication

Twitter now requires OAuth authentication and no longer supports HTTP Basic Authentication. For this to work you need to register your installation of twupdate as a Twitter Application.

For this you need to

* Login to your twitter account
* Visit https://twitter.com/apps/new

After registering your twupdate client you will receive the following credentials:

* Consumer key
* Consumer secret

Next run `twupdate_oauth_setup`

    twupdate_oauth_setup
    
# Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

# Copyright

Copyright (c) 2010 Klaas Jan Wierenga. See LICENSE for details.
