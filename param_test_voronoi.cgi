#!/usr/bin/perl -w
use strict;
use CGI qw(:standard);

print header;
print "<p>The dataset to use is: ", param('dataset'), "<br/>",
      "The cell color to use is: ", param('eColor'), "<br/>",
	  "The stem length to use is: ", param('qDist'), "<br/>",
	  "The number of spanning lines to use is: ", param('kQt'), "<br/>",
	  "</p>";
	  
my $n = substr(param('dataset'),0,3);
my $eColor = substr(param('eColor'),0,1);
my $qDist = substr(param('qDist'),0,4);
my $kQt = substr(param('kQt'),0,2);

my $cmd ="./run_voronoi4web.sh /usr/local/MATLAB/R2014a mdv /var/www/img $n $eColor $qDist $kQt";
#"matlab -nosplash -r \"sphere_voronoi_display($n,$eColor,2.0,0.4,'-yo',1.0,$qDist,'b',1.0,$kQt,'b',0.5,'..\\..\\cmdline.bob')\;exit\"";
#print "the command will be: $cmd";
system($cmd);
print "<img id=\"bob\" alt=\"Resulting Image\" src=\"..\\..\\img\\cmdline.bob\" />";
