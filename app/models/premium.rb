class Premium
# Stripe card processing fields for charges_controller.rb
# Access via "Premioum::NAME"
  AMOUNT = 1500
  DESCRIPTION = "Blocipedia Premium for #{current_user.email}"
  CURRENCY = "usd"

end
