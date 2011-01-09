class ListItem < ActiveRecord::Base

  belongs_to :shopping_list

  def amount_display
    if self.amount.to_i.to_f == self.amount.to_f
      self.amount.to_i.to_s
    else
      self.amount.to_f.to_s
    end
  end
end
