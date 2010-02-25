class User < ActiveRecord::Base
  acts_as_authentic
 has_many :friends_list
has_many :friends, :through => :friends_list
  GENDER_U = "u"
	GENDER_M = "m"
	GENDER_F = "f"
	GENDER = [["Unsure", GENDER_U], ["Male", GENDER_M], ["Female", GENDER_F]]
  RSTATUS = [["no asnswer", "na"], ["single", "s"], ["married", "m"],["committed","c"],["open marriage","op"],["open relationship","or"]]

  def name
		"#{first_name.capitalize} #{last_name.capitalize unless last_name.nil?}"unless first_name.nil?
	end
end
