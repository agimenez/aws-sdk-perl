package Paws::DynamoDB;
  use Moose;
  sub service { 'dynamodb' }
  sub version { '2012-08-10' }
  sub target_prefix { 'DynamoDB_20120810' }
  sub json_version { "1.0" }
  has max_attempts => (is => 'ro', isa => 'Int', default => 10);
  has retry => (is => 'ro', isa => 'HashRef', default => sub {
    { base => '0.05', type => 'exponential', growth_factor => 2 }
  });
  has retriables => (is => 'ro', isa => 'ArrayRef', default => sub { [
       sub { defined $_[0]->http_status and $_[0]->http_status == 400 and $_[0]->code eq 'ProvisionedThroughputExceededException' },
       sub { $_[0]->code eq 'Crc32Error' },
  ] });

  with 'Paws::API::Caller', 'Paws::API::EndpointResolver', 'Paws::Net::V4Signature', 'Paws::Net::JsonCaller', 'Paws::Net::JsonResponse';

  has '+region_rules' => (default => sub {
    my $regioninfo;
      $regioninfo = [
    {
      constraints => [
        [
          'region',
          'equals',
          'local'
        ]
      ],
      properties => {
        credentialScope => {
          region => 'us-east-1',
          service => 'dynamodb'
        }
      },
      uri => 'http://localhost:8000'
    }
  ];

    return $regioninfo;
  });

  
  sub BatchGetItem {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::BatchGetItem', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub BatchWriteItem {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::BatchWriteItem', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub CreateTable {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::CreateTable', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DeleteItem {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::DeleteItem', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DeleteTable {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::DeleteTable', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeLimits {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::DescribeLimits', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub DescribeTable {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::DescribeTable', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub GetItem {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::GetItem', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ListTables {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::ListTables', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub ListTagsOfResource {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::ListTagsOfResource', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub PutItem {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::PutItem', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub Query {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::Query', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub Scan {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::Scan', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub TagResource {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::TagResource', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub UntagResource {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::UntagResource', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub UpdateItem {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::UpdateItem', @_);
    return $self->caller->do_call($self, $call_object);
  }
  sub UpdateTable {
    my $self = shift;
    my $call_object = $self->new_with_coercions('Paws::DynamoDB::UpdateTable', @_);
    return $self->caller->do_call($self, $call_object);
  }
  
  sub ListAllTables {
    my $self = shift;

    my $callback = shift @_ if (ref($_[0]) eq 'CODE');
    my $result = $self->ListTables(@_);

    if (not defined $callback) {
      while ($result->ExclusiveStartTableName) {
        $result = $self->ListTables(@_, ExclusiveStartTableName => $result->LastEvaluatedTableName);
        push @{ $result->TableNames }, @{ $result->TableNames };
      }
      return $result;
    } else {
      while ($result->ExclusiveStartTableName) {
        $result = $self->ListTables(@_, ExclusiveStartTableName => $result->LastEvaluatedTableName);
        $callback->($_ => 'TableNames') foreach (@{ $result->TableNames });
      }
    }

    return undef
  }
  sub QueryAll {
    my $self = shift;

    my $callback = shift @_ if (ref($_[0]) eq 'CODE');
    my $result = $self->Query(@_);

    if (not defined $callback) {
      while ($result->ExclusiveStartKey) {
        $result = $self->Query(@_, ExclusiveStartKey => $result->LastEvaluatedKey);
        push @{ $result->Items }, @{ $result->Items };
        push @{ $result->Count }, @{ $result->Count };
        push @{ $result->ScannedCount }, @{ $result->ScannedCount };
      }
      return $result;
    } else {
      while ($result->ExclusiveStartKey) {
        $result = $self->Query(@_, ExclusiveStartKey => $result->LastEvaluatedKey);
        $callback->($_ => 'Items') foreach (@{ $result->Items });
        $callback->($_ => 'Count') foreach (@{ $result->Count });
        $callback->($_ => 'ScannedCount') foreach (@{ $result->ScannedCount });
      }
    }

    return undef
  }
  sub ScanAll {
    my $self = shift;

    my $callback = shift @_ if (ref($_[0]) eq 'CODE');
    my $result = $self->Scan(@_);

    if (not defined $callback) {
      while ($result->ExclusiveStartKey) {
        $result = $self->Scan(@_, ExclusiveStartKey => $result->LastEvaluatedKey);
        push @{ $result->Items }, @{ $result->Items };
        push @{ $result->Count }, @{ $result->Count };
        push @{ $result->ScannedCount }, @{ $result->ScannedCount };
      }
      return $result;
    } else {
      while ($result->ExclusiveStartKey) {
        $result = $self->Scan(@_, ExclusiveStartKey => $result->LastEvaluatedKey);
        $callback->($_ => 'Items') foreach (@{ $result->Items });
        $callback->($_ => 'Count') foreach (@{ $result->Count });
        $callback->($_ => 'ScannedCount') foreach (@{ $result->ScannedCount });
      }
    }

    return undef
  }


  sub operations { qw/BatchGetItem BatchWriteItem CreateTable DeleteItem DeleteTable DescribeLimits DescribeTable GetItem ListTables ListTagsOfResource PutItem Query Scan TagResource UntagResource UpdateItem UpdateTable / }

1;

### main pod documentation begin ###

=head1 NAME

Paws::DynamoDB - Perl Interface to AWS Amazon DynamoDB

=head1 SYNOPSIS

  use Paws;

  my $obj = Paws->service('DynamoDB');
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

Amazon DynamoDB

Amazon DynamoDB is a fully managed NoSQL database service that provides
fast and predictable performance with seamless scalability. DynamoDB
lets you offload the administrative burdens of operating and scaling a
distributed database, so that you don't have to worry about hardware
provisioning, setup and configuration, replication, software patching,
or cluster scaling.

With DynamoDB, you can create database tables that can store and
retrieve any amount of data, and serve any level of request traffic.
You can scale up or scale down your tables' throughput capacity without
downtime or performance degradation, and use the AWS Management Console
to monitor resource utilization and performance metrics.

DynamoDB automatically spreads the data and traffic for your tables
over a sufficient number of servers to handle your throughput and
storage requirements, while maintaining consistent and fast
performance. All of your data is stored on solid state disks (SSDs) and
automatically replicated across multiple Availability Zones in an AWS
region, providing built-in high availability and data durability.

=head1 METHODS

=head2 BatchGetItem(RequestItems => L<Paws::DynamoDB::BatchGetRequestMap>, [ReturnConsumedCapacity => Str])

Each argument is described in detail in: L<Paws::DynamoDB::BatchGetItem>

Returns: a L<Paws::DynamoDB::BatchGetItemOutput> instance

  The C<BatchGetItem> operation returns the attributes of one or more
items from one or more tables. You identify requested items by primary
key.

A single operation can retrieve up to 16 MB of data, which can contain
as many as 100 items. C<BatchGetItem> will return a partial result if
the response size limit is exceeded, the table's provisioned throughput
is exceeded, or an internal processing failure occurs. If a partial
result is returned, the operation returns a value for
C<UnprocessedKeys>. You can use this value to retry the operation
starting with the next item to get.

If you request more than 100 items C<BatchGetItem> will return a
C<ValidationException> with the message "Too many items requested for
the BatchGetItem call".

For example, if you ask to retrieve 100 items, but each individual item
is 300 KB in size, the system returns 52 items (so as not to exceed the
16 MB limit). It also returns an appropriate C<UnprocessedKeys> value
so you can get the next page of results. If desired, your application
can include its own logic to assemble the pages of results into one
data set.

If I<none> of the items can be processed due to insufficient
provisioned throughput on all of the tables in the request, then
C<BatchGetItem> will return a
C<ProvisionedThroughputExceededException>. If I<at least one> of the
items is successfully processed, then C<BatchGetItem> completes
successfully, while returning the keys of the unread items in
C<UnprocessedKeys>.

If DynamoDB returns any unprocessed items, you should retry the batch
operation on those items. However, I<we strongly recommend that you use
an exponential backoff algorithm>. If you retry the batch operation
immediately, the underlying read or write requests can still fail due
to throttling on the individual tables. If you delay the batch
operation using exponential backoff, the individual requests in the
batch are much more likely to succeed.

For more information, see Batch Operations and Error Handling in the
I<Amazon DynamoDB Developer Guide>.

By default, C<BatchGetItem> performs eventually consistent reads on
every table in the request. If you want strongly consistent reads
instead, you can set C<ConsistentRead> to C<true> for any or all
tables.

In order to minimize response latency, C<BatchGetItem> retrieves items
in parallel.

When designing your application, keep in mind that DynamoDB does not
return items in any particular order. To help parse the response by
item, include the primary key values for the items in your request in
the C<ProjectionExpression> parameter.

If a requested item does not exist, it is not returned in the result.
Requests for nonexistent items consume the minimum read capacity units
according to the type of read. For more information, see Capacity Units
Calculations in the I<Amazon DynamoDB Developer Guide>.


=head2 BatchWriteItem(RequestItems => L<Paws::DynamoDB::BatchWriteItemRequestMap>, [ReturnConsumedCapacity => Str, ReturnItemCollectionMetrics => Str])

Each argument is described in detail in: L<Paws::DynamoDB::BatchWriteItem>

Returns: a L<Paws::DynamoDB::BatchWriteItemOutput> instance

  The C<BatchWriteItem> operation puts or deletes multiple items in one
or more tables. A single call to C<BatchWriteItem> can write up to 16
MB of data, which can comprise as many as 25 put or delete requests.
Individual items to be written can be as large as 400 KB.

C<BatchWriteItem> cannot update items. To update items, use the
C<UpdateItem> action.

The individual C<PutItem> and C<DeleteItem> operations specified in
C<BatchWriteItem> are atomic; however C<BatchWriteItem> as a whole is
not. If any requested operations fail because the table's provisioned
throughput is exceeded or an internal processing failure occurs, the
failed operations are returned in the C<UnprocessedItems> response
parameter. You can investigate and optionally resend the requests.
Typically, you would call C<BatchWriteItem> in a loop. Each iteration
would check for unprocessed items and submit a new C<BatchWriteItem>
request with those unprocessed items until all items have been
processed.

Note that if I<none> of the items can be processed due to insufficient
provisioned throughput on all of the tables in the request, then
C<BatchWriteItem> will return a
C<ProvisionedThroughputExceededException>.

If DynamoDB returns any unprocessed items, you should retry the batch
operation on those items. However, I<we strongly recommend that you use
an exponential backoff algorithm>. If you retry the batch operation
immediately, the underlying read or write requests can still fail due
to throttling on the individual tables. If you delay the batch
operation using exponential backoff, the individual requests in the
batch are much more likely to succeed.

For more information, see Batch Operations and Error Handling in the
I<Amazon DynamoDB Developer Guide>.

With C<BatchWriteItem>, you can efficiently write or delete large
amounts of data, such as from Amazon Elastic MapReduce (EMR), or copy
data from another database into DynamoDB. In order to improve
performance with these large-scale operations, C<BatchWriteItem> does
not behave in the same way as individual C<PutItem> and C<DeleteItem>
calls would. For example, you cannot specify conditions on individual
put and delete requests, and C<BatchWriteItem> does not return deleted
items in the response.

If you use a programming language that supports concurrency, you can
use threads to write items in parallel. Your application must include
the necessary logic to manage the threads. With languages that don't
support threading, you must update or delete the specified items one at
a time. In both situations, C<BatchWriteItem> performs the specified
put and delete operations in parallel, giving you the power of the
thread pool approach without having to introduce complexity into your
application.

Parallel processing reduces latency, but each specified put and delete
request consumes the same number of write capacity units whether it is
processed in parallel or not. Delete operations on nonexistent items
consume one write capacity unit.

If one or more of the following is true, DynamoDB rejects the entire
batch write operation:

=over

=item *

One or more tables specified in the C<BatchWriteItem> request does not
exist.

=item *

Primary key attributes specified on an item in the request do not match
those in the corresponding table's primary key schema.

=item *

You try to perform multiple operations on the same item in the same
C<BatchWriteItem> request. For example, you cannot put and delete the
same item in the same C<BatchWriteItem> request.

=item *

There are more than 25 requests in the batch.

=item *

Any individual item in a batch exceeds 400 KB.

=item *

The total request size exceeds 16 MB.

=back



=head2 CreateTable(AttributeDefinitions => ArrayRef[L<Paws::DynamoDB::AttributeDefinition>], KeySchema => ArrayRef[L<Paws::DynamoDB::KeySchemaElement>], ProvisionedThroughput => L<Paws::DynamoDB::ProvisionedThroughput>, TableName => Str, [GlobalSecondaryIndexes => ArrayRef[L<Paws::DynamoDB::GlobalSecondaryIndex>], LocalSecondaryIndexes => ArrayRef[L<Paws::DynamoDB::LocalSecondaryIndex>], StreamSpecification => L<Paws::DynamoDB::StreamSpecification>])

Each argument is described in detail in: L<Paws::DynamoDB::CreateTable>

Returns: a L<Paws::DynamoDB::CreateTableOutput> instance

  The C<CreateTable> operation adds a new table to your account. In an
AWS account, table names must be unique within each region. That is,
you can have two tables with same name if you create the tables in
different regions.

C<CreateTable> is an asynchronous operation. Upon receiving a
C<CreateTable> request, DynamoDB immediately returns a response with a
C<TableStatus> of C<CREATING>. After the table is created, DynamoDB
sets the C<TableStatus> to C<ACTIVE>. You can perform read and write
operations only on an C<ACTIVE> table.

You can optionally define secondary indexes on the new table, as part
of the C<CreateTable> operation. If you want to create multiple tables
with secondary indexes on them, you must create the tables
sequentially. Only one table with secondary indexes can be in the
C<CREATING> state at any given time.

You can use the C<DescribeTable> action to check the table status.


=head2 DeleteItem(Key => L<Paws::DynamoDB::Key>, TableName => Str, [ConditionalOperator => Str, ConditionExpression => Str, Expected => L<Paws::DynamoDB::ExpectedAttributeMap>, ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>, ExpressionAttributeValues => L<Paws::DynamoDB::ExpressionAttributeValueMap>, ReturnConsumedCapacity => Str, ReturnItemCollectionMetrics => Str, ReturnValues => Str])

Each argument is described in detail in: L<Paws::DynamoDB::DeleteItem>

Returns: a L<Paws::DynamoDB::DeleteItemOutput> instance

  Deletes a single item in a table by primary key. You can perform a
conditional delete operation that deletes the item if it exists, or if
it has an expected attribute value.

In addition to deleting an item, you can also return the item's
attribute values in the same operation, using the C<ReturnValues>
parameter.

Unless you specify conditions, the C<DeleteItem> is an idempotent
operation; running it multiple times on the same item or attribute does
I<not> result in an error response.

Conditional deletes are useful for deleting items only if specific
conditions are met. If those conditions are met, DynamoDB performs the
delete. Otherwise, the item is not deleted.


=head2 DeleteTable(TableName => Str)

Each argument is described in detail in: L<Paws::DynamoDB::DeleteTable>

Returns: a L<Paws::DynamoDB::DeleteTableOutput> instance

  The C<DeleteTable> operation deletes a table and all of its items.
After a C<DeleteTable> request, the specified table is in the
C<DELETING> state until DynamoDB completes the deletion. If the table
is in the C<ACTIVE> state, you can delete it. If a table is in
C<CREATING> or C<UPDATING> states, then DynamoDB returns a
C<ResourceInUseException>. If the specified table does not exist,
DynamoDB returns a C<ResourceNotFoundException>. If table is already in
the C<DELETING> state, no error is returned.

DynamoDB might continue to accept data read and write operations, such
as C<GetItem> and C<PutItem>, on a table in the C<DELETING> state until
the table deletion is complete.

When you delete a table, any indexes on that table are also deleted.

If you have DynamoDB Streams enabled on the table, then the
corresponding stream on that table goes into the C<DISABLED> state, and
the stream is automatically deleted after 24 hours.

Use the C<DescribeTable> action to check the status of the table.


=head2 DescribeLimits()

Each argument is described in detail in: L<Paws::DynamoDB::DescribeLimits>

Returns: a L<Paws::DynamoDB::DescribeLimitsOutput> instance

  Returns the current provisioned-capacity limits for your AWS account in
a region, both for the region as a whole and for any one DynamoDB table
that you create there.

When you establish an AWS account, the account has initial limits on
the maximum read capacity units and write capacity units that you can
provision across all of your DynamoDB tables in a given region. Also,
there are per-table limits that apply when you create a table there.
For more information, see Limits page in the I<Amazon DynamoDB
Developer Guide>.

Although you can increase these limits by filing a case at AWS Support
Center, obtaining the increase is not instantaneous. The
C<DescribeLimits> action lets you write code to compare the capacity
you are currently using to those limits imposed by your account so that
you have enough time to apply for an increase before you hit a limit.

For example, you could use one of the AWS SDKs to do the following:

=over

=item 1.

Call C<DescribeLimits> for a particular region to obtain your current
account limits on provisioned capacity there.

=item 2.

Create a variable to hold the aggregate read capacity units provisioned
for all your tables in that region, and one to hold the aggregate write
capacity units. Zero them both.

=item 3.

Call C<ListTables> to obtain a list of all your DynamoDB tables.

=item 4.

For each table name listed by C<ListTables>, do the following:

=over

=item *

Call C<DescribeTable> with the table name.

=item *

Use the data returned by C<DescribeTable> to add the read capacity
units and write capacity units provisioned for the table itself to your
variables.

=item *

If the table has one or more global secondary indexes (GSIs), loop over
these GSIs and add their provisioned capacity values to your variables
as well.

=back

=item 5.

Report the account limits for that region returned by
C<DescribeLimits>, along with the total current provisioned capacity
levels you have calculated.

=back

This will let you see whether you are getting close to your
account-level limits.

The per-table limits apply only when you are creating a new table. They
restrict the sum of the provisioned capacity of the new table itself
and all its global secondary indexes.

For existing tables and their GSIs, DynamoDB will not let you increase
provisioned capacity extremely rapidly, but the only upper limit that
applies is that the aggregate provisioned capacity over all your tables
and GSIs cannot exceed either of the per-account limits.

C<DescribeLimits> should only be called periodically. You can expect
throttling errors if you call it more than once in a minute.

The C<DescribeLimits> Request element has no content.


=head2 DescribeTable(TableName => Str)

Each argument is described in detail in: L<Paws::DynamoDB::DescribeTable>

Returns: a L<Paws::DynamoDB::DescribeTableOutput> instance

  Returns information about the table, including the current status of
the table, when it was created, the primary key schema, and any indexes
on the table.

If you issue a C<DescribeTable> request immediately after a
C<CreateTable> request, DynamoDB might return a
C<ResourceNotFoundException>. This is because C<DescribeTable> uses an
eventually consistent query, and the metadata for your table might not
be available at that moment. Wait for a few seconds, and then try the
C<DescribeTable> request again.


=head2 GetItem(Key => L<Paws::DynamoDB::Key>, TableName => Str, [AttributesToGet => ArrayRef[Str|Undef], ConsistentRead => Bool, ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>, ProjectionExpression => Str, ReturnConsumedCapacity => Str])

Each argument is described in detail in: L<Paws::DynamoDB::GetItem>

Returns: a L<Paws::DynamoDB::GetItemOutput> instance

  The C<GetItem> operation returns a set of attributes for the item with
the given primary key. If there is no matching item, C<GetItem> does
not return any data and there will be no C<Item> element in the
response.

C<GetItem> provides an eventually consistent read by default. If your
application requires a strongly consistent read, set C<ConsistentRead>
to C<true>. Although a strongly consistent read might take more time
than an eventually consistent read, it always returns the last updated
value.


=head2 ListTables([ExclusiveStartTableName => Str, Limit => Int])

Each argument is described in detail in: L<Paws::DynamoDB::ListTables>

Returns: a L<Paws::DynamoDB::ListTablesOutput> instance

  Returns an array of table names associated with the current account and
endpoint. The output from C<ListTables> is paginated, with each page
returning a maximum of 100 table names.


=head2 ListTagsOfResource(ResourceArn => Str, [NextToken => Str])

Each argument is described in detail in: L<Paws::DynamoDB::ListTagsOfResource>

Returns: a L<Paws::DynamoDB::ListTagsOfResourceOutput> instance

  List all tags on an Amazon DynamoDB resource. You can call
ListTagsOfResource up to 10 times per second, per account.

For an overview on tagging DynamoDB resources, see Tagging for DynamoDB
in the I<Amazon DynamoDB Developer Guide>.


=head2 PutItem(Item => L<Paws::DynamoDB::PutItemInputAttributeMap>, TableName => Str, [ConditionalOperator => Str, ConditionExpression => Str, Expected => L<Paws::DynamoDB::ExpectedAttributeMap>, ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>, ExpressionAttributeValues => L<Paws::DynamoDB::ExpressionAttributeValueMap>, ReturnConsumedCapacity => Str, ReturnItemCollectionMetrics => Str, ReturnValues => Str])

Each argument is described in detail in: L<Paws::DynamoDB::PutItem>

Returns: a L<Paws::DynamoDB::PutItemOutput> instance

  Creates a new item, or replaces an old item with a new item. If an item
that has the same primary key as the new item already exists in the
specified table, the new item completely replaces the existing item.
You can perform a conditional put operation (add a new item if one with
the specified primary key doesn't exist), or replace an existing item
if it has certain attribute values.

In addition to putting an item, you can also return the item's
attribute values in the same operation, using the C<ReturnValues>
parameter.

When you add an item, the primary key attribute(s) are the only
required attributes. Attribute values cannot be null. String and Binary
type attributes must have lengths greater than zero. Set type
attributes cannot be empty. Requests with empty values will be rejected
with a C<ValidationException> exception.

To prevent a new item from replacing an existing item, use a
conditional expression that contains the C<attribute_not_exists>
function with the name of the attribute being used as the partition key
for the table. Since every record must contain that attribute, the
C<attribute_not_exists> function will only succeed if no matching item
exists.

For more information about C<PutItem>, see Working with Items in the
I<Amazon DynamoDB Developer Guide>.


=head2 Query(TableName => Str, [AttributesToGet => ArrayRef[Str|Undef], ConditionalOperator => Str, ConsistentRead => Bool, ExclusiveStartKey => L<Paws::DynamoDB::Key>, ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>, ExpressionAttributeValues => L<Paws::DynamoDB::ExpressionAttributeValueMap>, FilterExpression => Str, IndexName => Str, KeyConditionExpression => Str, KeyConditions => L<Paws::DynamoDB::KeyConditions>, Limit => Int, ProjectionExpression => Str, QueryFilter => L<Paws::DynamoDB::FilterConditionMap>, ReturnConsumedCapacity => Str, ScanIndexForward => Bool, Select => Str])

Each argument is described in detail in: L<Paws::DynamoDB::Query>

Returns: a L<Paws::DynamoDB::QueryOutput> instance

  A C<Query> operation uses the primary key of a table or a secondary
index to directly access items from that table or index.

Use the C<KeyConditionExpression> parameter to provide a specific value
for the partition key. The C<Query> operation will return all of the
items from the table or index with that partition key value. You can
optionally narrow the scope of the C<Query> operation by specifying a
sort key value and a comparison operator in C<KeyConditionExpression>.
You can use the C<ScanIndexForward> parameter to get results in forward
or reverse order, by sort key.

Queries that do not return results consume the minimum number of read
capacity units for that type of read operation.

If the total number of items meeting the query criteria exceeds the
result set size limit of 1 MB, the query stops and results are returned
to the user with the C<LastEvaluatedKey> element to continue the query
in a subsequent operation. Unlike a C<Scan> operation, a C<Query>
operation never returns both an empty result set and a
C<LastEvaluatedKey> value. C<LastEvaluatedKey> is only provided if you
have used the C<Limit> parameter, or if the result set exceeds 1 MB
(prior to applying a filter).

You can query a table, a local secondary index, or a global secondary
index. For a query on a table or on a local secondary index, you can
set the C<ConsistentRead> parameter to C<true> and obtain a strongly
consistent result. Global secondary indexes support eventually
consistent reads only, so do not specify C<ConsistentRead> when
querying a global secondary index.


=head2 Scan(TableName => Str, [AttributesToGet => ArrayRef[Str|Undef], ConditionalOperator => Str, ConsistentRead => Bool, ExclusiveStartKey => L<Paws::DynamoDB::Key>, ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>, ExpressionAttributeValues => L<Paws::DynamoDB::ExpressionAttributeValueMap>, FilterExpression => Str, IndexName => Str, Limit => Int, ProjectionExpression => Str, ReturnConsumedCapacity => Str, ScanFilter => L<Paws::DynamoDB::FilterConditionMap>, Segment => Int, Select => Str, TotalSegments => Int])

Each argument is described in detail in: L<Paws::DynamoDB::Scan>

Returns: a L<Paws::DynamoDB::ScanOutput> instance

  The C<Scan> operation returns one or more items and item attributes by
accessing every item in a table or a secondary index. To have DynamoDB
return fewer items, you can provide a C<FilterExpression> operation.

If the total number of scanned items exceeds the maximum data set size
limit of 1 MB, the scan stops and results are returned to the user as a
C<LastEvaluatedKey> value to continue the scan in a subsequent
operation. The results also include the number of items exceeding the
limit. A scan can result in no table data meeting the filter criteria.

By default, C<Scan> operations proceed sequentially; however, for
faster performance on a large table or secondary index, applications
can request a parallel C<Scan> operation by providing the C<Segment>
and C<TotalSegments> parameters. For more information, see Parallel
Scan in the I<Amazon DynamoDB Developer Guide>.

By default, C<Scan> uses eventually consistent reads when accessing the
data in a table; therefore, the result set might not include the
changes to data in the table immediately before the operation began. If
you need a consistent copy of the data, as of the time that the Scan
begins, you can set the C<ConsistentRead> parameter to C<true>.


=head2 TagResource(ResourceArn => Str, Tags => ArrayRef[L<Paws::DynamoDB::Tag>])

Each argument is described in detail in: L<Paws::DynamoDB::TagResource>

Returns: nothing

  Associate a set of tags with an Amazon DynamoDB resource. You can then
activate these user-defined tags so that they appear on the Billing and
Cost Management console for cost allocation tracking. You can call
TagResource up to 5 times per second, per account.

For an overview on tagging DynamoDB resources, see Tagging for DynamoDB
in the I<Amazon DynamoDB Developer Guide>.


=head2 UntagResource(ResourceArn => Str, TagKeys => ArrayRef[Str|Undef])

Each argument is described in detail in: L<Paws::DynamoDB::UntagResource>

Returns: nothing

  Removes the association of tags from an Amazon DynamoDB resource. You
can call UntagResource up to 5 times per second, per account.

For an overview on tagging DynamoDB resources, see Tagging for DynamoDB
in the I<Amazon DynamoDB Developer Guide>.


=head2 UpdateItem(Key => L<Paws::DynamoDB::Key>, TableName => Str, [AttributeUpdates => L<Paws::DynamoDB::AttributeUpdates>, ConditionalOperator => Str, ConditionExpression => Str, Expected => L<Paws::DynamoDB::ExpectedAttributeMap>, ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>, ExpressionAttributeValues => L<Paws::DynamoDB::ExpressionAttributeValueMap>, ReturnConsumedCapacity => Str, ReturnItemCollectionMetrics => Str, ReturnValues => Str, UpdateExpression => Str])

Each argument is described in detail in: L<Paws::DynamoDB::UpdateItem>

Returns: a L<Paws::DynamoDB::UpdateItemOutput> instance

  Edits an existing item's attributes, or adds a new item to the table if
it does not already exist. You can put, delete, or add attribute
values. You can also perform a conditional update on an existing item
(insert a new attribute name-value pair if it doesn't exist, or replace
an existing name-value pair if it has certain expected attribute
values).

You can also return the item's attribute values in the same
C<UpdateItem> operation using the C<ReturnValues> parameter.


=head2 UpdateTable(TableName => Str, [AttributeDefinitions => ArrayRef[L<Paws::DynamoDB::AttributeDefinition>], GlobalSecondaryIndexUpdates => ArrayRef[L<Paws::DynamoDB::GlobalSecondaryIndexUpdate>], ProvisionedThroughput => L<Paws::DynamoDB::ProvisionedThroughput>, StreamSpecification => L<Paws::DynamoDB::StreamSpecification>])

Each argument is described in detail in: L<Paws::DynamoDB::UpdateTable>

Returns: a L<Paws::DynamoDB::UpdateTableOutput> instance

  Modifies the provisioned throughput settings, global secondary indexes,
or DynamoDB Streams settings for a given table.

You can only perform one of the following operations at once:

=over

=item *

Modify the provisioned throughput settings of the table.

=item *

Enable or disable Streams on the table.

=item *

Remove a global secondary index from the table.

=item *

Create a new global secondary index on the table. Once the index begins
backfilling, you can use C<UpdateTable> to perform other operations.

=back

C<UpdateTable> is an asynchronous operation; while it is executing, the
table status changes from C<ACTIVE> to C<UPDATING>. While it is
C<UPDATING>, you cannot issue another C<UpdateTable> request. When the
table returns to the C<ACTIVE> state, the C<UpdateTable> operation is
complete.




=head1 PAGINATORS

Paginator methods are helpers that repetively call methods that return partial results

=head2 ListAllTables(sub { },[ExclusiveStartTableName => Str, Limit => Int])

=head2 ListAllTables([ExclusiveStartTableName => Str, Limit => Int])


If passed a sub as first parameter, it will call the sub for each element found in :

 - TableNames, passing the object as the first parameter, and the string 'TableNames' as the second parameter 

If not, it will return a a L<Paws::DynamoDB::ListTablesOutput> instance with all the C<param>s;  from all the responses. Please take into account that this mode can potentially consume vasts ammounts of memory.


=head2 QueryAll(sub { },TableName => Str, [AttributesToGet => ArrayRef[Str|Undef], ConditionalOperator => Str, ConsistentRead => Bool, ExclusiveStartKey => L<Paws::DynamoDB::Key>, ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>, ExpressionAttributeValues => L<Paws::DynamoDB::ExpressionAttributeValueMap>, FilterExpression => Str, IndexName => Str, KeyConditionExpression => Str, KeyConditions => L<Paws::DynamoDB::KeyConditions>, Limit => Int, ProjectionExpression => Str, QueryFilter => L<Paws::DynamoDB::FilterConditionMap>, ReturnConsumedCapacity => Str, ScanIndexForward => Bool, Select => Str])

=head2 QueryAll(TableName => Str, [AttributesToGet => ArrayRef[Str|Undef], ConditionalOperator => Str, ConsistentRead => Bool, ExclusiveStartKey => L<Paws::DynamoDB::Key>, ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>, ExpressionAttributeValues => L<Paws::DynamoDB::ExpressionAttributeValueMap>, FilterExpression => Str, IndexName => Str, KeyConditionExpression => Str, KeyConditions => L<Paws::DynamoDB::KeyConditions>, Limit => Int, ProjectionExpression => Str, QueryFilter => L<Paws::DynamoDB::FilterConditionMap>, ReturnConsumedCapacity => Str, ScanIndexForward => Bool, Select => Str])


If passed a sub as first parameter, it will call the sub for each element found in :

 - Items, passing the object as the first parameter, and the string 'Items' as the second parameter 

 - Count, passing the object as the first parameter, and the string 'Count' as the second parameter 

 - ScannedCount, passing the object as the first parameter, and the string 'ScannedCount' as the second parameter 

If not, it will return a a L<Paws::DynamoDB::QueryOutput> instance with all the C<param>s; andC<param>s; andC<param>s;  from all the responses. Please take into account that this mode can potentially consume vasts ammounts of memory.


=head2 ScanAll(sub { },TableName => Str, [AttributesToGet => ArrayRef[Str|Undef], ConditionalOperator => Str, ConsistentRead => Bool, ExclusiveStartKey => L<Paws::DynamoDB::Key>, ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>, ExpressionAttributeValues => L<Paws::DynamoDB::ExpressionAttributeValueMap>, FilterExpression => Str, IndexName => Str, Limit => Int, ProjectionExpression => Str, ReturnConsumedCapacity => Str, ScanFilter => L<Paws::DynamoDB::FilterConditionMap>, Segment => Int, Select => Str, TotalSegments => Int])

=head2 ScanAll(TableName => Str, [AttributesToGet => ArrayRef[Str|Undef], ConditionalOperator => Str, ConsistentRead => Bool, ExclusiveStartKey => L<Paws::DynamoDB::Key>, ExpressionAttributeNames => L<Paws::DynamoDB::ExpressionAttributeNameMap>, ExpressionAttributeValues => L<Paws::DynamoDB::ExpressionAttributeValueMap>, FilterExpression => Str, IndexName => Str, Limit => Int, ProjectionExpression => Str, ReturnConsumedCapacity => Str, ScanFilter => L<Paws::DynamoDB::FilterConditionMap>, Segment => Int, Select => Str, TotalSegments => Int])


If passed a sub as first parameter, it will call the sub for each element found in :

 - Items, passing the object as the first parameter, and the string 'Items' as the second parameter 

 - Count, passing the object as the first parameter, and the string 'Count' as the second parameter 

 - ScannedCount, passing the object as the first parameter, and the string 'ScannedCount' as the second parameter 

If not, it will return a a L<Paws::DynamoDB::ScanOutput> instance with all the C<param>s; andC<param>s; andC<param>s;  from all the responses. Please take into account that this mode can potentially consume vasts ammounts of memory.





=head1 SEE ALSO

This service class forms part of L<Paws>

=head1 BUGS and CONTRIBUTIONS

The source code is located here: https://github.com/pplu/aws-sdk-perl

Please report bugs to: https://github.com/pplu/aws-sdk-perl/issues

=cut

