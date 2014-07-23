require 'spec_helper'

describe 'freetds::default' do
  describe file('/usr/local/etc/freetds.conf') do
    it { should be_file }
  end

  describe command('which tsql') do
    it { should return_stdout '/usr/local/bin/tsql' }
    it { should return_exit_status 0 }
  end

  describe command('tsql -C') do
    its(:stdout) { should match 'Version: freetds v0.91' }
    its(:stdout) { should match 'TDS version: 7.1' }
    it { should return_exit_status 0 }
  end
end
