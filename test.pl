use Test;
BEGIN { plan tests => 5 };
use Data::Uniqid qw ( suniqid uniqid luniqid ) ;

print "suniqid -> " . suniqid . "\n";
print "uniqid  -> " . uniqid . "\n";
print "luniqid -> " . luniqid . "\n";

for (0..100) {
	$id=suniqid;
	if ($id{$id}) {;$err++;}
	$id{$id}++;
}
if ($err>0) {;ok(0);} else {;ok(1);}

for (0..100) {
	$id=uniqid;
	if ($id{$id}) {;$err++;}
	$id{$id}++;
}
if ($err>0) {;ok(0);} else {;ok(1);}

for (0..100) {
	$id=luniqid;
	if ($id{$id}) {;$err++;}
	$id{$id}++;
}
if ($err>0) {;ok(0);} else {;ok(1);}

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


