# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(title)
    if @title.blank?
      @title=""
    end
    content_tag 'title',"#{@title}/FriendsApp"
  end
end
