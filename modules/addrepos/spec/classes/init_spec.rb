require 'spec_helper'
describe 'addrepos' do
  context 'with default values for all parameters' do
    it { should contain_class('addrepos') }
  end
end
