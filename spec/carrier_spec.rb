require 'spec_helper'

RSpec.describe VirtualSms::Carrier do
  let(:carrier) { VirtualSms::Carrier.new({}) }
  let(:sms) { SmsCarrier::Sms.new }

  describe "#deliver!" do
    subject { VirtualSms::Message.all }
    before { 
      VirtualSms::Message.clear
      carrier.deliver! sms 
    }
    its(:length) { should eq 1 }
  end
end
