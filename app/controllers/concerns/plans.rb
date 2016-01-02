module Plans
  module Premium
  # Stripe card processing fields for charges_controller.rb
  # Access via "Premioum::NAME"
    AMOUNT = 1500
    CURRENCY = "usd"

    def charge_description
      "Premium Upgrade for #{current_user.email}"
    end
  end
end
