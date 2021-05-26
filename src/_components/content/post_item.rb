module Content
  class PostItem < Bridgetown::Component
    def initialize(post:)
      @post = post
    end

    def post_minutes
      [helpers.reading_time(@post.content), 1].max
    end
  end
end
