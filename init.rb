require 'rubygems'
require 'bundler'
Bundler.require
require File.join(File.dirname(__FILE__), *%w[lib robot])
require File.join(File.dirname(__FILE__), *%w[lib twitter_client])

robot = Robot.new
client = TwitterClient.new

while true do
  begin
    tweets = client.find_tweets_at_fwdbot
    puts tweets.count
    puts "------------"
    puts tweets.inspect
  
    tweets.map{|t| [t.text.downcase.split, "@#{t.from_user}", t.id]}.each do |tweet_words, from, id|
      tweet_sent = false
      tweet_words.each do |tw|
        if (robot.respond_to?(tw))
          tweet_sent = true
          robot.send(tw)
          client.tweet_update("Moving #{tw}", from, id)
        end
      end
      client.tweet_failed unless tweet_sent
    end
  rescue Exception => e
    puts e
    sleep 5
  end
end
