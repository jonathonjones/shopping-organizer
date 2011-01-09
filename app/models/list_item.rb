class ListItem < ActiveRecord::Base

  belongs_to :shopping_list

  def ListItem.add_amounts_with_units(first_item, second_item)
    if first_item.unit.blank?
      if second_item.unit.blank?
        total = first_item.amount + second_item.amount
      else
        total = nil
      end
    elsif first_item.unit.pluralize == second_item.unit.pluralize
      total = first_item.amount + second_item.amount
    else
      amounts = (first_item.standard_amount + second_item.standard_amount).round(2)
      total = first_item.convert_number_to_unit(amounts)
    end

    total
  end

  def amount_display
    if self.amount.to_i.to_f == self.amount.to_f
      self.amount.to_i.to_s
    else
      self.amount.to_f.to_s
    end
  end

  def standard_amount
    case self.unit
    when "gram"
      self.amount.grams
    when "ounce"
      self.amount.ounces
    when "pound"
      self.amount.pounds
    when "liter"
      self.amount.liters
    when "bushel"
      self.amount.bushels
    when "cup"
      self.amount.cups
    when "fluid_ounce"
      self.amount.fluid_ounces
    when "gallon"
      self.amount.gallons
    when "pint"
      self.amount.pints
    when "quart"
      self.amount.quarts
    when "tablespoon"
      self.amount.tablespoons
    when "teaspoon"
      self.amount.teaspoons
    else
      self.amount
    end
  end

  def convert_number_to_unit(number)
    case self.unit
    when "gram"
      number.to.grams
    when "ounce"
      number.to.ounces
    when "pound"
      number.to.pounds
    when "liter"
      number.to.liters
    when "bushel"
      number.to.bushels
    when "cup"
      number.to.cup
    when "fluid_ounce"
      number.to.fluid_ounces
    when "gallon"
      number.to.gallons
    when "pint"
      number.to.pints
    when "quart"
      number.to.quarts
    when "tablespoon"
      number.to.tablespoons
    when "teaspoon"
      number.to.teaspoons
    else
      number
    end
  end
end
