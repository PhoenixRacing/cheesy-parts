# Copyright 2012-2013 Team 254, 2014 Phoenix Racing. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
# @author nathan.lintz@students.olin.edu
# @author patrick.varin@students.olin.edu
# @author kevin.mcclure@students.olin.edu
#
# Task for overwriting environment.rb with the deployment-environment-specific variables.

namespace :fezzik do
  desc "saves variables set by `Fezzik.env` into a local staging area before deployment"
  task :save_environment do
    Fezzik.environments.each do |server, environment|
      root_config_dir = "/tmp/#{app}/staged/config"
      File.open(File.join(root_config_dir, "environment.rb"), "w") do |file|
        environment.each do |key, value|
          quote = value.is_a?(Numeric) ? '' : '"'
          file.puts "#{key.to_s.upcase} = #{quote}#{value}#{quote}"
        end
      end
    end
  end
end
