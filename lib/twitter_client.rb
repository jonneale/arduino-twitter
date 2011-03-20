require 'twitter'
require 'yaml'
class TwitterClient
  
  def initialize
    twitter_config = YAML.load_file('twitter_config.yml')
    Twitter.configure do |config|
      config.consumer_key = twitter_config.apikey.consumer_key
      config.consumer_secret = twitter_config.apikey.consumer_secret
      config.oauth_token = twitter_config.oauth.token
      config.oauth_token_secret = twitter_config.oauth.token_secret
    end
    @client = Twitter::Client.new    
  end

  def tweet_update(from, action)
    @client.update("#{action} as commanded by @#{from}")
  end
  
  def find_tweets_at_fwdbot
    search = Twitter::Search.new
    tweets = search.to("fwdbot")
    search.clear
    tweets
  end
end