#
# Cookbook Name:: resource-lifecycle
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

resource_lifecycle 'foo' do 
  only_if do 
  	puts "ONLY IF"
  	true
  end
end

puts "END RECIPE"