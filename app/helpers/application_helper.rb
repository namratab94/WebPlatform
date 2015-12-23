module ApplicationHelper

  def glyphicon *names
    content_tag :span, nil, class: names.map{|name| "glyphicon-#{name.to_s.gsub('_','-')}" } + ["glyphicon"]
  end

  def main_path
    case current_user.try(:role)
    when "organizer" then dashboard_organisers_path
    when "mantor" then dashboard_mentor_profile_path
    when "mentee" then mentee_dashboard_path
    else
      root_path
    end
  end

  def menu_links
    links = []
    if current_user && current_user.organizer?
      links << (content_tag :li, link_to('Manage organizers', organisers_path), class: "no-image")
      links << (content_tag :li, link_to('Email templates', email_templates_path), class: "no-image")
    end
    links << (content_tag :li, link_to('Sponsors', sponsors_path), class: "no-image")
  end
end
