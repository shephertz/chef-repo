#
# Cookbook Name:: setupWebNode
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service 'tomcat6' do
	action :stop
end

config = data_bag_item("appConfig", "tomcat")
dbConfig = data_bag_item("dbConfig", "mysql")

directory "#{node["tomcat"]["webapp_dir"]}/ROOT" do
	recursive true
	action :delete
end

remote_file "#{node["tomcat"]["webapp_dir"]}/#{config["warFile"]}" do
	source config["warURL"]
#	source node['appNode']['warURL']
	mode '0777'
end

template "#{node["tomcat"]["webapp_dir"]}/Config.properties" do
	source "config.properties.erb"
	variables({
		:user => dbConfig["user"],
		:port => dbConfig["port"],
		:password => dbConfig["password"],
		:address => dbConfig["address"],
		:dbname => dbConfig["dbName"] 
	})
end

service 'tomcat6' do
	action :start
end
