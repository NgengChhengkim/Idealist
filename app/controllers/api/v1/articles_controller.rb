class Api::V1::ArticlesController < ApiController
  def index
    category = Category.find params[:category_id]
    articles = category.articles.published_order_desc
      .paginate page: params[:page], per_page: Settings.api.per_page.article_list

    if first_page?
      top_article = articles.to_a.take 1
      articles = articles - top_article

      data = {
        top_article: (Api::V1::ThumbnailArticleSerializer.new(top_article.first) if top_article.present?),
        articles: ActiveModel::Serializer::CollectionSerializer.new(
          articles, serializer: Api::V1::ThumbnailArticleSerializer
        )
      }
    else
      data = {
        articles: ActiveModel::Serializer::CollectionSerializer.new(
          articles, serializer: Api::V1::ThumbnailArticleSerializer
        )
      }
    end

    render json: {
      success: true,
      category_name: category.name,
    }.merge(data)
  end

  def show
    article = Article.find params[:id]
    category = article.category

    related_articles = category.articles.published_order_desc
      .except_id(params[:id]).limit Settings.api.per_page.related_articles

    article.update_view_number

    render json: {
      success: true,
      data: Api::V1::ArticleDetailSerializer.new(article),
      related_articles: ActiveModel::Serializer::CollectionSerializer.new(
        related_articles, serializer: Api::V1::ThumbnailArticleSerializer
      )
    }
  end

  private
  def first_page?
    params[:page].nil? || params[:page] == "1"
  end
end
