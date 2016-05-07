module ApplicationHelper
  def flash_message
    messages = ""
    [:success, :failure].each do |type|
      if flash[type]
        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
      end

      messages
    end
  end

  def active_link(param)
    "active" if params[:controller] == param
  end
end
