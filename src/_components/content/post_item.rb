module Content
  class PostItem < Bridgetown::Component
    def initialize(post:)
      @post = post
    end
  end
end
