# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Friendsapp_session',
  :secret      => '1928832c3f10cfcb88460ae3ac416ec45a6b565c7be61fcf1359bc4c15f35966b878dcc076d1a06f28d5d56538e12bc3b2ecb308e6844604d2a199382f9e8555'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
