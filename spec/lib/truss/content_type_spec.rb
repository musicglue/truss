require 'support/basic_endpoint.rb'

describe Truss::Endpoint do
  subject { BasicEndpoint.new({}) }
  context "setting content type" do
    it "sets application/json given a :json symbol" do
      subject.content_type :json
      subject.call[1]["Content-Type"].should eq('application/json; charset=utf-8')
    end

    it "sets application/xml given an :xml symbol" do
      subject.content_type :xml
      subject.call[1]['Content-Type'].should eq('application/xml; charset=utf-8')
    end

    it "sets text/html given an :html symbol" do
      subject.content_type :html
      subject.call[1]['Content-Type'].should eq('text/html; charset=utf-8')
    end

    it "sets text/plain given a :text symbol" do
      subject.content_type :text
      subject.call[1]['Content-Type'].should eq('text/plain; charset=utf-8')
    end

    it "allows arbitrary values" do
      subject.content_type 'something/odd'
      subject.call[1]['Content-Type'].should eq('something/odd')
    end

    it "defaults to text/html" do
      subject.call[1]['Content-Type'].should eq('text/html; charset=utf-8')
    end
  end
end
