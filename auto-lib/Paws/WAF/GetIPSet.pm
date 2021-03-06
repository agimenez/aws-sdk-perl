
package Paws::WAF::GetIPSet;
  use Moose;
  has IPSetId => (is => 'ro', isa => 'Str', required => 1);

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'GetIPSet');
  class_has _returns => (isa => 'Str', is => 'ro', default => 'Paws::WAF::GetIPSetResponse');
  class_has _result_key => (isa => 'Str', is => 'ro');
1;

### main pod documentation begin ###

=head1 NAME

Paws::WAF::GetIPSet - Arguments for method GetIPSet on Paws::WAF

=head1 DESCRIPTION

This class represents the parameters used for calling the method GetIPSet on the 
AWS WAF service. Use the attributes of this class
as arguments to method GetIPSet.

You shouldn't make instances of this class. Each attribute should be used as a named argument in the call to GetIPSet.

As an example:

  $service_obj->GetIPSet(Att1 => $value1, Att2 => $value2, ...);

Values for attributes that are native types (Int, String, Float, etc) can passed as-is (scalar values). Values for complex Types (objects) can be passed as a HashRef. The keys and values of the hashref will be used to instance the underlying object.

=head1 ATTRIBUTES


=head2 B<REQUIRED> IPSetId => Str

The C<IPSetId> of the IPSet that you want to get. C<IPSetId> is
returned by CreateIPSet and by ListIPSets.




=head1 SEE ALSO

This class forms part of L<Paws>, documenting arguments for method GetIPSet in L<Paws::WAF>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

