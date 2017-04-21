Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_5KGdBQatrt0WhNhnWG3oFc3m Roll Key
'],
  :secret_key      => ENV['sk_test_FSmbzhKJvsTgROwRDVelk6Ct']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
