use strict;
use warnings;

use login;

my $app = login->apply_default_middlewares(login->psgi_app);
$app;

