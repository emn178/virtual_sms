require 'securerandom'

module VirtualSms
  class Message
    include ActionView::Helpers::TagHelper

    attr_accessor :sms, :date
    delegate :body, :from, to: :sms

    def initialize(sms)
      @sms = sms
      @sms[:sms_id] = SecureRandom.uuid
      self.date = Time.now
    end

    def id
      @sms[:sms_id]
    end

    def to
      addresses = @sms.to
      address = addresses[0].to_s
      count = addresses.length
      count > 1 ? address + ", ...#{count - 1} more" : address
    end

    def list_to
      @sms.to.join(', ')
    end

    def body_tag
      content_tag :pre, body unless body.nil? 
    end

    def raw
      @sms.to_s
    end

    def self.all
      messages = Rails.cache.fetch(CacheKey) do
        messages = []
      end
      messages
    end

    def self.find(id)
      message = all.find { |message| message.id == id }
      raise ActiveRecord::RecordNotFound if message.nil?
      message
    end

    def self.clear
      Rails.cache.delete(CacheKey)
    end
  end
end
