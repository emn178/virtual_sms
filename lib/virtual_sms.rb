require "sms_carrier"
require "virtual_sms/engine"
require "virtual_sms/carrier"
require "virtual_sms/interceptor"

module VirtualSms
  CacheKey = 'virtual_sms'

  SmsCarrier::Base.add_delivery_method :virtual, VirtualSms::Carrier
  SmsCarrier::Base.register_interceptor(VirtualSms::Interceptor)
end
