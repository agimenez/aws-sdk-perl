package Paws::Discovery::AgentInfo;
  use Moose;
  has AgentId => (is => 'ro', isa => 'Str', xmlname => 'agentId', request_name => 'agentId', traits => ['Unwrapped','NameInRequest']);
  has AgentNetworkInfoList => (is => 'ro', isa => 'ArrayRef[Paws::Discovery::AgentNetworkInfo]', xmlname => 'agentNetworkInfoList', request_name => 'agentNetworkInfoList', traits => ['Unwrapped','NameInRequest']);
  has AgentType => (is => 'ro', isa => 'Str', xmlname => 'agentType', request_name => 'agentType', traits => ['Unwrapped','NameInRequest']);
  has CollectionStatus => (is => 'ro', isa => 'Str', xmlname => 'collectionStatus', request_name => 'collectionStatus', traits => ['Unwrapped','NameInRequest']);
  has ConnectorId => (is => 'ro', isa => 'Str', xmlname => 'connectorId', request_name => 'connectorId', traits => ['Unwrapped','NameInRequest']);
  has Health => (is => 'ro', isa => 'Str', xmlname => 'health', request_name => 'health', traits => ['Unwrapped','NameInRequest']);
  has HostName => (is => 'ro', isa => 'Str', xmlname => 'hostName', request_name => 'hostName', traits => ['Unwrapped','NameInRequest']);
  has LastHealthPingTime => (is => 'ro', isa => 'Str', xmlname => 'lastHealthPingTime', request_name => 'lastHealthPingTime', traits => ['Unwrapped','NameInRequest']);
  has RegisteredTime => (is => 'ro', isa => 'Str', xmlname => 'registeredTime', request_name => 'registeredTime', traits => ['Unwrapped','NameInRequest']);
  has Version => (is => 'ro', isa => 'Str', xmlname => 'version', request_name => 'version', traits => ['Unwrapped','NameInRequest']);
1;

### main pod documentation begin ###

=head1 NAME

Paws::Discovery::AgentInfo

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::Discovery::AgentInfo object:

  $service_obj->Method(Att1 => { AgentId => $value, ..., Version => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::Discovery::AgentInfo object:

  $result = $service_obj->Method(...);
  $result->Att1->AgentId

=head1 DESCRIPTION

Information about agents or connectors associated with the
userE<rsquo>s AWS account. Information includes agent or connector IDs,
IP addresses, media access control (MAC) addresses, agent or connector
health, hostname where the agent or connector resides, and agent
version for each agent.

=head1 ATTRIBUTES


=head2 AgentId => Str

  The agent or connector ID.


=head2 AgentNetworkInfoList => ArrayRef[L<Paws::Discovery::AgentNetworkInfo>]

  Network details about the host where the agent or connector resides.


=head2 AgentType => Str

  Type of agent.


=head2 CollectionStatus => Str

  Status of the collection process for an agent or connector.


=head2 ConnectorId => Str

  The ID of the connector.


=head2 Health => Str

  The health of the agent or connector.


=head2 HostName => Str

  The name of the host where the agent or connector resides. The host can
be a server or virtual machine.


=head2 LastHealthPingTime => Str

  Time since agent or connector health was reported.


=head2 RegisteredTime => Str

  Agent's first registration time stamp in UTC.


=head2 Version => Str

  The agent or connector version.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::Discovery>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

