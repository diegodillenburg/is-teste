module ApplicationHelper
  def flash_messages
    messages = ""
    flash.each do |key, value|
        messages += "<div class=\"alert alert-#{key}\">#{value}</div>"
    end

    messages
  end

  def active_link(param)
    "active" if params[:controller] == param
  end
end
