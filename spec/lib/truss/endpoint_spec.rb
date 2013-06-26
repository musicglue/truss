require 'truss/router/request'
require 'truss/endpoint'

describe Truss::Endpoint do
  describe "class methods" do
    it "should initialize" do
      described_class.new({}).should be_a(Truss::Endpoint)
    end

    it "should respond to call on initialize" do
      described_class.new({}).should respond_to(:call)
    end

    it "should respond_to call" do
      described_class.should respond_to(:call)
    end

    context "I hate RSpec" do
      let!(:app) { Truss::Endpoint.new({}) }
      it "should instantiate a new endpoint for each request" do
        described_class.any_instance.stub(:call).and_return(true)
        described_class.should_receive(:new).exactly(1).times.with({}).and_return(app)
        described_class.call({})
      end
    end
  end

  describe "instance methods" do
    subject { described_class.new({}) }
    it { should respond_to(:call) }
    it { should respond_to(:env) }
    it { should respond_to(:request) }
    it { should respond_to(:action) }
    it { should respond_to(:content_type) }
    it { should respond_to(:status) }
    it { should respond_to(:header) }
    it { should respond_to(:not_found) }
    
    it "should raise a not implemented error for action" do
      expect {
        subject.call
      }.to raise_error(NotImplementedError)
    end
  end
end
