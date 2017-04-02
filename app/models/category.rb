class Category < ActiveRecord::Base
  has_many :articles

  validates :name, :sort_order, presence: true
  validates_numericality_of :sort_order

  scope :order_sort, -> {order sort_order: :asc}
end
