ENV["RAILS_ENV"] = "test"
require File.join(RAILS_ROOT, "config", "environment")
require 'spec/rails/story_adapter'

Dir[File.dirname(__FILE__) + "/helpers/**/*.rb"].each do |file|
  require file[0...-3]
end