class Category < ActiveRecord::Base
  has_many :articles

  validates :name, :sort_order, presence: true, uniqueness: true
  validates_numericality_of :sort_order
end
