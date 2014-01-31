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

	# Mapping of priority integer stored in database to what is displayed to the user.
	PRIORITY_MAP = { 0 => "High", 1 => "Normal", 2 => "Low" }

	



### FIXME: Here is the part generation stuff, this just needs to be replaced with an admin
	#				being able to fill in the part number when the part is first made.

	# Assigns a part number based on the parent and type and returns a new Part object.
	def self.generate_number_and_create(project, type, parent_part, part_number)
		# parent_part_id = parent_part.nil? ? 0 : parent_part.id
		# parent_part_number = parent_part.nil? ? 0 : parent_part.part_number
		# if type == "part"
		#	 part_number = Part.filter(:project_id => project.id, :parent_part_id => parent_part_id, :type => "part")
		#										 .max(:part_number) || parent_part_number
		#	 part_number += 1
		# else
		#	 part_number = Part.filter(:project_id => project.id, :type => "assembly").max(:part_number)	|| -100
		#	 part_number += 100
		# end
		new(:part_number => part_number, :project_id => project.id, :type => type,
				:parent_part_id => parent_part.nil? ? 0 : parent_part.id)
	end

	def full_part_number
		part_number
	end
end
