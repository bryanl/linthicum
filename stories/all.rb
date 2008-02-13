# dir = File.dirname(__FILE__)
# Dir[File.expand_path("#{dir}/**/*.rb")].uniq.each do |file|
#   require file
# end
# 
require File.join(File.dirname(__FILE__), *%w[helper])
require File.join(File.dirname(__FILE__), *%w[steps admin])

with_steps_for :admin do
  run File.join(File.dirname(__FILE__), *%w[admin_should_login]), :type => RailsStory
  run File.join(File.dirname(__FILE__), *%w[admin_should_post]), :type => RailsStory
end