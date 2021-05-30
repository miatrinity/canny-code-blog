module Content
  class PostItem < Bridgetown::Component
    def initialize(post:, reading_time_only: false)
      @post, @reading_time_only = post, reading_time_only
    end

    def post_minutes
      [helpers.reading_time(@post.content), 1].max
    end
  end
end
