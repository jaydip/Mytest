package Conf::Schema::DB::Result::LoginDetails;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Conf::Schema::DB::Result::LoginDetails

=cut

__PACKAGE__->table("login_details");

=head1 ACCESSORS

=head2 login_id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 login_user_name

  data_type: 'varchar'
  is_nullable: 0
   size: 255

=head2 login_user_pass

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 login_created_time

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "login_id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "login_user_name",
  { data_type => "text", is_nullable => 1 },
  "login_user_pass",
  { data_type => "text", is_nullable => 1 },
  "login_created_time",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
);

__PACKAGE__->set_primary_key("login_id");


# Created by DBIx::Class::Schema::Loader v0.07010 
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:89i2SEE9cQqkSMuaklkprg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
