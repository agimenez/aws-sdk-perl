
package Paws::DirectConnect::DeleteVirtualInterface {
  use Moose;
  has virtualInterfaceId => (is => 'ro', isa => 'Str', required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'DeleteVirtualInterface');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::DirectConnect::DeleteVirtualInterfaceResponse');
  class_has _result_key => (isa => 'Str', is => 'ro');
}
1;