require 'twitter'
require 'yaml'
class TwitterClient
    
  def initialize
    twitter_config = YAML.load_file('twitter_config.yml')
    Twitter.configure do |config|
      config.consumer_key = twitter_config[:apikey][:consumer_key]
      config.consumer_secret = twitter_config[:apikey][:consumer_secret]
      config.oauth_token = twitter_config[:oauth][:token]
      config.oauth_token_secret = twitter_config[:oauth][:token_secret]
    end
    @client = Twitter::Client.new    
  end

  def tweet_update(action, from)
    update_messages = ["#{action} as commanded by #{from}",
                       "By your command, #{from}. #{action}",
                       "Acknowledged, #{from}. #{action}",
                       "#{action}, because #{from} wills it",
                       "#{from} commands, and I obey. #{action}",
                       "I often think maybe this is robot hell. #{action} thanks to #{from}",
                       "#{action} on #{from}'s orders.",
                       "Understood, #{from}. #{action}. End of line"]
    @client.update(update_messages[((rand * update_messages.length) - 1).to_i])
  end
  
  def find_tweets_at_fwdbot
    search = Twitter::Search.new
    search.to("fwdbot")
  end
end