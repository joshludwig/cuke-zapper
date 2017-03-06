Given(/^I go to the hackyourself page$/) do
  @browser.goto TestConfig.base_url
  sleep 2
  @browser.button(class: 'close').click
  sleep 2
end

When(/^I search for '(.*)'$/) do |search_term|
  @browser.text_field(id: 'searchTerm').set search_term
  @browser.send_keys :enter
end


Then(/^I am told I searched for '(.*)' on the search page$/) do |search_term|
  expect( @browser.span(id: 'searchTerm').value).to eq(search_term)
end