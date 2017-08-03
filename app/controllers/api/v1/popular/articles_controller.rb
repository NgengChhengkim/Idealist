class Api::V1::Popular::ArticlesController < ApiController
  def index
    articles = Article.popular.limit Settings.api.per_page.popular_list
    top_article = articles.to_a.take 1
    articles = articles - top_article

    render json: {
      success: true,
      top_article: (Api::V1::ThumbnailArticleSerializer.new(top_article.first) if top_article.present?),
      articles: ActiveModel::Serializer::CollectionSerializer.new(
        articles, serializer: Api::V1::ThumbnailArticleSerializer
      )
    }
  end
end
