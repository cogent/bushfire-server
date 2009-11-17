# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bushfire_session',
  :secret      => 'a1f223c129ecc52d3373138a166c1c8f5997a1d5dedf204b1435bf7bababc91c459a339e2354600e09bbc7d31d854fa8067e53d4a78b2cec95b6b29a775a6fa7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
