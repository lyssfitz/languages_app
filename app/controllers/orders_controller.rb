class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token
 

    def stripe
        order_id = params[:data][:object][:payment_intent]
        order = Stripe::PaymentIntent.retrieve(order_id)
        lesson_id = order.metadata.lesson_id
        user_id = order.metadata.user_id
        lesson = Lesson.find(lesson_id)
        Order.create(
            user_id: user_id,
            lesson_id: lesson_id,
            status: "confirmed",
            price: lesson.price
        )
        p "lesson id " + lesson_id
        p "user id " + user_id
        render json: ""
    end

    def success
    end

    def show
        lesson = Lesson.find(params[:id].to_i)
        @orders = Order.where(lesson_id: params[:id])
        @student_count = @orders.count
        @total_profit = lesson.price * @student_count
        @available_tickets = lesson.max_students - @student_count
    end
end