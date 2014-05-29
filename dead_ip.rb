#!/usr/bin/env ruby


#------------------------------------------------------------------------------
# PING!!!!!
#------------------------------------------------------------------------------
# Reports IP addresses that are not being used in a network
# 
# Author::		Komaron James
# File::		dead_ip.rb
# Version::		Unknown
# Since::		2013-02-10
# Language:: 	Ruby

#------------------------------------------------------------------------------
# LIBRARIES
#------------------------------------------------------------------------------
require 'resolv'
require "rubygems"
require 'ping'


#------------------------------------------------------------------------------
# EXECUTABLE CODE
#------------------------------------------------------------------------------
puts "Hostnames that are not Pinging"
        for  i in (20..85)
                if (Ping.pingecho("10.0.0.#{i}",1))
                begin
                puts Resolv.getname("10.0.0.#{i}")
                rescue
                puts"No hostname associated with 10.0.0.#{i}"
                        end
                end
end

