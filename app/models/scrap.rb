class Scrap < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo , :styles => { :small => "140*150>" }
end
