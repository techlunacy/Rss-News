Given /^I have created (\d+) articles$/ do |arg1|
  arg1.to_i.times do
    Factory(:article)
  end
end

Then /^I should see (\d+) articles$/ do |arg1|
  page.has_css?("article", :count => arg1.to_i)
end

