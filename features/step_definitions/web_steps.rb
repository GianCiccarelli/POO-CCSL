# This file was generated by Cucumber-Rails and is only here to get you a head start
# These step definitions are thin wrappers around the Capybara/Webrat API that lets you
# visit pages, interact with widgets and make assertions about page content.
#
# If you use these step definitions as basis for your features you will quickly end up
# with features that are:
#
# * Hard to maintain
# * Verbose to read
#
# A much better approach is to write your own higher level step definitions, following
# the advice in the following blog posts:
#
# * http://benmabey.com/2008/05/19/imperative-vs-declarative-scenarios-in-user-stories.html
# * http://dannorth.net/2011/01/31/whose-domain-is-it-anyway/
# * http://elabs.se/blog/15-you-re-cuking-it-wrong
#


require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )am on "(.+)"$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select or option
# based on naming conventions.
#
When /^(?:|I )fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    step(%{I fill in "#{name}" with "#{value}"})
  end
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^(?:|I )select "([^"]*)" from the select list "([^"]*)"$/ do |value, field|
  select_by_value(field, value)
end

When /^(?:|I )select "([^"]*)" as the date from "([^"]*)"$/ do |date, field|
  date = DateTime.parse(date)
  select(date.year.to_s, :from => "#{field}_1i")
  select(date.strftime("%B"), :from => "#{field}_2i")
  select(date.day.to_s, :from => "#{field}_3i")
  select(date.hour.to_s, :from => "#{field}_4i")
  select(date.minute.to_s, :from => "#{field}_5i")
end

When /^(?:|I )check "([^"]*)"$/ do |field|
  check(field)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end


Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should see "([^"]*)" before "([^"]*)"$/ do |first_item, second_item|
  page.body.should =~ /#{first_item}.*#{second_item}/m
end

When(/^I follow "(.*?)" in "(.*?)" line$/)do |link, line|
  find('tr', text: line).click_link(link)
end

When(/^I confirm the dialog$/) do
  page.driver.browser.switch_to.alert.accept
end


