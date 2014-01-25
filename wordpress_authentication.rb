# Copyright 2012-2013 Team 254, 2014 Phoenix Racing. All Rights Reserved.
# @author pat@patfairbank.com (Patrick Fairbank)
# @author nathan.lintz@students.olin.edu
# @author patrick.varin@students.olin.edu
# @author kevin.mcclure@students.olin.edu

require "httparty"
require "pathological"
require "json"

require "config/environment"

module PhoenixParts
  # Helper mixin for third-party authentication using Wordpress.
  module WordpressAuthentication
    def wordpress_cookie
      request.cookies[request.cookies.keys.select { |key| key =~ /wordpress_logged_in_[0-9a-f]{32}/ }.first]
    end

    # Returns a hash of user info if logged in to Wordpress, or nil otherwise.
    def get_wordpress_user_info
      if wordpress_cookie
        response = HTTParty.get("#{WORDPRESS_AUTH_URL}?cookie=#{URI.encode(wordpress_cookie)}")
        return JSON.parse(response.body) if response.code == 200
      end
      return nil
    end
  end
end
