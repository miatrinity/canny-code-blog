class AddBlogTOC < SiteBuilder
  def build
    generator do
      site.collections.posts.resources.each do |resource|
        # inject TOC
        puts resource.content
        resource.content = "* .\n{:toc}\n\n#{resource.content}"
      end
    end
  end
end
