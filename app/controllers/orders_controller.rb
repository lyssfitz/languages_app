class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def stripe
        order_id=  params[:data][:object][:payment_intent]
        order = Stripe::PaymentIntent.retrieve(order_id)
        lesson_id = order.metadata.lesson_id
        user_id = order.metadata.user_id
        p "lesson id " + lesson_id
        p "user id " + user_id
        render json: ""
    end

    def success
        
    end
end