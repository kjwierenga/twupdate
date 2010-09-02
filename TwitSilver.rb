#!/usr/bin/env ruby 

account = 'kjw'
password = `/Users/kjw/bin/twitpass`
login = "#{account}:#{password.strip!}"
status = ARGV.join(' ')
post_to_twitter = "curl -s --user #{login} --data-binary @- http://twitter.com/statuses/update.json"
growl_command = "/usr/local/bin/growlnotify -H localhost -n Twitter -m " # trailing space required
growl_success = growl_command + "\"#{status}\""

# for future use, once I find out how to the the status from the post_to_twitter command
# growl_failure = growl_command + '"Failed to update Twitter"'

IO.popen(post_to_twitter, "w+") { |io| io.write "status=" + status }
system(growl_success)
