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
      amount: 1500,
      description: "Blocipedia Premium for #{current_user.email}",
      currency: 'usd'
    )

    # change user to premium
    if upgrade_to_premium
      flash[:notice] = "Welcome to Premium status. Payment successful #{current_user.email}. Thank you."
    else
      flash[:notice] = "Payment received but we ran into an error with our database. Please contact support."
    end
    redirect_to wikis_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end


private
def upgrade_to_premium
  user = User.find(current_user.id)
  user.premium! ? true : false
end
