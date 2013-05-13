#
# Cookbook Name:: andia-pxe
# Recipe:: default
#
# Copyright 2013, Olivier Brisse
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'build-essential'

version = node['freetds']['version']
freetds_url = node['freetds']['url'] ||
  "http://mirrors.ibiblio.org/freetds/stable/freetds-#{version}.tar.gz"
configure_options = "--with-tdsver=#{node['freetds']['tds_version']} #{'--disable-odbc' unless node['freetds']['odbc']}"

remote_file "#{Chef::Config[:file_cache_path]}/freetds-#{version}.tar.gz" do
  action :create_if_missing
  backup false
  source freetds_url
  checksum node['freetds']['checksum'] if node['freetds']['checksum']
end

bash "build freetds" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    tar zxf freetds-#{version}.tar.gz
    (cd freetds-#{version} && CFLAGS='-fPIC' ./configure #{configure_options})
    (cd freetds-#{version} && make && make install)
  EOF
  not_if 'which tsql'
end

template "/usr/local/etc/freetds.conf" do
  source "freetds.conf.erb"
  owner 'root'
  group 'root'
  mode '0644'
end
