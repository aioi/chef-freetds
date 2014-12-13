require 'serverspec'

set :backend, :exec
set :path, '/usr/local/bin:$PATH'

describe 'freetds::default' do
  describe file('/usr/local/etc/freetds.conf') do
    it { should be_file }
  end

  describe command('which tsql') do
    its(:stdout) { should match '/usr/local/bin/tsql' }
    its(:exit_status) { should eq 0 }
  end

  describe command('tsql -C') do
    its(:stdout) { should match 'Version: freetds v0.91' }
    its(:stdout) { should match 'TDS version: 7.1' }
    its(:exit_status) { should eq 0 }
  end
end
