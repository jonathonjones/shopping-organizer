#Independent Factories

Factory.define :user do |u|
  
end

#Dependent Factories

Factory.define :shopping_list do |s|
  s.association   :user
end