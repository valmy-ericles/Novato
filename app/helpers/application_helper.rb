module ApplicationHelper
  def helper_status(status)
    if status
      content_tag(:span, 'Active', class: 'badge badge-pill badge-primary')
    else
      content_tag(:span, 'Inactive', class: 'badge badge-pill badge-danger')
    end
  end

  def helper_status_enum_user(user)
    if user.approved?
      content_tag(:span, 'Ativado', class: 'badge badge-pill badge-primary')
    else
      content_tag(:span, 'Desativado', class: 'badge badge-pill badge-danger')
    end
  end

  def helper_status_enum_employer(employer)
    if employer.approved?
      content_tag(:span, 'Ativado', class: 'badge badge-pill badge-primary')
    else
      content_tag(:span, 'Desativado', class: 'badge badge-pill badge-danger')
    end
  end

  def logged_facebook(user)
    user.provider.blank?
  end
end
