module VirtualSms
  class Interceptor
    def self.delivering_sms(sms)
      if SmsCarrier::Base.delivery_method == :virtual && sms.delivery_method != VirtualSms::Carrier
        sms.delivery_method(VirtualSms::Carrier)
      end
    end
  end
end
