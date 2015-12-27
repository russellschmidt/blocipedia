class ChargesController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      # this is the Stripe customer object ID
      customer: customer.id,
      # must be in cents
      amount: Amount.default,
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
