package Conf::Schema::DB::ResultSet::LoginDetails;
use strict;
use warnings;
use base 'DBIx::Class::ResultSet';

=head1 NAME

Conf::Schema::DB::ResultSet::LoginDetails;


=head1 DESCRIPTION

Methods of this module will directly access via schema object of
Conf::Schema::DB::ResultSet::LoginDetails;

=head2 Methods

=over 12

=item C<check_login_details>

Input: username, pass
Output: object of ResultSet
Description: This method will populate list of available user with  input user n password match.
             We could perform further filter on search result.

=cut

sub get_user_details {
    my ( $self, $params  ) = @_;
    my $user_name = $params->{username};
    my $pass  =  $params->{password};
    my $search_param = {
        'login_user_name'    => $user_name, 
        'login_user_pass'  => $pass,
    };

    return $self->search( $search_param);
}


sub insert_user_details {
    my ( $self, $params  ) = @_;
    my $user_name = $params->{username};
    my $pass  =  $params->{password};
    my $insert_param = {
        'login_user_name'    => $user_name, 
        'login_user_pass'    => $pass,
        'login_created_time' => \'now()'
    };
    my $check_exists = $self->get_user_details($params)->first();
    return 0 if $check_exists;
    $self->create($insert_param);
    return 1;

}
1;