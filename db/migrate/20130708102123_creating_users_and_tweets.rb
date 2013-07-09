class CreatingUsersAndTweets < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.text :twitter_handle
      t.string :user_id

      t.timestamps
    end

    create_table :tweets do |t|
      t.text :tweet_content
      t.belongs_to :twitter_user
      t.time :sent_at
      t.string :twitters_id

      t.timestamps
    end
  end
end
