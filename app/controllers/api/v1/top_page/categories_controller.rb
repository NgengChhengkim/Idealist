class Api::V1::TopPage::CategoriesController < ApiController
  def index
    categories = Category.order_sort.includes :published_articles
    render json: {
      success: true,
      categories: ActiveModel::Serializer::CollectionSerializer.new(
        categories, serializer: Api::V1::TopPage::CategorySerializer
      )
    }
  end
end
