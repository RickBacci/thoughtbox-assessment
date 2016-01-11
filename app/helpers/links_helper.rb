module LinksHelper
  def link_status(link)
    return "Read" if link.status
    "Unread"
  end

  def link_action(link)
    return "Unread" if link.status
    "Read"
  end
end
