class Api::V1::ThumbnailArticleSerializer < ApiSerializer
  attributes :image_url, :title, :published_at

  def published_at
    I18n.l object.published_at, format: :long
  end
end
