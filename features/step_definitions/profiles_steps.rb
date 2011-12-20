Given /^there are no published profiles$/ do
  User.delete_all
end

Given /^there are (\d+) published profiles$/ do |number|
  number.times { User.make }
end

When /^I should see a list of (\d+) users$/ do |number|
  pending # express the regexp above with the code you wish you had
end

When /^I click "([^"]*)" (\d+) times$/ do |link, times|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see complete details for each card$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a list of entrepreneurs ordered by newcomers first$/ do
  pending # express the regexp above with the code you wish you had
end