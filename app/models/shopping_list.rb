class ShoppingList < ActiveRecord::Base

  belongs_to :user
  has_many :list_items

  validates_presence_of :user_id, :name
  validates_uniqueness_of :name, :scope => :user_id
end
