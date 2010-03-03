class User < ActiveRecord::Base
  has_attached_file :photo , :styles => { :small => "140*150>" }
  acts_as_authentic
  has_many :friends_list
  has_many :scrap
  has_many :friends, :through => :friends_list
belongs_to :country

  GENDER_U = "u"
	GENDER_M = "m"
	GENDER_F = "f"
	GENDER = [["Unsure", GENDER_U], ["Male", GENDER_M], ["Female", GENDER_F]]
  RSTATUS = [["no asnswer", "na"], ["single", "s"], ["married", "m"],["committed","c"],["open marriage","op"],["open relationship","or"]]

  def name
		"#{first_name.capitalize} #{last_name.capitalize unless last_name.nil?}"unless first_name.nil?
	end
end
