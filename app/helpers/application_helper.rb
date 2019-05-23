module ApplicationHelper

  def auth_token
    "<input
      class='hidden'
      name='authenticity_token'
      value='#{form_authenticity_token}'>".html_safe
  end
end
