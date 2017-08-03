class Api::V1::TopPage::ArticlesController < ApiController
  def index
    articles = Article.published_order_desc.limit Settings.api.per_page.top_page.latest_list
    top_article = articles.to_a.take 1
    latest_articles = articles - top_article

    render json: {
      success: true,
      top_article: top_article.present? ? Api::V1::ThumbnailArticleSerializer.new(top_article.first) : nil,
      data: ActiveModel::Serializer::CollectionSerializer.new(
        latest_articles, serializer: Api::V1::ThumbnailArticleSerializer
      )
    }
  end
end
