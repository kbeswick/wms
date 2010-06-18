# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wms_session',
  :secret      => '391432ca6dc45f964ef54ccce303123cee14f3339c4d4fd9de0a28f886c26558057479ceb2c18b702656dffe84872d63eeca7aaf7c4544e94120397d456b2697'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
