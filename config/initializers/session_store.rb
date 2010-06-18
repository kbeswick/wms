# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wms_session',
  :secret      => 'b97c27718adbf048eba7e3d3612475bd2cef23ccad0eefc5c797c59793e6fee1dd5e6c59695d4e5f9aea2fb28e063e3632b32c808392756777f2bf4c42381e4b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
