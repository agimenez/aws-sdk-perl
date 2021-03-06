
package Paws::Batch::UpdateComputeEnvironmentResponse;
  use Moose;
  has ComputeEnvironmentArn => (is => 'ro', isa => 'Str');
  has ComputeEnvironmentName => (is => 'ro', isa => 'Str');

  has _request_id => (is => 'ro', isa => 'Str');
1;

### main pod documentation begin ###

=head1 NAME

Paws::Batch::UpdateComputeEnvironmentResponse

=head1 ATTRIBUTES


=head2 ComputeEnvironmentArn => Str

The Amazon Resource Name (ARN) of the compute environment.


=head2 ComputeEnvironmentName => Str

The name of compute environment.


=head2 _request_id => Str


=cut

