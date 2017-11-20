if Rails.env.production?
  $redis = Redis.new(url: ENV["REDIS_URL"])
  #$redis = Redis.new(url: ENV["redis://h:p7e4ea24268157ef930e5bfdc8ec908fd95783f08a2cb7811a6430d527639ed38@ec2-34-227-234-245.compute-1.amazonaws.com:13799"])
else
  $redis = Redis.new(host: 'localhost', port: 6379)
end