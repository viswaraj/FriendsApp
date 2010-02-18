# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title (title)
     content_for (:title) {title}
  end

    def show_notices
    notice  = flash[:notice]
    error   = flash[:error]
    success = flash[:success]

    # unset the flash variables so they don't appear on the next page
    flash[:notice] = nil
    flash[:error] = nil
    flash[:success] = nil

    return "<p id='flash_success'><strong>#{success}</strong></p>" if !success.blank?
    return "<p id='flash_error'><strong>#{error}</strong></p>" if !error.blank?
    return "<p id='flash_notice'><strong>#{notice}</strong></p>" if !notice.blank?
  end
end
