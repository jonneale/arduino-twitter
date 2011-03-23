require 'rubygems'
require 'bundler'
Bundler.require
require File.join(File.dirname(__FILE__), *%w[lib robot])
require File.join(File.dirname(__FILE__), *%w[lib twitter_client])

robot = Robot.new
client = TwitterClient.new

while true do
  tweets = client.find_tweets_at_fwdbot
  puts tweets.count
  puts "------------"
  puts tweets.inspect
  
  tweets.each do |tweet|
    
  end
  
  tweets.map{|t| [t.text.downcase.split, "@#{t.from_user}", t.id]}.each do |tweet_words, from, id|
    tweet_words.each do |word|
      if (robot.respond_to?(tw))
        robot.send(tw)
        client.tweet_update("Moving #{tw}", from, id)
        sleep 1
      end
    end
  end
end
