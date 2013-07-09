class Tweet < ActiveRecord::Base
  belongs_to :twitter_user

  validates :tweet_content, :sent_at, :twitters_id, :presence => true
  validates_uniqueness_of :twitters_id
end
