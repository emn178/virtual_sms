module VirtualSms
  class Carrier
    attr_accessor :settings

    def initialize(settings)
      self.settings = settings
    end

    def deliver!(sms)
      messages = VirtualSms::Message.all
      messages << VirtualSms::Message.new(sms)
      Message.cache.write(CacheKey, messages)
    end
  end
end
