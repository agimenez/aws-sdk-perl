
package Paws::OpsWorks::UpdateStack {
  use Moose;
  has Attributes => (is => 'ro', isa => 'Paws::OpsWorks::StackAttributes');
  has ChefConfiguration => (is => 'ro', isa => 'Paws::OpsWorks::ChefConfiguration');
  has ConfigurationManager => (is => 'ro', isa => 'Paws::OpsWorks::StackConfigurationManager');
  has CustomCookbooksSource => (is => 'ro', isa => 'Paws::OpsWorks::Source');
  has CustomJson => (is => 'ro', isa => 'Str');
  has DefaultAvailabilityZone => (is => 'ro', isa => 'Str');
  has DefaultInstanceProfileArn => (is => 'ro', isa => 'Str');
  has DefaultOs => (is => 'ro', isa => 'Str');
  has DefaultRootDeviceType => (is => 'ro', isa => 'Str');
  has DefaultSshKeyName => (is => 'ro', isa => 'Str');
  has DefaultSubnetId => (is => 'ro', isa => 'Str');
  has HostnameTheme => (is => 'ro', isa => 'Str');
  has Name => (is => 'ro', isa => 'Str');
  has ServiceRoleArn => (is => 'ro', isa => 'Str');
  has StackId => (is => 'ro', isa => 'Str', required => 1);
  has UseCustomCookbooks => (is => 'ro', isa => 'Bool');
  has UseOpsworksSecurityGroups => (is => 'ro', isa => 'Bool');

  use MooseX::ClassAttribute;

  class_has _api_call => (isa => 'Str', is => 'ro', default => 'UpdateStack');
  class_has _returns => (isa => 'Str', is => 'ro');
  class_has _result_key => (isa => 'Str', is => 'ro');
}
1;