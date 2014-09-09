WARNING: This is about as production ready as any other 2 hour hack.

Publish your user group/meetup to twitter and have it automatically post to Octopress.

This was written in two hours at a Sheffield Ruby User Group hack session. 
The code is in need of some refactoring.

Original team at SHRUG was [@b_seven_e](https://twitter.com/b_seven_e), 
[@ShadowKoBolt](https://www.twitter.com/ShadowKoBolt), 
[@jamgregory](https://www.twitter.com/jamgregory) and [@ClearCarbon](https://www.twitter.com/ClearCarbon)


# What it does

Currently UG Pub (User Group Publisher) will listen to a twitter stream you provide 
and update an Octopress site based on the tweet. Additionally it will automatically 
insert a link in the specified Octopress post to the venue on google maps.

The tweet must include a specific hash tag to look for and the venue must appear in
quotes (" only).

# Requirements

* Twitter keys
* The machine running UG Pub must have access to the Octopress repository on disk
and have permission to deploy to the Octopress host.

# Getting it working

* update the consumer key-secret pair and oauth token-secret pair in ug_pub_runner.rb
* update #TestUgPubAnnounce to your own hash tag in notification.rb
* update ", Sheffield, UK" to your own city/town in notification.rb
* update your Octopress post template in publisher.rb
* update the path to your Octopress site and the path to the post in publisher.rb
* Run 'ruby ug_pub_runner.rb' in your terminal

# Todo

* Move all config out to separate file or even better ENV variables/figaro
* Actually run 'bundle exec rake deploy' when updating the Octopress site
* Allow posting to more end points (other CMS software, more social networks)
* Allow listening to other end points
* Allow posting directly via the app to support [the Indie Web](http://indiewebify.me/)
* Allow post updates to be generated with templates

Please contribute any improvements back with a pull request.
