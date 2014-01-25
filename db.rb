# Copyright 2012-2013 Team 254, 2014 Phoenix Racing. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
# @author nathan.lintz@students.olin.edu
# @author patrick.varin@students.olin.edu
# @author kevin.mcclure@students.olin.edu
#
# Sets up database connection.

require "pathological"

require "config/environment"

DB = Sequel.mysql2({ :host => DB_HOST, :user => DB_USER, :password => DB_PASSWORD, :database => DB_DATABASE })
