#
# Cookbook Name:: setupDBNode
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

config = data_bag_item("dbConfig", "mysql")

mysql_service 'default' do
	bind_address "0.0.0.0"
	port config["port"]
	initial_root_password config["rootPassword"]
	action [:create, :start]
end

mysql2_chef_gem 'default' do
	action :install
end

mysql_database config["dbName"] do
	connection(
		:host => '127.0.0.1',
		:username => config["user"],
		:password => config["password"]	
	)
	action :create
end
