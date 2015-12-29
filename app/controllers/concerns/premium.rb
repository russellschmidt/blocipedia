module Premium
# Stripe card processing fields for charges_controller.rb
# Access via "Premioum::NAME"
  AMOUNT = 1500
  CURRENCY = "usd"

  def description(email)
    "Premium Upgrade for #{email}"
  end
end
