use Test;
BEGIN { plan tests => 2 };
use Data::Uniqid qw ( suniqid uniqid luniqid ) ;

print suniqid . "\n";
print uniqid . "\n";
print luniqid . "\n";


use Sys::Hostname;
my($ia,$ib,$ic,$id)=unpack("C4", (gethostbyname(hostname()))[4]);

if ($ia=~/\d+/ && $ia>0 && $ib=~/\d+/ && $ib>0 && 
    $ic=~/\d+/ && $ic>0 && $id=~/\d+/ && $id>0 ) {;ok(1);}
else {;ok(0);}

use Time::HiRes qw( gettimeofday );
my($n)=0;  
for (0..9) {
  my($u)=(gettimeofday())[1]-(gettimeofday())[1];
  if ($u>=0) {;$n++;}
}

if ($n==0) {;ok(1);}
else {;ok(0);}


