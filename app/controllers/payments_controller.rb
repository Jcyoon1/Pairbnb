class PaymentsController < ApplicationController
	before_action :make_new_payment

  def new
  	@client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:reservation_id])
    @payment = Payment.new
  end

  def create
    @reservation = Reservation.find(params[:payment][:reservation_id])
  	nonce = params[:payment_method_nonce]
  	render action: :new and return unless nonce
  	result = Braintree::Transaction.sale(amount: "#{@reservation.total_price}.00".to_i, payment_method_nonce: params[:payment_method_nonce])
  	if result.success?
	  	#reserve to save the transaction details into database
	  	flash[:success] = 'yay'
	  	redirect_to @reservation
  	else
  		flash[:danger] = 'no'
  		render :new
	  end
  end

  private

  def make_new_payment
  	@payment = Payment.new
  end


end
