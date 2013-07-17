module ApplicationHelper
  def fellowship_status_link(visitor, visited)
    if visitor == visited
      links = ""
      links.html_safe

    elsif current_user

      links = ""

      fellowship = Fellowship.between_users(visitor, visited)
      case

      when fellowship.nil?
          links << link_to( "Add Coworker", create_fellowship_path(:visited_id => visited.id), :method => :post, :remote => true)

      when fellowship.pending?
        if visitor.id == fellowship.inviter_id
          links << "Request Already Sent"
        elsif visitor.id == fellowship.invited_id
          links << fellowship_update_link(fellowship, visited, Fellowship::STATUSES[:working])
          links << fellowship_update_link(fellowship, visited, Fellowship::STATUSES[:rejected])
        end

      when fellowship.working?
          links << "I'm your Coworker"
          links << fellowship_update_link(fellowship, visited, Fellowship::STATUSES[:worked])

      when fellowship.worked?
          links << "You've worked with me"
          links << fellowship_update_link(fellowship, visited, Fellowship::STATUSES[:pending])

      end

      links.html_safe

    end
  end

  def fellowship_update_link(fellowship, visited, status)
    link_to "#{status}", update_fellowship_path(:fellowship_id => fellowship.id, :visited_id => visited.id, :status => status)
  end

  def bootstrap_class_for flash_type
    case flash_type
    when :success
      "alert-success"
    when :error
      "alert-error"
    when :alert
      "alert-block"
    when :notice
      "alert-info"
    else
      flash_type.to_s
    end
  end
end
