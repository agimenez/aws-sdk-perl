
package Paws::Lightsail::GetInstancePortStatesResult;
  use Moose;
  has PortStates => (is => 'ro', isa => 'ArrayRef[Str|Undef]', traits => ['Unwrapped'], xmlname => 'portStates' );

  has _request_id => (is => 'ro', isa => 'Str');

### main pod documentation begin ###

=head1 NAME

Paws::Lightsail::GetInstancePortStatesResult

=head1 ATTRIBUTES


=head2 PortStates => ArrayRef[Str|Undef]

Information about the port states resulting from your request.


=head2 _request_id => Str


=cut

1;