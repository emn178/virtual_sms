require 'spec_helper'

RSpec.describe VirtualSms::Message do
  subject { message }
  let(:message) { VirtualSms::Message.new(sms) }
  let(:from) { '+886987654321' }
  let(:to) { ['+886912345678', '+886963852741'] }
  let(:body) { 'Hello, This is plain body.' }
  let(:sms) {
    sms = SmsCarrier::Sms.new
    sms.from = from
    sms.to = to
    sms.body = body
    sms
  }
  let(:uuid) { '8f72b6f0-9d5f-4b95-b9ff-48213f99fb71' }
  before { allow(SecureRandom).to receive(:uuid).and_return(uuid) }

  describe "#id" do
    its(:id) { should eq uuid }
  end

  describe "#from" do
    its(:from) { should eq from }
  end

  describe "#to" do
    its(:to) { should eq '+886912345678, ...1 more' }
  end

  describe "#list_to" do
    its(:list_to) { should eq "+886912345678, +886963852741" }
  end

  describe "#date" do
    its(:date) { should_not eq nil }
  end

  describe "#body" do
    its(:body) { should eq body }
  end

  describe "#body_tag" do
    its(:body_tag) { should eq "<pre>#{body}</pre>" }
  end

  describe "#raw" do
    its(:raw) { should include "sms_id: 8f72b6f0-9d5f-4b95-b9ff-48213f99fb71\nFrom: +886987654321\nTo: [\"+886912345678\", \"+886963852741\"]\nBody: Hello, This is plain body.\n" }
  end

  describe ".clear" do
    after { VirtualSms::Message.clear }
    it { expect(VirtualSms::Message.cache).to receive(:delete).with(VirtualSms::CacheKey) }
  end

  describe ".all" do
    before { VirtualSms::Message.clear }

    context "without cache" do
      subject { VirtualSms::Message.all }
      it { should eq [] }
    end

    context "with cache" do
      subject { VirtualSms::Message.all }
      let(:messages) { [message, message] }
      before { allow(VirtualSms::Message.cache).to receive(:fetch).with(VirtualSms::CacheKey).and_return(messages) }
      its(:length) { should eq 2 }
    end
  end

  describe ".find" do
    let!(:other) { VirtualSms::Message.new(SmsCarrier::Sms.new) }
    let(:messages) { [other, message] }
    let(:uuid) { 'e21b3826-e97e-4fa6-9f0d-4f2b39966769' }
    before { 
      allow(SecureRandom).to receive(:uuid).and_return(uuid)
      allow(VirtualSms::Message).to receive(:all).and_return(messages)
    }
    subject { VirtualSms::Message.find(uuid) }
    its(:id) { should eq uuid }
  end
end
