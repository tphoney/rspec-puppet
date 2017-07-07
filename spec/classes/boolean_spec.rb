require 'spec_helper'

if Puppet::PUPPETVERSION !~ %r{0\.2}
  describe 'boolean_test' do
    let(:title) { 'bool.testing' }
    let(:params) { { :bool => false } }

    it do
      should create_notify("bool testing").with_message("This will print when \$bool is false.")
    end
  end
end
