package Paws::SimpleWorkflow::ActivityTaskCancelRequestedEventAttributes;
  use Moose;
  has ActivityId => (is => 'ro', isa => 'Str', xmlname => 'activityId', request_name => 'activityId', traits => ['Unwrapped','NameInRequest'], required => 1);
  has DecisionTaskCompletedEventId => (is => 'ro', isa => 'Int', xmlname => 'decisionTaskCompletedEventId', request_name => 'decisionTaskCompletedEventId', traits => ['Unwrapped','NameInRequest'], required => 1);
1;

### main pod documentation begin ###

=head1 NAME

Paws::SimpleWorkflow::ActivityTaskCancelRequestedEventAttributes

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::SimpleWorkflow::ActivityTaskCancelRequestedEventAttributes object:

  $service_obj->Method(Att1 => { ActivityId => $value, ..., DecisionTaskCompletedEventId => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::SimpleWorkflow::ActivityTaskCancelRequestedEventAttributes object:

  $result = $service_obj->Method(...);
  $result->Att1->ActivityId

=head1 DESCRIPTION

Provides details of the C<ActivityTaskCancelRequested> event.

=head1 ATTRIBUTES


=head2 B<REQUIRED> ActivityId => Str

  The unique ID of the task.


=head2 B<REQUIRED> DecisionTaskCompletedEventId => Int

  The ID of the C<DecisionTaskCompleted> event corresponding to the
decision task that resulted in the C<RequestCancelActivityTask>
decision for this cancellation request. This information can be useful
for diagnosing problems by tracing back the chain of events leading up
to this event.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::SimpleWorkflow>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

