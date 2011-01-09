class ListItemUnitAsString < ActiveRecord::Migration
  def self.up
    remove_column "list_items", "unit_id"
    add_column    "list_items", "unit", :string
  end

  def self.down
    add_column "list_items", "unit_id", :integer
    remove_column    "list_items", "unit"
  end
end
