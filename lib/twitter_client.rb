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
                       "#{action} thanks to #{from}",
                       "#{action} on #{from}'s orders.",
                       "Understood, #{from}. #{action}. End of line"]
    tweet_sent = false
    while(!tweet_sent)
      begin
        @client.update("#{update_messages[rand(update_messages.size)]} ##{id.to_s}")
        tweet_sent = true
      rescue Twitter::Forbidden(e)
        puts e
      end
    end
  end
  
  def tweet_failed(from)
    @client.update("Sorry, @#{from}. I didn't understand you. Please include either forward, backward, left, right or dance in your tweet")
  end
  
  def find_tweets_at_fwdbot
    user = Twitter.user("fwdbot")
    search = Twitter::Search.new   
    result = search.to("fwdbot").since_id(user.status.id).fetch
    search.clear
    result
  end
end