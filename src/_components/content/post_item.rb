module Content
  class PostItem < SiteComponent
    option :post
    option :reading_time_only, default: ->{ false }

    def post_minutes
      [helpers.reading_time(@post.content), 1].max
    end
  end
end
