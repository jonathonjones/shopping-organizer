class ShoppingList < ActiveRecord::Base

  belongs_to :user
  has_many :list_items

  validates_presence_of :user_id, :name
  validates_uniqueness_of :name, :scope => :user_id

  def consolidate
    safe_items = []
    self.list_items.each do |item|
      safe_items << item
      self.list_items.where(:name => item.name, :unit => item.unit).each do |similar_item|
        unless safe_items.include?(similar_item)
          item.amount += similar_item.amount
          item.save
          similar_item.delete
        end
      end
    end
  end
end
