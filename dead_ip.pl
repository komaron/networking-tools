#!/usr/local/bin/perl
#------------------------------------------------------------------------------
# DEAD IP'S (Get ride of them!!!!!)
#------------------------------------------------------------------------------
# Reports IP addresses that are not being used in a network and free them from 
# DNS and DHCP entries 
#
# Author::		Komaron James
# File::		dead_ip.pl
# Version::		Final
# Since::		Unknown 
# Language:: 	Perl 

#------------------------------------------------------------------------------
# LIBRARIES
#------------------------------------------------------------------------------
use Net::Ping;
use Sys::Hostname;
use Socket;
use Error qw(:try);
use Time::Piece;
use Time::Seconds;

require "/fs/network/libwtfb";


#------------------------------------------------------------------------------
# EXECUTABLE CODE
#------------------------------------------------------------------------------
$SWITCHDATA= loadSwitchData();
$currtime = time();
$monthLim = 12;
$p = Net::Ping-> new("tcp", 1);

print "Hostnames that are not Pinging for more that 12 months\n";
for($g = 130; $g <= 131; $g++){
        for($i= 1; $i <= 255; $i++){
	                $ip = "128.8.$g.$i";
                        if(!$p->ping($ip)){
	                        $ip = inet_aton($ip);
                       $name  = gethostbyaddr($ip, AF_INET) or print "128.8.$g.$i";
                #        print $name;
                 #       print " -> 128.8.$g.$i\n";
                        $ip = "128.8.$g.$i";
			$delta=Time::Seconds->new($currtime-$SWITCHDATA->{'ips'}->{$ip}->{'lastupdated'});
		$delta=$delta->months;
		$delta=sprintf("%d months", $delta);
		if($delta>$monthLim){
		print $name;
		print "  $delta\n";
			}							                        }
        }
}

