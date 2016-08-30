name             'freetds'
maintainer       'Olivier Brisse'
maintainer_email 'obrisse@aioinissaydowa.com.au'
license          'Apache 2.0'
description      'Installs/Configures FreeTDS'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

%w(ubuntu debian centos).each do |os|
  supports os
end

depends 'apt'
depends 'build-essential'

attribute 'version',
  :display_name => 'Version',
  :description => 'The version of FreeTDS to install',
  :default => '0.91'

attribute 'checksum',
  :display_name => 'Checksum',
  :description => 'checksum of the FreeTDS archive',
  :required => 'optional'

attribute 'tds_version',
  :display_name => 'TDS Version',
  :description => 'TDS protocol version',
  :default => '7.1'

attribute 'odbc',
  :display_name => 'ODBC support',
  :description => 'Select wether or not to build the ODBC driver',
  :default => 'false'

attribute 'servers',
  :display_name => 'Server list',
  :description => 'See README'
