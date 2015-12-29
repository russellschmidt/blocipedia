class ChargesController < ApplicationController
  include Premium
  before_action :authenticate_user!, only: [:new, :create, :downgrade]

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Upgrade for #{current_user.email}",
      # the following action is not passing spec tests, undefined method `description' for Premium:Module
      # description: Premium::description(current_user.email),
      amount: Premium::AMOUNT
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
      amount: Premium::AMOUNT,
      description: "Premium Upgrade for #{current_user.email}",
      # the following action is not passing spec tests, undefined method `description' for Premium:Module
      # description: Premium::description(current_user.email),
      currency: Premium::CURRENCY
    )

    # change user to premium
    if User.upgrade(current_user)
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
    if User.downgrade(current_user)
      flash[:notice] = "Account downgraded, #{current_user.email}. Thank you."
    else
      flash[:notice] = "Partial refund granted but database error occurred. Please contact support."
    end
    redirect_to wikis_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to edit_user_registration_path
  end
end


private
def upgrade_to_premium
  user = User.find(current_user.id)
  user.premium! ? true : false
end

def downgrade_to_standard
  user = User.find(current_user.id)
  user.standard! ? true : false
end
