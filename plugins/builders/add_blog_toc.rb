class AddBlogTOC < SiteBuilder
  def build
    generator do
      site.collections.posts.resources.each do |resource|
        # inject TOC
        resource.content = "* .\n{:toc}\n\n#{resource.content}"
      end
    end
  end
end
