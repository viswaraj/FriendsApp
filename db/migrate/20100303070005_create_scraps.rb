class CreateScraps < ActiveRecord::Migration
  def self.up
    create_table :scraps do |t|
      t.string :user_id
      t.string :friend_id
      t.string :scrap_message
      t.timestamps
    end
  end

  def self.down
    drop_table :scraps
  end
end
