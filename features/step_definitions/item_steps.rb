Given /^I am logged in as "([^"]*)"$/ do |arg1|
  step %{I am on the home page}
  step   %{I follow "Sign up"}
  step   %{I fill in "bob@example.com" for "user_email"}
  step   %{I fill in "Bob" for "user_username"}
  step   %{I fill in "testforbob" for "user_password"}
  step   %{I fill in "testforbob" for "user_password_confirmation"}
  step   %{I fill in "dummy_code" for "user_invite_code"}
  step   %{I press "Sign up"}
  step   %{I follow "Logout"}
  step   %{I follow "Login"}
  step   %{I fill in "bob@example.com" for "user_email"}
  step   %{I fill in "testforbob" for "user_password"}
  step   %{I press "Sign in"}
end

Then /^I should have one item$/ do
  Item.count.should == 1
end