Given /^I have created a shopping list with a name of "([^"]*)"$/ do |name|
  Factory.create(:shopping_list, :user => @current_user, :name => name)
end
