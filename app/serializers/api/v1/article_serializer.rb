class Api::V1::ArticleSerializer < ApiSerializer
  attributes :image_url, :title, :published_at, :content

  def published_at
    I18n.l object.published_at, format: :long
  end
end
