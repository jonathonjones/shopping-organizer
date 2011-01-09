#Independent Factories

Factory.define :user do |u|
end

#Dependent Factories

Factory.define :shopping_list do |s|
  s.association   :user
  s.name          'Default Shopping List'
end

Factory.define :list_item do |l|
  l.association   :shopping_list
  l.name          'Default List Item'
end