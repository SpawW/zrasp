require 'spec_helper'
describe 'raspctl' do

  context 'with defaults for all parameters' do
    it { should contain_class('raspctl') }
  end
end
