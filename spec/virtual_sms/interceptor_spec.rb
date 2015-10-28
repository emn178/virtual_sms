require 'spec_helper'

RSpec.describe VirtualSms::Interceptor do
  let(:sms) { {:body => ''} }

  describe "#delivering_sms" do
    context "when delivery_method is not virtual" do
      before { 
        SmsCarrier::Base.delivery_method = :test
        SmsCarrier::Base.sms(sms).deliver_now
      }
      after { SmsCarrier::TestCarrier.deliveries.clear }
      it { expect(SmsCarrier::TestCarrier.deliveries.length).to eq 1 }
    end

    context "when delivery_method is virtual" do
      before { 
        SmsCarrier::Base.delivery_method = :virtual
        SmsCarrier::Base.sms(sms).deliver_now
      }

      context "without delivery_method in sms" do
        it { expect(SmsCarrier::TestCarrier.deliveries.length).to eq 0 }
      end

      context "with delivery_method in sms" do
        let(:sms) { { :body => '', :delivery_method => :test } }
        it { expect(SmsCarrier::TestCarrier.deliveries.length).to eq 0 }
      end
    end
  end
end
