# These are the Stripe environment variables for the Rails.configuration object
Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key: ENV['STRIPE_SECRET_KEY']
}

# set the app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]
