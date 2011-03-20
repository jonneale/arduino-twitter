require File.join(File.dirname(__FILE__), *%w[lib robot])
require File.join(File.dirname(__FILE__), *%w[lib twitter_client])

robot = Robot.new
client = TwitterClient.new

while true do
  tweets = client.find_tweets_at_fwdbot
  tweets.map{|t| [t.text.downcase, "@#{t.from_user}"]}.each do |tweet, from|
    if (tweet.include?("forward"))
      robot.move_forward
      client.tweet_update("Moving forward", from)
    end
    if (tweet.include?("backward"))
      robot.move_backward
      client.tweet_update("Moving backward", from)
    end
    if (tweet.include?("left"))
      robot.turn_left
      client.tweet_update("Turning left", from)
    end
    if (tweet.include?("right"))
      robot.turn_right
      client.tweet_update("Turning right", from)
    end
    if (tweet.include?("hard left"))
      robot.hard_left
      client.tweet_update("Making a hard left", from)
    end  
    if (tweet.include?("hard right"))
      robot.hard_right
      client.tweet_update("Making a hard right", from)
    end
  end
  sleep 5
end
