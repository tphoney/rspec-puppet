require 'spec_helper'

describe 'sysctl::before' do
  let(:title) { 'sysctl::before' }
  let(:params) { { :value => "title" } }

  it "Should raise an error about needing the sysctl::common class" do
    expect {
      should create_notify("message-title").with_message("This should print if the class is here first.")
    }.to raise_error(Puppet::Error, %r{Could not find resource 'Class\[Sysctl::Common\]})
  end
end

describe 'sysctl::before' do
  let(:title) { 'test define' }
  let(:pre_condition) do
    [
      '# we need sysctl common',
      'class {"sysctl::common":}',
    ]
  end
  let(:params) { { :value => "title" } }

  it { should create_sysctl__before('test define').with_value("title") }

  it { should contain_class("sysctl::common") }
end
