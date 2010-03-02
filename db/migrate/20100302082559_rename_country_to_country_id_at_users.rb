class RenameCountryToCountryIdAtUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :country, :country_id
  end

  def self.down
     rename_column :users, :country_id, :country
  end
end
