class ChargesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Premium for #{current_user.email}",
      amount: 1500
    }
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      # this is the Stripe customer object ID
      customer: customer.id,
      # must be in cents
      amount: 1500,  #Amount.default
      description: "Blocipedia Premium for #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Payment successful #{current_user.email}! Thanks"
    redirect_to wikis_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
