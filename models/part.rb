# Copyright 2012-2013 Team 254, 2014 Phoenix Racing. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
# @author nathan.lintz@students.olin.edu
# @author patrick.varin@students.olin.edu
# @author kevin.mcclure@students.olin.edu
#
# Represents a single part or assembly in a project.

class Part < Sequel::Model
	many_to_one :project
	many_to_one :parent_part, :class => self
	one_to_many :child_parts, :key => :parent_part_id, :class => self
	
	PART_TYPES = ["part", "assembly"]

	# The list of possible part statuses. Key: string stored in database, value: what is displayed to the user.
	STATUS_MAP = {	"green"		=> "Green Machine",
					"mill"		=> "Manual Mill",
					"cncmill"	=> "CNC Mill",
					"lathe"		=> "Lathe",
					"cnclathe"	=> "CNC Lathe",
					"welding"	=> "Welding",
					"paint"		=> "Spray Paint",
					"sand"		=> "Sandblast",
					"cncrouter"	=> "CNC Router",
					"rasp"		=> "Rasp",
					"layup"		=> "Layup",
					"bend"		=> "Bend",
					"thermo"	=> "Thermoform",
					"notch"		=> "Notch",
					"laser"		=> "Laser Cutter",
					"assembly"	=> "Waiting for Assembly",
					"progress"	=> "Assembly in Progress",
					"done"		=> "Done",
					"rework"	=> "Rework"}
	STATUS_MAP.default = "Invalid Status"

	# Mapping of priority integer stored in database to what is displayed to the user.
	PRIORITY_MAP = { 0 => "High", 1 => "Normal", 2 => "Low" }

	# FAB_STEPS_COMPLETED = []
	# FAB_STEPS_REMAINING = []


	# Cration of the part
	def self.create_part(project, type, parent_part, part_number, fab_steps)
		new(:fab_steps => fabsteps_remaining, :part_number => part_number, :project_id => project.id, :type => type,
				:parent_part_id => parent_part.nil? ? 0 : parent_part.id)
	end

	def get_next_step
		#return next step
	end

	def rework_part
		#change current status to rework by adding it to the front of remaining steps		
	end

	def complete_next_step
		#move the next step over
	end

	def reset_steps
		#reset all of the steps
	end

	def completed_steps
		@fabsteps_completed.split(/,/)
	end

	def remaining_steps
		@fabsteps_remaining.split(/,/)
	end


	def full_part_number
		part_number
	end
end
