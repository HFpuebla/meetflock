module ApplicationHelper
  def fellowship_status_link(*args)
    if current_user
      visitor = args.first
      visited = args.last
      links = ""
      
      fellowship = Fellowship.where("inviter_id = ? or invited_id = ?", visited.id, visited.id)
      
      
      case 
      when fellowship.nil?
          links << link_to(t("add_as_coworker"), fellowships_path(:invited_id => visited.id), :method => :post)
      when fellowship.pending?
        if visitor.id == fellowship.inviter_id
          links << t("request_sent")
        elsif visitor.id == fellowship.invited_id
          links << link_to(t("accept_request"), update_fellowship_path(:fellowship_id => fellowship.id, :status => Fellowship.STATUSES[:working]))
          links << link_to(t("reject_request"), update_fellowship_path(:fellowship_id => fellowship.id, :status => Fellowship.STATUSES[:rejected]))
        end
      when fellowship.working?
          links << t("currently_working")
          links << link_to(t("stop_working"), update_fellowship_path(:fellowship_id => fellowship.id, :status => Fellowship.STATUSES[:worked]))        

      when fellowship.worked?
          links << t("worked_before")
          links << link_to(t("work_again"), update_fellowship_path(:fellowship_id => fellowship.id, :status => Fellowship.STATUSES[:working]))        
      end
      links.html_safe
    end
  end
end
