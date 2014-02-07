# Fill in parameters for development/local database and e-mail account here. Changes for prod should be made
# in the Rakefile, as this file is overwritten on deploy.


PORT = ENV["PORT"]
# DB_HOST = "localhost"
DB_HOST = "us-cdbr-east-05.cleardb.net"#/heroku_ef2aea1c34afa4b?reconnect=true
# DB_USER = "phoenix"
DB_USER = "bb0c958fee3cfc"
DB_PASSWORD = "00a961fd"
# DB_DATABASE = "phoenix_parts"
DB_DATABASE = "heroku_ef2aea1c34afa4b"#her
# URL = "0.0.0.0:9000"
URL = "phoenix_parts.herokuapp.com"
GMAIL_USER = "phoenixracingfabrication@gmail.com"
GMAIL_PASSWORD = "correcthorsebatterystaples"
WORDPRESS_AUTH_URL = ""
LOGOUT_URL = "http://baja.olin.edu"