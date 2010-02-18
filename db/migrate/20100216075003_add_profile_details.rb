class AddProfileDetails < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :relation_status, :string
    add_column :users, :birth_day, :date
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer
    add_column :users, :country, :integer
    add_column :users, :high_school, :string
    add_column :users, :college, :string
    add_column :users, :organisation, :string
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :gender
    remove_column :users, :relation_status
    remove_column :users, :birth_day
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zip
    remove_column :users, :country
    remove_column :users, :high_school
    remove_column :users, :college
    remove_column :users, :organisation
  end
end
