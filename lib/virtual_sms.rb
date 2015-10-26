require "sms_carrier"
require "virtual_sms/engine"
require "virtual_sms/carrier"

module VirtualSms
  CacheKey = 'virtual_sms'

  SmsCarrier::Base.add_delivery_method :virtual, VirtualSms::Carrier
end
