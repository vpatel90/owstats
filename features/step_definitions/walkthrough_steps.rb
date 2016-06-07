When(/^I go the root path$/) do
  visit root_path
end

Then(/^I should see "([^"]*)"$/) do |text|
  assert page.has_content?(text)
end
