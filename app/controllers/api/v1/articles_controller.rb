class Api::V1::ArticlesController < ApiController
  def index
    category = Category.find params[:category_id]
    articles = category.articles.published_order_desc
      .paginate page: params[:page], per_page: Settings.api.per_page.article_list

    render json: {
      success: true,
      category_name: category.name,
      data: ActiveModel::Serializer::CollectionSerializer.new(
        articles, serializer: Api::V1::ArticleSerializer
      )
    }
  end

  def show
    article = Article.find params[:id]
    category = article.category

    render json: {
      success: true,
      data: Api::V1::ArticleDetailSerializer.new(article)
    }
  end
end
