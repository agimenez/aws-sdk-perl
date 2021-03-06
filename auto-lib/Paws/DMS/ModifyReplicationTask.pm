
package Paws::DMS::ModifyReplicationTask;
  use Moose;
  has CdcStartTime => (is => 'ro', isa => 'Str');
  has MigrationType => (is => 'ro', isa => 'Str');
  has ReplicationTaskArn => (is => 'ro', isa => 'Str', required => 1);
  has ReplicationTaskIdentifier => (is => 'ro', isa => 'Str');
  has ReplicationTaskSettings => (is => 'ro', isa => 'Str');
  has TableMappings => (is => 'ro', isa => 'Str');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'ModifyReplicationTask');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DMS::ModifyReplicationTaskResponse');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::DMS::ModifyReplicationTask - Arguments for method ModifyReplicationTask on Paws::DMS

=head1 DESCRIPTION

This class represents the parameters used for calling the method ModifyReplicationTask on the 
AWS Database Migration Service service. Use the attributes of this class
as arguments to method ModifyReplicationTask.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to ModifyReplicationTask.

As an example:

  $service_obj->ModifyReplicationTask(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 CdcStartTime => Str

The start time for the Change Data Capture (CDC) operation.



=head2 MigrationType => Str

The migration type.

Valid values: full-load | cdc | full-load-and-cdc

Valid values are: C<"full-load">, C<"cdc">, C<"full-load-and-cdc">

=head2 B<REQUIRED> ReplicationTaskArn => Str

The Amazon Resource Name (ARN) of the replication task.



=head2 ReplicationTaskIdentifier => Str

The replication task identifier.

Constraints:

=over

=item *

Must contain from 1 to 63 alphanumeric characters or hyphens.

=item *

First character must be a letter.

=item *

Cannot end with a hyphen or contain two consecutive hyphens.

=back




=head2 ReplicationTaskSettings => Str

JSON file that contains settings for the task, such as target metadata
settings.



=head2 TableMappings => Str

The path of the JSON file that contains the table mappings. Preceed the
path with "file://".

For example, --table-mappings file://mappingfile.json




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method ModifyReplicationTask in L<Paws::DMS>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

