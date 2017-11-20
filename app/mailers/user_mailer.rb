class UserMailer < ApplicationMailer
  default from: "kataliento@gmail.com"

  def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: 'kataliento@gmail.com',
           subject: "A new contact form message from #{name}")
    end

    def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
	end

  def order_placed(user, product)
      @user = user
      @product = product
      mail(:from => 'kataliento@gmail.com',
          :to => user.email,
          :subject => "Your order of the #{product.name} has been placed.")
    end

end
