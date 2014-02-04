# Copyright 2014 Phoenix Racing. All Rights Reserved.
# @author patrick.varin@students.olin.edu
# @author kevin.mcclure@students.olin.edu
#
# Metric model to log what users do what to the database
#  throughout the fab season. This will be processed later
#  to determine fab stats.

class Metric < Sequel::Model

	def self.log_event(project, part, user, action)
		new(:project_id 	=> project.id,
			:project_name	=> project.name,
			:part_id 		=> part.id,
			:part_number	=> part.part_number,
			:part_name 		=> part.name,
			:user_id 		=> user.id,
			:user_lastname 	=> user.last_name,
			:user_firstname => user.first_name,
			:action 		=> action,
			:time 			=> Time.now())
	end
end