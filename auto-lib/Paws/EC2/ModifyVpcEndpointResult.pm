
package Paws::EC2::ModifyVpcEndpointResult;
  use Moose;
  has Return => (is => 'ro', isa => 'Bool', xmlname => 'return', traits => ['Unwrapped',]);

  has _request_id => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::EC2::ModifyVpcEndpointResult

=head1 ATTRIBUTES


=head2 Return => Bool

Returns C<true> if the request succeeds; otherwise, it returns an
error.


=head2 _request_id => Str


=cut

