package Paws::CloudDirectory::FacetAttributeReference;
  use Moose;
  has TargetAttributeName => (is => 'ro', isa => 'Str', required => 1);
  has TargetFacetName => (is => 'ro', isa => 'Str', required => 1);
1;

### main pod documentation begin ###

=head1 NAME

Paws::CloudDirectory::FacetAttributeReference

=head1 USAGE

This class represents one of two things:

=head3 Arguments in a call to a service

Use the attributes of this class as arguments to methods. You shouldn't make instances of this class. 
Each attribute should be used as a named argument in the calls that expect this type of object.

As an example, if Att1 is expected to be a Paws::CloudDirectory::FacetAttributeReference object:

  $service_obj->Method(Att1 => { TargetAttributeName => $value, ..., TargetFacetName => $value  });

=head3 Results returned from an API call

Use accessors for each attribute. If Att1 is expected to be an Paws::CloudDirectory::FacetAttributeReference object:

  $result = $service_obj->Method(...);
  $result->Att1->TargetAttributeName

=head1 DESCRIPTION

Facet attribute reference that specifies the attribute definition which
contains attribute facet name and attribute name.

=head1 ATTRIBUTES


=head2 B<REQUIRED> TargetAttributeName => Str

  Target attribute name associated with the facet reference. See
Attribute References for more information.


=head2 B<REQUIRED> TargetFacetName => Str

  Target facet name associated with the facet reference. See Attribute
References for more information.



=head1 SEE ALSO

This class forms part of L<Paws>, describing an object used in L<Paws::CloudDirectory>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

