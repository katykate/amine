class PaymentsController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :authenticate_user!

def create
  token = params[:stripeToken]
  @product = Product.find(params[:product_id])
  @user = current_user
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      :amount => (@product.price*100).to_i, # amount in cents, again
      :currency => "gbp",
      :source => token,
      :description => params[:stripeEmail]
    )

    if charge.paid
      Order.create!(product_id: @product.id, user_id: @user.id, total: @product.price)
    end

    flash[:notice] = "Your Order has been successfully placed! Thank you for your purchase."
  rescue Stripe::CardError => e
    # The card has been declined
    body = e.json_body
    err  = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
  redirect_to product_path(@product)
end

end