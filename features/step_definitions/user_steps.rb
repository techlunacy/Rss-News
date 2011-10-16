Then /^I go to the homepage$/ do
  visit('/')
end


Given /^no user exists with an email of "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Given /^I am a user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  User.new(:name => name,
            :email => email,
            :password => password,
            :password_confirmation => password).save!
end

Then /^I should be already signed in$/ do
  And %{I should see "Logout"}
end

Given /^I am signed up as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am not logged in}
  When %{I go to the sign up page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I fill in "Password confirmation" with "#{password}"}
  And %{I press "Sign up"}
  Then %{I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."}
  And %{I am logout}
end
Then /^I should see "([^"]*)"$/ do |arg1|
  page.has_content?(arg1)
end
Then /^I sign out$/ do
  visit('/users/sign_out')
end

Given /^I am logout$/ do
  Given %{I sign out}
end

Given /^I am not logged in$/ do
  Given %{I sign out}
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am not logged in}
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Sign in"}
end

Then /^I should be signed in$/ do
  Then %{I should see "Signed in successfully."}
end

When /^I return next time$/ do
  And %{I go to the home page}
end

Then /^I should be signed out$/ do
  And %{I should see "Sign up"}
  And %{I should see "Login"}
  And %{I should not see "Logout"}
end

When /^I go to the sign in page$/ do
  visit('/users/sign_in')
end

Given /^I am on the home page$/ do
  visit('/')
end

Given /^I go to the sign up page$/ do
  visit('/users/sign_up')
end

Given /^I fill in the following:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.rows_hash.each do |key, value|
    fill_in key, :with => value
  end
end

Given /^I press "([^"]*)"$/ do |arg1|
  click_on(arg1)
end

When /^I follow "([^"]*)"$/ do |arg1|
  click_link(arg1)
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
  fill_in arg1, :with => arg2

end

Given /^I am on the homepage$/ do
  visit('/')
end

Then /^I go to the home page$/ do
  visit('/')
end

Then /^I should not see "([^"]*)"$/ do |arg1|
  not page.has_content? arg1
end

Given /^I am signed in as "(.*)\/(.*)"$/ do |email, password|
  User.new(:name => email,
            :email => email,
            :password => password,
            :password_confirmation => password).save!
  Given %{I sign in as "#{email}/#{password}"}
  And %{I go to the homepage}
  Then %{I should be already signed in}
end

