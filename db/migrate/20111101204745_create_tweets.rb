class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :message
      t.integer :tweet_id
      t.date :tweet_date
      t.references :contact
      t.timestamps
    end
  end
end
