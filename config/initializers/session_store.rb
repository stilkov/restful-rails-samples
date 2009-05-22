# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_restful-rails-samples_session',
  :secret      => '8301c6c357b4d6cdb75c9e2639a847e9580e1eaef5a9b08fff374f1fa2183a58725f338cef9ced5da4965241cab9c4d91742c90290bb8f56069715b368d5ffef'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
