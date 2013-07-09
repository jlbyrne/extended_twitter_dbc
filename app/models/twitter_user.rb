class TwitterUser < ActiveRecord::Base
  has_many :tweets

  validates :twitter_handle, :user_id, :presence => true
  validates_uniqueness_of :user_id

  def tweets_stale?
    if self.tweets.last
      last_fetched = self.tweets.last.created_at
      (Time.now - last_fetched) > 60
    else
      return true
    end
  end
end
