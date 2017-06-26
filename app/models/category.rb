class Category < ActiveRecord::Base
  has_many :articles
  has_many :published_articles, ->{published_order_desc}, class_name: Article.name

  validates :name, :sort_order, presence: true
  validates_numericality_of :sort_order

  scope :order_sort, -> {order sort_order: :asc}
end
