class CreateFriendsLists < ActiveRecord::Migration
  def self.up
    create_table :friends_lists do |t|
      t.string :user_id
      t.string :friend_id
      t.string :accepted

      t.timestamps
    end
  end

  def self.down
    drop_table :friends_lists
  end
end
