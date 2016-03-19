#
# Cookbook Name:: freetds
# Recipe:: source
#
# Copyright (C) 2014 Olivier Brisse
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

include_recipe 'build-essential::default'

version = node['freetds']['version']
freetds_url = node['freetds']['url'] ||
              "ftp://ftp.freetds.org/pub/freetds/stable/freetds-#{version}.tar.gz"
configure_options = "--with-tdsver=#{node['freetds']['tds_version']} #{'--disable-odbc' unless node['freetds']['odbc']}"

remote_file "#{Chef::Config[:file_cache_path]}/freetds-#{version}.tar.gz" do
  action :create_if_missing
  backup false
  source freetds_url
  checksum node['freetds']['checksum'] if node['freetds']['checksum']
end

bash 'build freetds' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    tar zxf freetds-#{version}.tar.gz
    (cd freetds-#{version} && CFLAGS='-fPIC' ./configure #{configure_options})
    (cd freetds-#{version} && make && make install)
  EOF
  not_if 'which tsql'
end
