class ChargesController < ApplicationController
  include Plans::Premium
  before_action :authenticate_user!, only: [:new, :create, :downgrade]

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: charge_description,
      # the following action is not passing spec tests, undefined method `description' for Premium:Module
      # description: Premium::description(current_user.email),
      amount: AMOUNT
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
      amount: AMOUNT,
      description: charge_description,
      # the following action is not passing spec tests, undefined method `description' for Premium:Module
      # description: Premium::description(current_user.email),
      currency: CURRENCY
    )

    # change user to premium
    if current_user.upgrade
      flash[:notice] = "Welcome to Premium status. Payment successful #{current_user.email}. Thank you."
    else
      flash[:notice] = "Payment received but we ran into an error with our database. Please contact support."
    end
    redirect_to wikis_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def downgrade
    if current_user.downgrade
      current_user.wikis.each do |wiki|
        wiki.make_public
      end

      flash[:notice] = "Account downgraded, #{current_user.email}. Thank you."
    else
      flash[:notice] = "Database error occurred. Please contact support."
    end
    redirect_to wikis_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to edit_user_registration_path
  end
end
