class Premium
# Stripe card processing fields for charges_controller.rb

  def amount
    1500     #price in pennies
  end

  def description
    "Blocipedia Premium for #{current_user.email}"
  end

  def currency
    "usd"
  end

end
