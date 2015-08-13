#
# Cookbook Name:: setupAppServerNode
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "apache2::mod_proxy"
include_recipe "apache2::mod_proxy_http"

apache_site "default" do
	enable true
end

#template "#{node['apache']['dir']}/sites-available/proxy.conf" do
#	source "proxy.conf.erb"
#	variables({
#		:port => 80,
#		:proxypass_base => "/",
#		:proxypass_target => "127.0.0.1:8080"
#	})
#	action :create
#end

#apache_site "proxy" do
#	enable true
#end
