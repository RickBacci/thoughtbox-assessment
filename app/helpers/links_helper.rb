module LinksHelper
  def link_status(link)
    return "Read" if link.status
    "Unread"
  end
end
