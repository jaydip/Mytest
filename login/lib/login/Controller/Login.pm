package login::Controller::Login;
use Moose;
use namespace::autoclean;
use JSON;
use lib qw(../..);
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

login::Controller::Login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash->{template} = 'login.tt2';
}

sub check :Local {
    my ( $self, $c ) = @_;
    my $params = $c->request->parameters();
    $self->_config_db( $c );
    my $app_db = $self->dbh();
    my $user_details  =
        $app_db->resultset('LoginDetails')->get_user_details($params)->first();
    
    #use Data::Dumper::Simple;
    #print "<pre>".Dumper($user_details)."</pre>";
    if ($user_details) {
        my $login_id = $user_details->get_column('login_id');
        my $user_name = $user_details->get_column('login_user_name');
        $c->stash(
            'user_name'    => $user_name,
            'template'     => 'success.tt2'
        );
    }
    else{
        $c->stash(
            'error'    => 1,
            'template'     => 'login.tt2'
        );
        
    }
}


sub join :Local {
    my ( $self, $c ) = @_;
    my $params = $c->request->parameters();
    $self->_config_db( $c );
    my $app_db = $self->dbh();
    my $status = $app_db->resultset('LoginDetails')->insert_user_details($params);
    my $user_name = $params->{username};
    $c->stash(
            'join'      => 1,
            'user_name' =>  $user_name,
            'template'  => 'success.tt2'
    ) if $status;
    
    unless ($status){
        $c->stash(
            'error'     => 1,
            'message'   => 'You already joined, Please Login Here!'
        );
        #$c->forward( "View::JSON" );
        #$c->response->body( "You already joined, Please Login Here!" );
        $c->forward('/login/check');
    }
}


# db config
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


=encoding utf8

=head1 AUTHOR

om,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
