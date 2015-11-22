package login::Controller::Logout;
use Moose;
use namespace::autoclean;


use login::Model::DB;

#- dbh Attribute
has 'dbh' => (
    isa      => 'login::Model::DB',
    is       => 'rw',
    required => 1,
    default  => sub { login::Model::DB->new() }
);
BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

login::Controller::Logout - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ($self, $c) = @_;
    # Send the user to the starting point
    $c->response->redirect($c->uri_for('/'));
}



=encoding utf8

=head1 AUTHOR

om,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
