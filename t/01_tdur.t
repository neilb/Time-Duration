# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

use strict;
use Test;

my @them;
BEGIN { plan('tests' => 230) };
BEGIN { print "# Perl version $] under $^O\n" }

use Time::Duration;
ok 1;
print "# Time::Duration version $Time::Duration::VERSION\n";

use constant MINUTE =>   60;
use constant HOUR   => 3600;
use constant DAY    =>   24 * HOUR;
use constant YEAR   =>  365 * DAY;

 #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
print "# Basic tests...\n";

ok( sub{duration(    )}, '0 seconds');
ok( sub{duration(   0)}, '0 seconds');
ok( sub{duration(   1)}, '1 second');
ok( sub{duration(  -1)}, '1 second');
ok( sub{duration(   2)}, '2 seconds');
ok( sub{duration(  -2)}, '2 seconds');
  
ok( sub{later(   0)}, 'right then');
ok( sub{later(   2)}, '2 seconds later');
ok( sub{later(  -2)}, '2 seconds earlier');
ok( sub{earlier( 0)}, 'right then');
ok( sub{earlier( 2)}, '2 seconds earlier');
ok( sub{earlier(-2)}, '2 seconds later');
  
ok( sub{ago(      0)}, 'right now');
ok( sub{ago(      2)}, '2 seconds ago');
ok( sub{ago(     -2)}, '2 seconds from now');
ok( sub{from_now( 0)}, 'right now');
ok( sub{from_now( 2)}, '2 seconds from now');
ok( sub{from_now(-2)}, '2 seconds ago');

 
 #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 # TODO: Make these table-driven. But first, get the coverage sorted.
print "# Advanced tests...\n";

my $v;  #scratch var

$v = 0;
ok(sub {later(          $v   )}, 'right then');
ok(sub {later(          $v, 3)}, 'right then');
ok(sub {later_exact(    $v   )}, 'right then');
ok(sub {earlier_exact(  $v   )}, 'right then');
ok(sub {ago_exact(      $v   )}, 'right now');
ok(sub {from_now_exact( $v   )}, 'right now');

$v = 1;
ok(sub {later(          $v   )}, '1 second later');
ok(sub {later(          $v, 3)}, '1 second later');
ok(sub {later_exact(    $v   )}, '1 second later');
ok(sub {earlier_exact(  $v   )}, '1 second earlier');
ok(sub {ago_exact(      $v   )}, '1 second ago');
ok(sub {from_now_exact( $v   )}, '1 second from now');

$v = 30;
ok(sub {later(          $v   )}, '30 seconds later');
ok(sub {later(          $v, 3)}, '30 seconds later');
ok(sub {later_exact(    $v   )}, '30 seconds later');
ok(sub {earlier_exact(  $v   )}, '30 seconds earlier');
ok(sub {ago_exact(      $v   )}, '30 seconds ago');
ok(sub {from_now_exact( $v   )}, '30 seconds from now');

$v = 46;
ok(sub {later(          $v   )}, '46 seconds later');
ok(sub {later(          $v, 3)}, '46 seconds later');
ok(sub {later_exact(    $v   )}, '46 seconds later');
ok(sub {earlier_exact(  $v   )}, '46 seconds earlier');
ok(sub {ago_exact(      $v   )}, '46 seconds ago');
ok(sub {from_now_exact( $v   )}, '46 seconds from now');

$v = 59;
ok(sub {later(          $v   )}, '59 seconds later');
ok(sub {later(          $v, 3)}, '59 seconds later');
ok(sub {later_exact(    $v   )}, '59 seconds later');
ok(sub {earlier_exact(  $v   )}, '59 seconds earlier');
ok(sub {ago_exact(      $v   )}, '59 seconds ago');
ok(sub {from_now_exact( $v   )}, '59 seconds from now');

$v = 61;
ok(sub {later(         $v   )}, '1 minute and 1 second later');
ok(sub {later(         $v, 3)}, '1 minute and 1 second later');
ok(sub {later_exact(   $v   )}, '1 minute and 1 second later');
ok(sub {earlier_exact( $v   )}, '1 minute and 1 second earlier');
ok(sub {ago_exact( $v   )}, '1 minute and 1 second ago');
ok(sub {from_now_exact( $v   )}, '1 minute and 1 second from now');

$v = 3599;
ok(sub {later(         $v   )}, '59 minutes and 59 seconds later');
ok(sub {later(         $v, 3)}, '59 minutes and 59 seconds later');
ok(sub {later_exact(   $v   )}, '59 minutes and 59 seconds later');
ok(sub {earlier_exact( $v   )}, '59 minutes and 59 seconds earlier');
ok(sub {ago_exact( $v   )}, '59 minutes and 59 seconds ago');
ok(sub {from_now_exact( $v   )}, '59 minutes and 59 seconds from now');

$v = 3600;
ok(sub {later(         $v   )}, '1 hour later');
ok(sub {later(         $v, 3)}, '1 hour later');
ok(sub {later_exact(   $v   )}, '1 hour later');
ok(sub {earlier_exact( $v   )}, '1 hour earlier');
ok(sub {ago_exact( $v   )}, '1 hour ago');
ok(sub {from_now_exact( $v   )}, '1 hour from now');

$v = 3601;
ok(sub {later(         $v   )}, '1 hour and 1 second later');
ok(sub {later(         $v, 3)}, '1 hour and 1 second later');
ok(sub {later_exact(   $v   )}, '1 hour and 1 second later');
ok(sub {earlier_exact( $v   )}, '1 hour and 1 second earlier');
ok(sub {ago_exact( $v   )}, '1 hour and 1 second ago');
ok(sub {from_now_exact( $v   )}, '1 hour and 1 second from now');

$v = 3630;
ok(sub {later(         $v   )}, '1 hour and 30 seconds later');
ok(sub {later(         $v, 3)}, '1 hour and 30 seconds later');
ok(sub {later_exact(   $v   )}, '1 hour and 30 seconds later');
ok(sub {earlier_exact( $v   )}, '1 hour and 30 seconds earlier');
ok(sub {ago_exact( $v   )}, '1 hour and 30 seconds ago');
ok(sub {from_now_exact( $v   )}, '1 hour and 30 seconds from now');

$v = 3800;
ok(sub {later(         $v   )}, '1 hour and 3 minutes later');
ok(sub {later(         $v, 3)}, '1 hour, 3 minutes, and 20 seconds later');
ok(sub {later_exact(   $v   )}, '1 hour, 3 minutes, and 20 seconds later');
ok(sub {earlier_exact( $v   )}, '1 hour, 3 minutes, and 20 seconds earlier');
ok(sub {ago_exact( $v   )}, '1 hour, 3 minutes, and 20 seconds ago');
ok(sub {from_now_exact( $v   )}, '1 hour, 3 minutes, and 20 seconds from now');

$v = 3820;
ok(sub {later(         $v   )}, '1 hour and 4 minutes later');
ok(sub {later(         $v, 3)}, '1 hour, 3 minutes, and 40 seconds later');
ok(sub {later_exact(   $v   )}, '1 hour, 3 minutes, and 40 seconds later');
ok(sub {earlier_exact( $v   )}, '1 hour, 3 minutes, and 40 seconds earlier');
ok(sub {ago_exact( $v   )}, '1 hour, 3 minutes, and 40 seconds ago');
ok(sub {from_now_exact( $v   )}, '1 hour, 3 minutes, and 40 seconds from now');

$v = DAY + - HOUR + -28;
ok(sub {later(         $v   )}, '23 hours later');
ok(sub {later(         $v, 3)}, '22 hours, 59 minutes, and 32 seconds later');
ok(sub {later_exact(   $v   )}, '22 hours, 59 minutes, and 32 seconds later');
ok(sub {earlier_exact( $v   )}, '22 hours, 59 minutes, and 32 seconds earlier');
ok(sub {ago_exact( $v   )}, '22 hours, 59 minutes, and 32 seconds ago');
ok(sub {from_now_exact( $v   )}, '22 hours, 59 minutes, and 32 seconds from now');

$v = DAY + - HOUR + MINUTE;
ok(sub {later(         $v   )}, '23 hours and 1 minute later');
ok(sub {later(         $v, 3)}, '23 hours and 1 minute later');
ok(sub {later_exact(   $v   )}, '23 hours and 1 minute later');
ok(sub {earlier_exact( $v   )}, '23 hours and 1 minute earlier');
ok(sub {ago_exact( $v   )}, '23 hours and 1 minute ago');
ok(sub {from_now_exact( $v   )}, '23 hours and 1 minute from now');

$v = DAY + - HOUR + 29 * MINUTE + 1;
ok(sub {later(         $v   )}, '23 hours and 29 minutes later');
ok(sub {later(         $v, 3)}, '23 hours, 29 minutes, and 1 second later');
ok(sub {later_exact(   $v   )}, '23 hours, 29 minutes, and 1 second later');
ok(sub {earlier_exact( $v   )}, '23 hours, 29 minutes, and 1 second earlier');
ok(sub {ago_exact( $v   )}, '23 hours, 29 minutes, and 1 second ago');
ok(sub {from_now_exact( $v   )}, '23 hours, 29 minutes, and 1 second from now');

$v = DAY + - HOUR + 29 * MINUTE + 31;
ok(sub {later(         $v   )}, '23 hours and 30 minutes later');
ok(sub {later(         $v, 3)}, '23 hours, 29 minutes, and 31 seconds later');
ok(sub {later_exact(   $v   )}, '23 hours, 29 minutes, and 31 seconds later');
ok(sub {earlier_exact( $v   )}, '23 hours, 29 minutes, and 31 seconds earlier');
ok(sub {ago_exact( $v   )}, '23 hours, 29 minutes, and 31 seconds ago');
ok(sub {from_now_exact( $v   )}, '23 hours, 29 minutes, and 31 seconds from now');

$v = DAY + - HOUR + 30 * MINUTE + 31;
ok(sub {later(         $v   )}, '23 hours and 31 minutes later');
ok(sub {later(         $v, 3)}, '23 hours, 30 minutes, and 31 seconds later');
ok(sub {later_exact(   $v   )}, '23 hours, 30 minutes, and 31 seconds later');
ok(sub {earlier_exact( $v   )}, '23 hours, 30 minutes, and 31 seconds earlier');
ok(sub {ago_exact( $v   )}, '23 hours, 30 minutes, and 31 seconds ago');
ok(sub {from_now_exact( $v   )}, '23 hours, 30 minutes, and 31 seconds from now');

$v = DAY + - HOUR + -28 + YEAR;
ok(sub {later(         $v   )}, '1 year and 23 hours later');
ok(sub {later(         $v, 3)}, '1 year and 23 hours later');
ok(sub {later_exact(   $v   )}, '1 year, 22 hours, 59 minutes, and 32 seconds later');
ok(sub {earlier_exact( $v   )}, '1 year, 22 hours, 59 minutes, and 32 seconds earlier');
ok(sub {ago_exact( $v   )}, '1 year, 22 hours, 59 minutes, and 32 seconds ago');
ok(sub {from_now_exact( $v   )}, '1 year, 22 hours, 59 minutes, and 32 seconds from now');

$v = DAY + - HOUR + MINUTE + YEAR;
ok(sub {later(         $v   )}, '1 year and 23 hours later');
ok(sub {later(         $v, 3)}, '1 year, 23 hours, and 1 minute later');
ok(sub {later_exact(   $v   )}, '1 year, 23 hours, and 1 minute later');
ok(sub {earlier_exact( $v   )}, '1 year, 23 hours, and 1 minute earlier');
ok(sub {ago_exact( $v   )}, '1 year, 23 hours, and 1 minute ago');
ok(sub {from_now_exact( $v   )}, '1 year, 23 hours, and 1 minute from now');

$v = DAY + - HOUR + 29 * MINUTE + 1 + YEAR;
ok(sub {later(         $v   )}, '1 year and 23 hours later');
ok(sub {later(         $v, 3)}, '1 year, 23 hours, and 29 minutes later');
ok(sub {later_exact(   $v   )}, '1 year, 23 hours, 29 minutes, and 1 second later');
ok(sub {earlier_exact( $v   )}, '1 year, 23 hours, 29 minutes, and 1 second earlier');
ok(sub {ago_exact( $v   )}, '1 year, 23 hours, 29 minutes, and 1 second ago');
ok(sub {from_now_exact( $v   )}, '1 year, 23 hours, 29 minutes, and 1 second from now');

$v = DAY + - HOUR + 29 * MINUTE + 31 + YEAR;
ok(sub {later(         $v   )}, '1 year and 23 hours later');
ok(sub {later(         $v, 3)}, '1 year, 23 hours, and 30 minutes later');
ok(sub {later_exact(   $v   )}, '1 year, 23 hours, 29 minutes, and 31 seconds later');
ok(sub {earlier_exact( $v   )}, '1 year, 23 hours, 29 minutes, and 31 seconds earlier');
ok(sub {ago_exact( $v   )}, '1 year, 23 hours, 29 minutes, and 31 seconds ago');
ok(sub {from_now_exact( $v   )}, '1 year, 23 hours, 29 minutes, and 31 seconds from now');

$v = YEAR + 2 * HOUR + -1;
ok(sub {later(         $v   )}, '1 year and 2 hours later');
ok(sub {later(         $v, 3)}, '1 year and 2 hours later');
ok(sub {later_exact(   $v   )}, '1 year, 1 hour, 59 minutes, and 59 seconds later');
ok(sub {earlier_exact( $v   )}, '1 year, 1 hour, 59 minutes, and 59 seconds earlier');
ok(sub {ago_exact( $v   )}, '1 year, 1 hour, 59 minutes, and 59 seconds ago');
ok(sub {from_now_exact( $v   )}, '1 year, 1 hour, 59 minutes, and 59 seconds from now');

$v = YEAR + 2 * HOUR + 59;
ok(sub {later(         $v   )}, '1 year and 2 hours later');
ok(sub {later(         $v, 3)}, '1 year, 2 hours, and 59 seconds later');
ok(sub {later_exact(   $v   )}, '1 year, 2 hours, and 59 seconds later');
ok(sub {earlier_exact( $v   )}, '1 year, 2 hours, and 59 seconds earlier');
ok(sub {ago_exact( $v   )}, '1 year, 2 hours, and 59 seconds ago');
ok(sub {from_now_exact( $v   )}, '1 year, 2 hours, and 59 seconds from now');

$v = YEAR + DAY + 2 * HOUR + -1;
ok(sub {later(         $v   )}, '1 year and 1 day later');
ok(sub {later(         $v, 3)}, '1 year, 1 day, and 2 hours later');
ok(sub {later_exact(   $v   )}, '1 year, 1 day, 1 hour, 59 minutes, and 59 seconds later');
ok(sub {earlier_exact( $v   )}, '1 year, 1 day, 1 hour, 59 minutes, and 59 seconds earlier');
ok(sub {ago_exact( $v   )}, '1 year, 1 day, 1 hour, 59 minutes, and 59 seconds ago');
ok(sub {from_now_exact( $v   )}, '1 year, 1 day, 1 hour, 59 minutes, and 59 seconds from now');

$v = YEAR + DAY + 2 * HOUR + 59;
ok(sub {later(         $v   )}, '1 year and 1 day later');
ok(sub {later(         $v, 3)}, '1 year, 1 day, and 2 hours later');
ok(sub {later_exact(   $v   )}, '1 year, 1 day, 2 hours, and 59 seconds later');
ok(sub {earlier_exact( $v   )}, '1 year, 1 day, 2 hours, and 59 seconds earlier');
ok(sub {ago_exact( $v   )}, '1 year, 1 day, 2 hours, and 59 seconds ago');
ok(sub {from_now_exact( $v   )}, '1 year, 1 day, 2 hours, and 59 seconds from now');

$v = YEAR + - DAY + - 1;
ok(sub {later(         $v   )}, '364 days later');
ok(sub {later(         $v, 3)}, '364 days later');
ok(sub {later_exact(   $v   )}, '363 days, 23 hours, 59 minutes, and 59 seconds later');
ok(sub {earlier_exact( $v   )}, '363 days, 23 hours, 59 minutes, and 59 seconds earlier');
ok(sub {ago_exact( $v   )}, '363 days, 23 hours, 59 minutes, and 59 seconds ago');
ok(sub {from_now_exact( $v   )}, '363 days, 23 hours, 59 minutes, and 59 seconds from now');

$v = YEAR + - 1;
ok(sub {later(         $v   )}, '1 year later');
ok(sub {later(         $v, 3)}, '1 year later');
ok(sub {later_exact(   $v   )}, '364 days, 23 hours, 59 minutes, and 59 seconds later');
ok(sub {earlier_exact( $v   )}, '364 days, 23 hours, 59 minutes, and 59 seconds earlier');
ok(sub {ago_exact( $v   )}, '364 days, 23 hours, 59 minutes, and 59 seconds ago');
ok(sub {from_now_exact( $v   )}, '364 days, 23 hours, 59 minutes, and 59 seconds from now');



print "# And an advanced one to put duration thru its paces...\n";
$v = YEAR + DAY + 2 * HOUR + 59;
ok(sub {duration(       $v   )}, '1 year and 1 day');
ok(sub {duration(       $v, 3)}, '1 year, 1 day, and 2 hours');
ok(sub {duration_exact( $v   )}, '1 year, 1 day, 2 hours, and 59 seconds');
ok(sub {duration(      -$v   )}, '1 year and 1 day');
ok(sub {duration(      -$v, 3)}, '1 year, 1 day, and 2 hours');
ok(sub {duration_exact(-$v   )}, '1 year, 1 day, 2 hours, and 59 seconds');


# miscellaneous edge cases
ok(duration_exact(0,0),'0 seconds');
ok(duration_exact(0,1),'0 seconds');
ok(duration(0.001),'just now');
ok(Time::Duration::interval(63,2,' ago',' from now','just now'),'1 minute and 3 seconds from now');
ok(Time::Duration::interval(-63,2,' ago',' from now','just now'),'1 minute and 3 seconds ago');
ok(Time::Duration::interval(0,2,' ago',' from now','just now'),'just now');
ok(Time::Duration::interval(1515,2,' ago',' from now','just now'),'25 minutes and 15 seconds from now');
ok(Time::Duration::interval(1515,1,' ago',' from now','just now'),'25 minutes from now');
ok(Time::Duration::interval_exact(63,2,' ago',' from now','just now'),'1 minute and 3 seconds from now');
ok(Time::Duration::interval_exact(-63,2,' ago',' from now','just now'),'1 minute and 3 seconds ago');
ok(Time::Duration::interval_exact(0,2,' ago',' from now','just now'),'just now');
ok(Time::Duration::interval_exact(1515,2,' ago',' from now','just now'),'25 minutes and 15 seconds from now');
ok(Time::Duration::interval_exact(1515,1,' ago',' from now','just now'),'25 minutes and 15 seconds from now');

#~~~~~~~~

print "# Some tests of concise() ...\n";

ok( sub{concise duration(   0)}, '0s');
ok( sub{concise duration(   1)}, '1s');
ok( sub{concise duration(  -1)}, '1s');
ok( sub{concise duration(   2)}, '2s');
ok( sub{concise duration(  -2)}, '2s');
  
ok( sub{concise later(   0)}, 'right then');
ok( sub{concise later(   2)}, '2s later');
ok( sub{concise later(  -2)}, '2s earlier');
ok( sub{concise earlier( 0)}, 'right then');
ok( sub{concise earlier( 2)}, '2s earlier');
ok( sub{concise earlier(-2)}, '2s later');
  
ok( sub{concise ago(      0)}, 'right now');
ok( sub{concise ago(      2)}, '2s ago');
ok( sub{concise ago(     -2)}, '2s from now');
ok( sub{concise from_now( 0)}, 'right now');
ok( sub{concise from_now( 2)}, '2s from now');
ok( sub{concise from_now(-2)}, '2s ago');

$v = YEAR + DAY + 2 * HOUR + -1;
ok(sub {concise later(       $v   )}, '1y1d later');
ok(sub {concise later(       $v, 3)}, '1y1d2h later');
ok(sub {concise later_exact( $v   )}, '1y1d1h59m59s later');

$v = YEAR + DAY + 2 * HOUR + 59;
ok(sub {concise later(       $v   )}, '1y1d later');
ok(sub {concise later(       $v, 3)}, '1y1d2h later');
ok(sub {concise later_exact( $v   )}, '1y1d2h59s later');

$v = YEAR + - DAY + - 1;
ok(sub {concise later(       $v   )}, '364d later');
ok(sub {concise later(       $v, 3)}, '364d later');
ok(sub {concise later_exact( $v   )}, '363d23h59m59s later');

$v = YEAR + - 1;
ok(sub {concise later(       $v   )}, '1y later');
ok(sub {concise later(       $v, 3)}, '1y later');
ok(sub {concise later_exact( $v   )}, '364d23h59m59s later');



# That's it.
print "# And one for the road.\n";
ok 1;
print "# Done with of ", __FILE__, "\n";

