package login::View::TT;

use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    render_die => 1,
    INCLUDE_PATH       => [
        login->path_to( 'root' ),
        login->path_to( 'root', 'src'),
        
    ],
    TEMPLATE_EXTENSION => '.tt2',
    CATALYST_VAR       => 'Catalyst',
    FILTERS            => {
        title_case => sub { title_case(@_) },
    },
    TIMER              => 0,
);


=head1 NAME

login::View::TT - TT View for login

=head1 DESCRIPTION

TT View for login.

=head1 SEE ALSO

L<login>

=head1 AUTHOR

om,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
