describe Truss::Config do
  it { should respond_to(:root) }
  it { should respond_to(:environment) }

  its(:environment) { should eq(:development) }
  its(:root)        { should eq(FileUtils.pwd) }
end