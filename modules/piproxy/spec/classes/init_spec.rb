require 'spec_helper'
describe 'proxy' do

  context 'with defaults for all parameters' do
    it { should contain_class('proxy') }
  end
end
