Given /^I am signed in as "([^"]*)"$/ do |name|
  When "I go to the sign in page"
  And %Q{I press "Sign in as #{name}"}
  @current_user = User.find_by_name(name)
end
