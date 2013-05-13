default['freetds']['version']     = '0.91'
default['freetds']['checksum']    = 'b14db5823980a32f0643d1a84d3ec3ad'
default['freetds']['tds_version'] = '7.1'
default['freetds']['odbc']        = false

default['freetds']['servers'] = [
  {
    'name' => 'egServer70',
    'description' => 'A typical Microsoft server',
    'host'=> 'ntmachine.domain.com',
    'port' => 1433,
    'tds_version' => '7.0'
  }
]