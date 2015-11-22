package login::Controller::Root;
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


BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

login::Controller::Root - Root Controller for login

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $self->_config_db( $c );
    my $ra_db = $self->dbh();
    
    

    $c->stash->{template} = 'welcome.tt2';
}

#sub login :Local {
#    my ( $self, $c ) = @_;
#    # Hello World
#    $c->stash->{template} = 'login.tt2';
#}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;

    $c->stash->{template} = 'not_found.tt2';
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}


sub _config_db {
    my (
        $self,
        $c,
        $db_name
    ) = @_;

    my $db_config = $c->config->{ 'site::DB' };
    my $dns_info  = $c->config->{ 'dsn_info' };
    
    my $dsn = $dns_info->{'dbi'}
      . ':' . $dns_info->{'database'}
      . ':' . $dns_info->{'host'}
      . ':' . $dns_info->{'port'};

    $db_config->{'connect_info'}->{'dsn'} = $dsn;
    my $dbh = login::Model::DB->new( $db_config );
    $self->dbh( $dbh );
}



=head1 AUTHOR

om,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
