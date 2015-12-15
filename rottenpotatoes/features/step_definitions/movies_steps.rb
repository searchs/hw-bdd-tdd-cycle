
Then /^show me the page$/ do
  save_and_open_page
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |mv, dct|

  @movie = Movie.find_by_title(mv)
  d = @movie['director']
  d.equal? dct
end


Given(/^the following movies exist:$/) do |table|
  table.hashes.each { |mov|
    Movie.create(mov)
  }
end

When(/^the edit page for "(.*?)"$/) do |arg1|
  visit edit_movie_path(Movie.find_by_title(arg1).id)
end


Given(/^the details page for "(.*?)"$/) do |arg1|

  visit movie_path(Movie.find_by_title(arg1))
end


When(/^I click on "([^"]*)"$/) do |arg|
  click_link arg
end

And(/^I fill in "([^"]*)","([^"]*)", "([^"]*)" and "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  fill_in(arg1, :with => arg1)
  # fill_in(field, :with => value)
end

# Then(/^the director of "(.*?)" should be "(.*?)"$/) do |title, director|
#   Movie.where("title = ? AND director = ?", title, director).length > 0
# end

Then(/^the message "([^"]*)" is displayed$/) do |arg|
  page.should have_content(arg)
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  pos_e1 = page.body.index(/[#{e1}]/)
  pos_e2 = page.body.index(/[#{e2}]/, pos_e1)
  pos_e2 > pos_e1
end

