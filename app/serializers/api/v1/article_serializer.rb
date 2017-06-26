class Api::V1::ArticleSerializer < ApiSerializer
  attributes :image_url, :title, :published_at, :content
end
