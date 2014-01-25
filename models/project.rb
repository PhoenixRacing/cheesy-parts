# Copyright 2012-2013 Team 254, 2014 Phoenix Racing. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
# @author nathan.lintz@students.olin.edu
# @author patrick.varin@students.olin.edu
# @author kevin.mcclure@students.olin.edu
#
# Represents a grouping of related parts.

class Project < Sequel::Model
  one_to_many :parts
  one_to_many :orders
end
