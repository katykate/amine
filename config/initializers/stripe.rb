if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_cAkgikkw8Mhs4tyuIzzYiVVO',
    secret_key: 'sk_test_qj9tiDkBtG3w16iTKq6Ei65p'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]