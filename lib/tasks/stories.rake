ENV["RAILS_ENV"] = "test"    
require File.join(RAILS_ROOT, "stories", "helper")

module Spec
  class << self; def run; false; end; end
end

namespace :spec do   
  desc "run all rspec stories"  
  task :stories do
    story_runner
  end
  
  desc "run rspec story by name with NAME=story_file_name"
  task :story do
    if ENV["NAME"].blank?
      puts "rake spec:story NAME='story_name'"
      exit
    end
    story_runner(/#{ENV["NAME"]}/)
  end
  
  
  def story_runner(pattern = nil)
    dir = File.join(RAILS_ROOT, "stories", "steps")
    Dir.entries(dir).find_all{|f| f =~ /\.rb\Z/}.each do |file|
      step = file.match(/(\w+)\.rb\Z/).captures[0]      
      require File.join(dir, step)
      with_steps_for step.to_sym do 
        feature_dir = File.join(RAILS_ROOT, "stories", "features", step)
        Dir.entries(feature_dir).reject{|f| f =~ /\A\./}.each do |story|
          if pattern.nil?          
            run File.join(feature_dir, story), :type => RailsStory
          else
            if story =~ pattern
              run File.join(feature_dir, story), :type => RailsStory
            end
          end
        end
      end
    end        
  end
    
end