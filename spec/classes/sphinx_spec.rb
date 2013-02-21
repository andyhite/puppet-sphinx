require 'spec_helper'

describe 'sphinx' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'wfarr',
    }
  end

  it do
    should include_class('homebrew')
    should include_class('java')

    should contain_homebrew__formula('sphinx').with_before('Package[boxen/brews/sphinx]')

    should contain_package('boxen/brews/sphinx').with({
      :ensure  => '2.0.6-boxen1'
    })
  end
end
