require 'tweetstream'
require './notification'

class UgPubRunner

  def initialize
    TweetStream.configure do |config|
        config.consumer_key        = "CHANGEME"
        config.consumer_secret     = "CHANGEME"
        config.oauth_token        = 'CHANGEME'
        config.oauth_token_secret = 'CHANGEME'
        config.auth_method        = :oauth
    end

    TweetStream::Client.new.follow(CHANGEME) do |status|
      n = Notification.new()
      n.receive(status.text)
    end
  end


end

UgPubRunner.new
