class TwitterClient
    
  def initialize
    @twitter_config = YAML.load_file('twitter_config.yml')
    Twitter.configure do |config|
      config.consumer_key = @twitter_config[:apikey][:consumer_key]
      config.consumer_secret = @twitter_config[:apikey][:consumer_secret]
      config.oauth_token = @twitter_config[:oauth][:token]
      config.oauth_token_secret = @twitter_config[:oauth][:token_secret]
    end
    @client = Twitter::Client.new 
  end

  def tweet_update(action, from, id)
    update_messages = ["#{action} as commanded by #{from}",
                       "By your command, #{from}. #{action}",
                       "Acknowledged, #{from}. #{action}",
                       "#{action}, because #{from} wills it",
                       "#{from} commands, and I obey. #{action}",
                       "I often think maybe this is robot hell. #{action} thanks to #{from}",
                       "#{action} on #{from}'s orders.",
                       "Understood, #{from}. #{action}. End of line"]
    @client.update("#{update_messages[((rand * update_messages.length) - 1).to_i]} ##{id.to_s}")
  end
  
  def last_tweet_id
    @twitter_config[:lasttweet]
  end
  
  def last_tweet_id=(value)
    @twitter_config[:lasttweet] = value
  end
  
  def find_tweets_at_fwdbot
    user = Twitter.user("fwdbot")
    search = Twitter::Search.new   
    result = search.to("fwdbot").since_id(user.status.id).to_a
    search.clear
    result
  end
end