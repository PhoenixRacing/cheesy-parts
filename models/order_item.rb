# Copyright 2012-2013 Team 254, 2014 Phoenix Racing. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
# @author nathan.lintz@students.olin.edu
# @author patrick.varin@students.olin.edu
# @author kevin.mcclure@students.olin.edu
#
# Represents a line item in an order from a vendor.

class OrderItem < Sequel::Model
  many_to_one :order
  many_to_one :project

  def total_cost
    unit_cost * quantity
  end
end
