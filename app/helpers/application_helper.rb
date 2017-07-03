module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def render_stars(value)
    output = ''
    if value.nil?
      output = ''
    else (1..5).include?(value.floor)
      value.floor.times { output += image_tag('star-on.png')}
    end
    output.html_safe
  end

end
