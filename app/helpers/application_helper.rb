module ApplicationHelper
  def link_to_with_full_title string, url
    link_to truncate(
              string,
              :length => 65,
              :omission => "..."
            ),
            url,
            :title => string
  end
end
