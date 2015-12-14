
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



# Then(/^the Similar Movies page for "(.*)"$/) do |arg1|
#
#
# end

