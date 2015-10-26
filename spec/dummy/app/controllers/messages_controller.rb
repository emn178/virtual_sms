class MessagesController < ApplicationController
  def index
    redirect_to new_message_path
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @message.to = @message.to.split(',')
    if @message.valid?
      SmsCarrier::Base.sms(@message.to_h).deliver_now
      redirect_to @message
    else
      render 'new'
    end
  end
end
