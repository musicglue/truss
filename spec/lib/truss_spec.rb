describe Truss do
  subject { described_class }

  it { should respond_to(:configure) }

  describe "can be configured" do
    subject { described_class.config }
    before :each do
      described_class.config = nil
    end
    context "and by default has" do
      before :each do
        described_class.configure do |config|
        end
      end

      its(:root)        { should eq(FileUtils.pwd) }
      its(:environment) { should eq(:development) }
    end

    context "supports custom options" do
      before :each do
        described_class.configure do |config|
          config.fruits = %w[apple pear]
          config.environment = :production
        end
      end

      its(:root)        { should eq(FileUtils.pwd) }
      its(:fruits)      { should eq(%w[apple pear]) }
      its(:environment) { should eq(:production) }
    end
  end

  describe "delegates convenience methods to config" do
    before :each do
      described_class.configure do |config|
        config.environment = :development
      end
    end

    its(:root)        { should eq(FileUtils.pwd) }
    its(:environment) { should eq(:development) }
  end
end