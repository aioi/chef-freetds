#
# Cookbook Name:: freetds
# Attributes:: default
#
# Copyright (C) 2013 Olivier Brisse
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['freetds']['version']     = '0.91'
default['freetds']['checksum']    = 'b14db5823980a32f0643d1a84d3ec3ad'
default['freetds']['tds_version'] = '7.1'
default['freetds']['odbc']        = false
default['freetds']['text_size']   = false

default['freetds']['servers'] = [
  {
    'name' => 'egServer70',
    'description' => 'A typical Microsoft server',
    'host' => 'ntmachine.domain.com',
    'port' => 1433,
    'tds_version' => '7.0'
  }
]
