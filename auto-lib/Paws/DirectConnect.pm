package Paws::DirectConnect;
  use Moose;
  sub service { 'directconnect' }
  sub version { '2012-10-25' }
  sub target_prefix { 'OvertureService' }
  sub json_version { "1.1" }
  has max_attempts => (is => 'ro', isa => 'Int', default => 5);
  has retry => (is => 'ro', isa => 'HashRef', default => sub {
    { base => 'rand', type => 'exponential', growth_factor => 2 }
  });
  has retriables => (is => 'ro', isa => 'ArrayRef', default => sub { [
  ] });

  with 'Paws::API::Caller', 'Paws::API::EndpointResolver', 'Paws::Net::V4Signature', 'Paws::Net::JsonCaller', 'Paws::Net::JsonResponse';

  
  sub AllocateConnectionOnInterconnect {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::AllocateConnectionOnInterconnect', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub AllocatePrivateVirtualInterface {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::AllocatePrivateVirtualInterface', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub AllocatePublicVirtualInterface {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::AllocatePublicVirtualInterface', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ConfirmConnection {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::ConfirmConnection', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ConfirmPrivateVirtualInterface {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::ConfirmPrivateVirtualInterface', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ConfirmPublicVirtualInterface {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::ConfirmPublicVirtualInterface', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub CreateBGPPeer {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::CreateBGPPeer', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub CreateConnection {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::CreateConnection', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub CreateInterconnect {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::CreateInterconnect', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub CreatePrivateVirtualInterface {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::CreatePrivateVirtualInterface', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub CreatePublicVirtualInterface {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::CreatePublicVirtualInterface', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DeleteBGPPeer {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DeleteBGPPeer', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DeleteConnection {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DeleteConnection', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DeleteInterconnect {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DeleteInterconnect', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DeleteVirtualInterface {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DeleteVirtualInterface', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeConnectionLoa {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DescribeConnectionLoa', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeConnections {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DescribeConnections', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeConnectionsOnInterconnect {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DescribeConnectionsOnInterconnect', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeInterconnectLoa {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DescribeInterconnectLoa', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeInterconnects {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DescribeInterconnects', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeLocations {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DescribeLocations', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeTags {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DescribeTags', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeVirtualGateways {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DescribeVirtualGateways', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeVirtualInterfaces {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::DescribeVirtualInterfaces', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub TagResource {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::TagResource', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub UntagResource {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DirectConnect::UntagResource', @_);
    return $self->caller->do_call($self, $call_object);
  }
  


  sub operations { qw/AllocateConnectionOnInterconnect AllocatePrivateVirtualInterface AllocatePublicVirtualInterface ConfirmConnection ConfirmPrivateVirtualInterface ConfirmPublicVirtualInterface CreateBGPPeer CreateConnection CreateInterconnect CreatePrivateVirtualInterface CreatePublicVirtualInterface DeleteBGPPeer DeleteConnection DeleteInterconnect DeleteVirtualInterface DescribeConnectionLoa DescribeConnections DescribeConnectionsOnInterconnect DescribeInterconnectLoa DescribeInterconnects DescribeLocations DescribeTags DescribeVirtualGateways DescribeVirtualInterfaces TagResource UntagResource / }

1;

### main pod documentation begin ###

=head1 NAME

Paws::DirectConnect - Perl Interface to AWS AWS Direct Connect

=head1 SYNOPSIS

  use Paws;

  my $obj = Paws->service('DirectConnect');
  my $res = $obj->Method(
    Arg1 => $val1,
    Arg2 => [ 'V1', 'V2' ],
    # if Arg3 is an object, the HashRef will be used as arguments to the constructor
    # of the arguments type
    Arg3 => { Att1 => 'Val1' },
    # if Arg4 is an array of objects, the HashRefs will be passed as arguments to
    # the constructor of the arguments type
    Arg4 => [ { Att1 => 'Val1'  }, { Att1 => 'Val2' } ],
  );

=head1 DESCRIPTION

AWS Direct Connect links your internal network to an AWS Direct Connect
location over a standard 1 gigabit or 10 gigabit Ethernet fiber-optic
cable. One end of the cable is connected to your router, the other to
an AWS Direct Connect router. With this connection in place, you can
create virtual interfaces directly to the AWS cloud (for example, to
Amazon Elastic Compute Cloud (Amazon EC2) and Amazon Simple Storage
Service (Amazon S3)) and to Amazon Virtual Private Cloud (Amazon VPC),
bypassing Internet service providers in your network path. An AWS
Direct Connect location provides access to AWS in the region it is
associated with, as well as access to other US regions. For example,
you can provision a single connection to any AWS Direct Connect
location in the US and use it to access public AWS services in all US
Regions and AWS GovCloud (US).

=head1 METHODS

=head2 AllocateConnectionOnInterconnect(Bandwidth => Str, ConnectionName => Str, InterconnectId => Str, OwnerAccount => Str, Vlan => Int)

Each argument is described in detail in: L<Paws::DirectConnect::AllocateConnectionOnInterconnect>

Returns: a L<Paws::DirectConnect::Connection> instance

  Creates a hosted connection on an interconnect.

Allocates a VLAN number and a specified amount of bandwidth for use by
a hosted connection on the given interconnect.

This is intended for use by AWS Direct Connect partners only.


=head2 AllocatePrivateVirtualInterface(ConnectionId => Str, NewPrivateVirtualInterfaceAllocation => L<Paws::DirectConnect::NewPrivateVirtualInterfaceAllocation>, OwnerAccount => Str)

Each argument is described in detail in: L<Paws::DirectConnect::AllocatePrivateVirtualInterface>

Returns: a L<Paws::DirectConnect::VirtualInterface> instance

  Provisions a private virtual interface to be owned by a different
customer.

The owner of a connection calls this function to provision a private
virtual interface which will be owned by another AWS customer.

Virtual interfaces created using this function must be confirmed by the
virtual interface owner by calling ConfirmPrivateVirtualInterface.
Until this step has been completed, the virtual interface will be in
'Confirming' state, and will not be available for handling traffic.


=head2 AllocatePublicVirtualInterface(ConnectionId => Str, NewPublicVirtualInterfaceAllocation => L<Paws::DirectConnect::NewPublicVirtualInterfaceAllocation>, OwnerAccount => Str)

Each argument is described in detail in: L<Paws::DirectConnect::AllocatePublicVirtualInterface>

Returns: a L<Paws::DirectConnect::VirtualInterface> instance

  Provisions a public virtual interface to be owned by a different
customer.

The owner of a connection calls this function to provision a public
virtual interface which will be owned by another AWS customer.

Virtual interfaces created using this function must be confirmed by the
virtual interface owner by calling ConfirmPublicVirtualInterface. Until
this step has been completed, the virtual interface will be in
'Confirming' state, and will not be available for handling traffic.

When creating an IPv6 public virtual interface (addressFamily is
'ipv6'), the customer and amazon address fields should be left blank to
use auto-assigned IPv6 space. Custom IPv6 Addresses are currently not
supported.


=head2 ConfirmConnection(ConnectionId => Str)

Each argument is described in detail in: L<Paws::DirectConnect::ConfirmConnection>

Returns: a L<Paws::DirectConnect::ConfirmConnectionResponse> instance

  Confirm the creation of a hosted connection on an interconnect.

Upon creation, the hosted connection is initially in the 'Ordering'
state, and will remain in this state until the owner calls
ConfirmConnection to confirm creation of the hosted connection.


=head2 ConfirmPrivateVirtualInterface(VirtualGatewayId => Str, VirtualInterfaceId => Str)

Each argument is described in detail in: L<Paws::DirectConnect::ConfirmPrivateVirtualInterface>

Returns: a L<Paws::DirectConnect::ConfirmPrivateVirtualInterfaceResponse> instance

  Accept ownership of a private virtual interface created by another
customer.

After the virtual interface owner calls this function, the virtual
interface will be created and attached to the given virtual private
gateway, and will be available for handling traffic.


=head2 ConfirmPublicVirtualInterface(VirtualInterfaceId => Str)

Each argument is described in detail in: L<Paws::DirectConnect::ConfirmPublicVirtualInterface>

Returns: a L<Paws::DirectConnect::ConfirmPublicVirtualInterfaceResponse> instance

  Accept ownership of a public virtual interface created by another
customer.

After the virtual interface owner calls this function, the specified
virtual interface will be created and made available for handling
traffic.


=head2 CreateBGPPeer([NewBGPPeer => L<Paws::DirectConnect::NewBGPPeer>, VirtualInterfaceId => Str])

Each argument is described in detail in: L<Paws::DirectConnect::CreateBGPPeer>

Returns: a L<Paws::DirectConnect::CreateBGPPeerResponse> instance

  Creates a new BGP peer on a specified virtual interface. The BGP peer
cannot be in the same address family (IPv4/IPv6) of an existing BGP
peer on the virtual interface.

You must create a BGP peer for the corresponding address family in
order to access AWS resources that also use that address family.

When creating a IPv6 BGP peer, the Amazon address and customer address
fields must be left blank. IPv6 addresses are automatically assigned
from Amazon's pool of IPv6 addresses; you cannot specify custom IPv6
addresses.

For a public virtual interface, the Autonomous System Number (ASN) must
be private or already whitelisted for the virtual interface.


=head2 CreateConnection(Bandwidth => Str, ConnectionName => Str, Location => Str)

Each argument is described in detail in: L<Paws::DirectConnect::CreateConnection>

Returns: a L<Paws::DirectConnect::Connection> instance

  Creates a new connection between the customer network and a specific
AWS Direct Connect location.

A connection links your internal network to an AWS Direct Connect
location over a standard 1 gigabit or 10 gigabit Ethernet fiber-optic
cable. One end of the cable is connected to your router, the other to
an AWS Direct Connect router. An AWS Direct Connect location provides
access to Amazon Web Services in the region it is associated with. You
can establish connections with AWS Direct Connect locations in multiple
regions, but a connection in one region does not provide connectivity
to other regions.


=head2 CreateInterconnect(Bandwidth => Str, InterconnectName => Str, Location => Str)

Each argument is described in detail in: L<Paws::DirectConnect::CreateInterconnect>

Returns: a L<Paws::DirectConnect::Interconnect> instance

  Creates a new interconnect between a AWS Direct Connect partner's
network and a specific AWS Direct Connect location.

An interconnect is a connection which is capable of hosting other
connections. The AWS Direct Connect partner can use an interconnect to
provide sub-1Gbps AWS Direct Connect service to tier 2 customers who do
not have their own connections. Like a standard connection, an
interconnect links the AWS Direct Connect partner's network to an AWS
Direct Connect location over a standard 1 Gbps or 10 Gbps Ethernet
fiber-optic cable. One end is connected to the partner's router, the
other to an AWS Direct Connect router.

For each end customer, the AWS Direct Connect partner provisions a
connection on their interconnect by calling
AllocateConnectionOnInterconnect. The end customer can then connect to
AWS resources by creating a virtual interface on their connection,
using the VLAN assigned to them by the AWS Direct Connect partner.

This is intended for use by AWS Direct Connect partners only.


=head2 CreatePrivateVirtualInterface(ConnectionId => Str, NewPrivateVirtualInterface => L<Paws::DirectConnect::NewPrivateVirtualInterface>)

Each argument is described in detail in: L<Paws::DirectConnect::CreatePrivateVirtualInterface>

Returns: a L<Paws::DirectConnect::VirtualInterface> instance

  Creates a new private virtual interface. A virtual interface is the
VLAN that transports AWS Direct Connect traffic. A private virtual
interface supports sending traffic to a single virtual private cloud
(VPC).


=head2 CreatePublicVirtualInterface(ConnectionId => Str, NewPublicVirtualInterface => L<Paws::DirectConnect::NewPublicVirtualInterface>)

Each argument is described in detail in: L<Paws::DirectConnect::CreatePublicVirtualInterface>

Returns: a L<Paws::DirectConnect::VirtualInterface> instance

  Creates a new public virtual interface. A virtual interface is the VLAN
that transports AWS Direct Connect traffic. A public virtual interface
supports sending traffic to public services of AWS such as Amazon
Simple Storage Service (Amazon S3).

When creating an IPv6 public virtual interface (addressFamily is
'ipv6'), the customer and amazon address fields should be left blank to
use auto-assigned IPv6 space. Custom IPv6 Addresses are currently not
supported.


=head2 DeleteBGPPeer([Asn => Int, CustomerAddress => Str, VirtualInterfaceId => Str])

Each argument is described in detail in: L<Paws::DirectConnect::DeleteBGPPeer>

Returns: a L<Paws::DirectConnect::DeleteBGPPeerResponse> instance

  Deletes a BGP peer on the specified virtual interface that matches the
specified customer address and ASN. You cannot delete the last BGP peer
from a virtual interface.


=head2 DeleteConnection(ConnectionId => Str)

Each argument is described in detail in: L<Paws::DirectConnect::DeleteConnection>

Returns: a L<Paws::DirectConnect::Connection> instance

  Deletes the connection.

Deleting a connection only stops the AWS Direct Connect port hour and
data transfer charges. You need to cancel separately with the providers
any services or charges for cross-connects or network circuits that
connect you to the AWS Direct Connect location.


=head2 DeleteInterconnect(InterconnectId => Str)

Each argument is described in detail in: L<Paws::DirectConnect::DeleteInterconnect>

Returns: a L<Paws::DirectConnect::DeleteInterconnectResponse> instance

  Deletes the specified interconnect.

This is intended for use by AWS Direct Connect partners only.


=head2 DeleteVirtualInterface(VirtualInterfaceId => Str)

Each argument is described in detail in: L<Paws::DirectConnect::DeleteVirtualInterface>

Returns: a L<Paws::DirectConnect::DeleteVirtualInterfaceResponse> instance

  Deletes a virtual interface.


=head2 DescribeConnectionLoa(ConnectionId => Str, [LoaContentType => Str, ProviderName => Str])

Each argument is described in detail in: L<Paws::DirectConnect::DescribeConnectionLoa>

Returns: a L<Paws::DirectConnect::DescribeConnectionLoaResponse> instance

  Returns the LOA-CFA for a Connection.

The Letter of Authorization - Connecting Facility Assignment (LOA-CFA)
is a document that your APN partner or service provider uses when
establishing your cross connect to AWS at the colocation facility. For
more information, see Requesting Cross Connects at AWS Direct Connect
Locations in the AWS Direct Connect user guide.


=head2 DescribeConnections([ConnectionId => Str])

Each argument is described in detail in: L<Paws::DirectConnect::DescribeConnections>

Returns: a L<Paws::DirectConnect::Connections> instance

  Displays all connections in this region.

If a connection ID is provided, the call returns only that particular
connection.


=head2 DescribeConnectionsOnInterconnect(InterconnectId => Str)

Each argument is described in detail in: L<Paws::DirectConnect::DescribeConnectionsOnInterconnect>

Returns: a L<Paws::DirectConnect::Connections> instance

  Return a list of connections that have been provisioned on the given
interconnect.

This is intended for use by AWS Direct Connect partners only.


=head2 DescribeInterconnectLoa(InterconnectId => Str, [LoaContentType => Str, ProviderName => Str])

Each argument is described in detail in: L<Paws::DirectConnect::DescribeInterconnectLoa>

Returns: a L<Paws::DirectConnect::DescribeInterconnectLoaResponse> instance

  Returns the LOA-CFA for an Interconnect.

The Letter of Authorization - Connecting Facility Assignment (LOA-CFA)
is a document that is used when establishing your cross connect to AWS
at the colocation facility. For more information, see Requesting Cross
Connects at AWS Direct Connect Locations in the AWS Direct Connect user
guide.


=head2 DescribeInterconnects([InterconnectId => Str])

Each argument is described in detail in: L<Paws::DirectConnect::DescribeInterconnects>

Returns: a L<Paws::DirectConnect::Interconnects> instance

  Returns a list of interconnects owned by the AWS account.

If an interconnect ID is provided, it will only return this particular
interconnect.


=head2 DescribeLocations( => )

Each argument is described in detail in: L<Paws::DirectConnect::DescribeLocations>

Returns: a L<Paws::DirectConnect::Locations> instance

  Returns the list of AWS Direct Connect locations in the current AWS
region. These are the locations that may be selected when calling
CreateConnection or CreateInterconnect.


=head2 DescribeTags(ResourceArns => ArrayRef[Str|Undef])

Each argument is described in detail in: L<Paws::DirectConnect::DescribeTags>

Returns: a L<Paws::DirectConnect::DescribeTagsResponse> instance

  Describes the tags associated with the specified Direct Connect
resources.


=head2 DescribeVirtualGateways( => )

Each argument is described in detail in: L<Paws::DirectConnect::DescribeVirtualGateways>

Returns: a L<Paws::DirectConnect::VirtualGateways> instance

  Returns a list of virtual private gateways owned by the AWS account.

You can create one or more AWS Direct Connect private virtual
interfaces linking to a virtual private gateway. A virtual private
gateway can be managed via Amazon Virtual Private Cloud (VPC) console
or the EC2 CreateVpnGateway action.


=head2 DescribeVirtualInterfaces([ConnectionId => Str, VirtualInterfaceId => Str])

Each argument is described in detail in: L<Paws::DirectConnect::DescribeVirtualInterfaces>

Returns: a L<Paws::DirectConnect::VirtualInterfaces> instance

  Displays all virtual interfaces for an AWS account. Virtual interfaces
deleted fewer than 15 minutes before DescribeVirtualInterfaces is
called are also returned. If a connection ID is included then only
virtual interfaces associated with this connection will be returned. If
a virtual interface ID is included then only a single virtual interface
will be returned.

A virtual interface (VLAN) transmits the traffic between the AWS Direct
Connect location and the customer.

If a connection ID is provided, only virtual interfaces provisioned on
the specified connection will be returned. If a virtual interface ID is
provided, only this particular virtual interface will be returned.


=head2 TagResource(ResourceArn => Str, Tags => ArrayRef[L<Paws::DirectConnect::Tag>])

Each argument is described in detail in: L<Paws::DirectConnect::TagResource>

Returns: a L<Paws::DirectConnect::TagResourceResponse> instance

  Adds the specified tags to the specified Direct Connect resource. Each
Direct Connect resource can have a maximum of 50 tags.

Each tag consists of a key and an optional value. If a tag with the
same key is already associated with the Direct Connect resource, this
action updates its value.


=head2 UntagResource(ResourceArn => Str, TagKeys => ArrayRef[Str|Undef])

Each argument is described in detail in: L<Paws::DirectConnect::UntagResource>

Returns: a L<Paws::DirectConnect::UntagResourceResponse> instance

  Removes one or more tags from the specified Direct Connect resource.




=head1 PAGINATORS

Paginator methods are helpers that repetively call methods that return partial results




=head1 SEE ALSO

This service class forms part of L<Paws>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

