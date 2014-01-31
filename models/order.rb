# Copyright 2012-2013 Team 254, 2014 Phoenix Racing. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
# @author nathan.lintz@students.olin.edu
# @author patrick.varin@students.olin.edu
# @author kevin.mcclure@students.olin.edu
#
# Represents an order from a vendor consisting of multiple items.

class Order < Sequel::Model
	one_to_many :order_items
	many_to_one :project

	# The list of possible order statuses. Key: string stored in database, value: what is displayed to the user.
	STATUS_MAP = {
		"open" => "Open",
		"ordered" => "Ordered",
		"received" => "Received"
	}

	def subtotal
		order_items.map(&:total_cost).inject(0) { |sum, cost| sum + cost }
	end

	def total_cost
		subtotal + tax_cost.to_f + shipping_cost.to_f
	end
end
