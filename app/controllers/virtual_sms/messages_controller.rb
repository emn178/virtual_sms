module VirtualSms
  class MessagesController < VirtualSms::ApplicationController
    before_action :find_message, :only => [:show, :raw]

    def index
      @messages = VirtualSms::Message.all
    end

    def show
    end

    def raw
      render :plain => @message.raw
    end

    def clear
      VirtualSms::Message.clear
      redirect_to messages_path
    end

    private

    def find_message
      @message = VirtualSms::Message.find(params[:id])
    end
  end
end
