
package Paws::DataPipeline::QueryObjectsOutput;
  use Moose;
  has HasMoreResults => (is => 'ro', isa => 'Bool', traits => ['Unwrapped'], xmlname => 'hasMoreResults' );
  has Ids => (is => 'ro', isa => 'ArrayRef[Str|Undef]', traits => ['Unwrapped'], xmlname => 'ids' );
  has Marker => (is => 'ro', isa => 'Str', traits => ['Unwrapped'], xmlname => 'marker' );

  has _request_id => (is => 'ro', isa => 'Str');

### main pod documentation begin ###

=head1 NAME

Paws::DataPipeline::QueryObjectsOutput

=head1 ATTRIBUTES


=head2 HasMoreResults => Bool

Indicates whether there are more results that can be obtained by a
subsequent call.


=head2 Ids => ArrayRef[Str|Undef]

The identifiers that match the query selectors.


=head2 Marker => Str

The starting point for the next page of results. To view the next page
of results, call C<QueryObjects> again with this marker value. If the
value is null, there are no more results.


=head2 _request_id => Str


=cut

1;