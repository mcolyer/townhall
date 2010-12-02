# I usually put this file in spec/support/fixture_builder.rb
FixtureBuilder.configure do |fbuilder|
  # rebuild fixtures automatically when these files change:
  fbuilder.files_to_check += Dir["spec/factories/*.rb", "spec/support/fixture_builder.rb"]

  # now declare objects
  fbuilder.factory do
    fbuilder.name(:admin, Factory(:user, :authentication_token => "secret"))
  end
end
