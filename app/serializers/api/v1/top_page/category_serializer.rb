class Api::V1::TopPage::CategorySerializer < ActiveModel::Serializer
  attributes :data

  def data
    [{
      key: object.id,
      name: object.name,
      articles: articles
    }]
  end

  def articles
    ActiveModel::Serializer::CollectionSerializer.new(
      object.published_articles.take(Settings.api.top_page.categories.article_list),
      serializer: Api::V1::ArticleSerializer
    )
  end
end
