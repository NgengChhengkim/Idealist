class Api::V1::TopPage::CategorySerializer < Api::V1::CategorySerializer
  attributes :articles

  def articles
    ActiveModel::Serializer::CollectionSerializer.new(
      object.published_articles.take(Settings.api.top_page.categories.article_list),
      serializer: Api::V1::ArticleSerializer
    )
  end
end
