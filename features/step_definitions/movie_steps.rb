# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create movie
    #esto ha sido facil
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  # enjacar nooop, encajar en algun sitio /e1.*e2/ o mas bien Regexp.new("#{e1}.*#{e2}")
  reg_exp = /#{e1}.*#{e2}/m
  page.body.should =~ reg_exp
  #flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(', ').each do |ratin|
    step "I #{uncheck}check \"ratings_#{ratin}\""
  end
end

# este hace trampa
Then /I should not see any "(.*)" movie/ do |rati|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  # enjacar nooop, encajar en algun sitio /e1.*e2/ o mas bien Regexp.new("#{e1}.*#{e2}")
  reg_exp = /<td>#{rati}<\/td>/mi
  page.body.should_not =~ reg_exp
  #flunk "Unimplemented"
end

# este hace trampa
Then /I should see some "(.*)" movie/ do |rati|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  # enjacar nooop, encajar en algun sitio /e1.*e2/ o mas bien Regexp.new("#{e1}.*#{e2}")
  reg_exp = /<td>#{rati}<\/td>/mi
  page.body.should =~ reg_exp
  #flunk "Unimplemented"
end

When /I (un)?check all the ratings/ do |uncheck|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  Movie.all_ratings.each do |ratin|
    step "I #{uncheck}check \"ratings_#{ratin}\""
  end
end


