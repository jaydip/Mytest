package Conf::Schema::DB;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use namespace::autoclean;
extends 'DBIx::Class::Schema';

#__PACKAGE__->load_namespaces;
__PACKAGE__->load_namespaces(
    default_resultset_class => '+DBIx::Class::ResultSet::Void'
);

# Created by DBIx::Class::Schema::Loader v0.07010 
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YGZ43OMrCJNbh9UokcGSiw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
