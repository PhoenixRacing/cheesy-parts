# Copyright 2012-2013 Team 254, 2014 Phoenix Racing. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
# @author nathan.lintz@students.olin.edu
# @author patrick.varin@students.olin.edu
# @author kevin.mcclure@students.olin.edu
#
# Script for starting/stopping the parts management server.

require "bundler/setup"
require "daemons"
require "pathological"
require "thin"

Daemons.run_proc("parts_server", :monitor => true) do
	require "parts_server"

	Thin::Server.start("0.0.0.0", PORT, PhoenixParts::Server)
end
