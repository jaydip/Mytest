use strict;
use warnings;
use Test::More;


use Catalyst::Test 'login';
use login::Controller::Login;

ok( request('/login')->is_success, 'Request should succeed' );
done_testing();
