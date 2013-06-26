require 'support/basic_endpoint.rb'

describe Truss::Endpoint do
  subject { BasicEndpoint.new({}) }

  context "setting response status with an integer" do
    it "sets the status through the status method" do
      subject.status 200
      subject.call.first.should eq(200)
    end
  end

  context "setting response status with a symbol" do
    it "sets 200 given :ok" do
      subject.status :ok
      subject.call.first.should eq(200)
    end
    it "sets 202 given :accepted" do
      subject.status :accepted
      subject.call.first.should eq(202)
    end
    it "sets 401 given :not_authorized" do
      subject.status :not_authorized
      subject.call.first.should eq(401)
    end
    it "sets 404 given :not_found" do
      subject.status :not_found
      subject.call.first.should eq(404)
    end
    it "sets 500 given :error" do
      subject.status :error
      subject.call.first.should eq(500)
    end
  end
end
