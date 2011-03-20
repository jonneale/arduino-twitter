require 'robot'
require 'twitter_client'

robot = Robot.new
client = TwitterClient.new

while true do
  tweets = client.find_tweets_at_fwdbot
  tweets.map{|t| [t.text.downcase, t.from]}.each do |tweet, from|
    if (tweet.include?("forward")) do
      robot.forward
      client.update("Moving forward", from)
    end
    if (tweet.include?("backward")) do
      robot.backward
      client.update("Moving backward", from)
    end
    if (tweet.include?("left")) do
      robot.left
      client.update("Turning left", from)
    end
    if (tweet.include?("right")) do
      robot.right
      client.update("Turning right", from)
    end
    if (tweet.include?("hard left")) do
      robot.hard_left
      client.update("Making a hard left", from)
    end  
    if (tweet.include?("hard right")) do
      robot.hard_right
      client.update("Making a hard right", from)
    end
  end
  sleep 5
end
