module Shared
  class Head < SiteComponent
    option :metadata
    option :title

    def page_title
      (title.present? && title != "Index" ? title : "").then do |str|
        strip_html strip_newlines(str)
      end.html_safe
    end
  end
end
