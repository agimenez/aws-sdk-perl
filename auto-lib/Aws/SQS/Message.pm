package Aws::SQS::Message {
  use Moose;
  has Attributes => (is => 'ro', isa => 'Aws::SQS::AttributeMap', traits => ['Unwrapped'], xmlname => 'Attribute');
  has Body => (is => 'ro', isa => 'Str');
  has MD5OfBody => (is => 'ro', isa => 'Str');
  has MD5OfMessageAttributes => (is => 'ro', isa => 'Str');
  has MessageAttributes => (is => 'ro', isa => 'Aws::SQS::MessageAttributeMap', traits => ['Unwrapped'], xmlname => 'MessageAttribute');
  has MessageId => (is => 'ro', isa => 'Str');
  has ReceiptHandle => (is => 'ro', isa => 'Str');
}
1