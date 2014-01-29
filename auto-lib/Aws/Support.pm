
use MooseX::Declare;
use AWS::API;


class Aws::Support::CaseDetails with (AWS::API::ResultParser, AWS::API::ToParams) {
  has caseId => (is => 'ro', isa => 'Str');
  has categoryCode => (is => 'ro', isa => 'Str');
  has ccEmailAddresses => (is => 'ro', isa => 'ArrayRef[Str]');
  has displayId => (is => 'ro', isa => 'Str');
  has language => (is => 'ro', isa => 'Str');
  has recentCommunications => (is => 'ro', isa => 'Aws::Support::RecentCaseCommunications');
  has serviceCode => (is => 'ro', isa => 'Str');
  has severityCode => (is => 'ro', isa => 'Str');
  has status => (is => 'ro', isa => 'Str');
  has subject => (is => 'ro', isa => 'Str');
  has submittedBy => (is => 'ro', isa => 'Str');
  has timeCreated => (is => 'ro', isa => 'Str');
}

class Aws::Support::Category with (AWS::API::ResultParser, AWS::API::ToParams) {
  has code => (is => 'ro', isa => 'Str');
  has name => (is => 'ro', isa => 'Str');
}

class Aws::Support::Communication with (AWS::API::ResultParser, AWS::API::ToParams) {
  has body => (is => 'ro', isa => 'Str');
  has caseId => (is => 'ro', isa => 'Str');
  has submittedBy => (is => 'ro', isa => 'Str');
  has timeCreated => (is => 'ro', isa => 'Str');
}

class Aws::Support::RecentCaseCommunications with (AWS::API::ResultParser, AWS::API::ToParams) {
  has communications => (is => 'ro', isa => 'ArrayRef[Aws::Support::Communication]');
  has nextToken => (is => 'ro', isa => 'Str');
}

class Aws::Support::Service with (AWS::API::ResultParser, AWS::API::ToParams) {
  has categories => (is => 'ro', isa => 'ArrayRef[Aws::Support::Category]');
  has code => (is => 'ro', isa => 'Str');
  has name => (is => 'ro', isa => 'Str');
}

class Aws::Support::SeverityLevel with (AWS::API::ResultParser, AWS::API::ToParams) {
  has code => (is => 'ro', isa => 'Str');
  has name => (is => 'ro', isa => 'Str');
}

class Aws::Support::TrustedAdvisorCategorySpecificSummary with (AWS::API::ResultParser, AWS::API::ToParams) {
  has costOptimizing => (is => 'ro', isa => 'Aws::Support::TrustedAdvisorCostOptimizingSummary');
}

class Aws::Support::TrustedAdvisorCheckDescription with (AWS::API::ResultParser, AWS::API::ToParams) {
  has category => (is => 'ro', isa => 'Str', required => 1);
  has description => (is => 'ro', isa => 'Str', required => 1);
  has id => (is => 'ro', isa => 'Str', required => 1);
  has metadata => (is => 'ro', isa => 'ArrayRef[Str]', required => 1);
  has name => (is => 'ro', isa => 'Str', required => 1);
}

class Aws::Support::TrustedAdvisorCheckRefreshStatus with (AWS::API::ResultParser, AWS::API::ToParams) {
  has checkId => (is => 'ro', isa => 'Str', required => 1);
  has millisUntilNextRefreshable => (is => 'ro', isa => 'Num', required => 1);
  has status => (is => 'ro', isa => 'Str', required => 1);
}

class Aws::Support::TrustedAdvisorCheckResult with (AWS::API::ResultParser, AWS::API::ToParams) {
  has categorySpecificSummary => (is => 'ro', isa => 'Aws::Support::TrustedAdvisorCategorySpecificSummary', required => 1);
  has checkId => (is => 'ro', isa => 'Str', required => 1);
  has flaggedResources => (is => 'ro', isa => 'ArrayRef[Aws::Support::TrustedAdvisorResourceDetail]', required => 1);
  has resourcesSummary => (is => 'ro', isa => 'Aws::Support::TrustedAdvisorResourcesSummary', required => 1);
  has status => (is => 'ro', isa => 'Str', required => 1);
  has timestamp => (is => 'ro', isa => 'Str', required => 1);
}

class Aws::Support::TrustedAdvisorCheckSummary with (AWS::API::ResultParser, AWS::API::ToParams) {
  has categorySpecificSummary => (is => 'ro', isa => 'Aws::Support::TrustedAdvisorCategorySpecificSummary', required => 1);
  has checkId => (is => 'ro', isa => 'Str', required => 1);
  has hasFlaggedResources => (is => 'ro', isa => 'Str');
  has resourcesSummary => (is => 'ro', isa => 'Aws::Support::TrustedAdvisorResourcesSummary', required => 1);
  has status => (is => 'ro', isa => 'Str', required => 1);
  has timestamp => (is => 'ro', isa => 'Str', required => 1);
}

class Aws::Support::TrustedAdvisorResourceDetail with (AWS::API::ResultParser, AWS::API::ToParams) {
  has isSuppressed => (is => 'ro', isa => 'Str');
  has metadata => (is => 'ro', isa => 'ArrayRef[Str]', required => 1);
  has region => (is => 'ro', isa => 'Str', required => 1);
  has resourceId => (is => 'ro', isa => 'Str', required => 1);
  has status => (is => 'ro', isa => 'Str', required => 1);
}

class Aws::Support::TrustedAdvisorResourcesSummary with (AWS::API::ResultParser, AWS::API::ToParams) {
  has resourcesFlagged => (is => 'ro', isa => 'Num', required => 1);
  has resourcesIgnored => (is => 'ro', isa => 'Num', required => 1);
  has resourcesProcessed => (is => 'ro', isa => 'Num', required => 1);
  has resourcesSuppressed => (is => 'ro', isa => 'Num', required => 1);
}



class Aws::Support::AddCommunicationToCase {
  has caseId => (is => 'ro', isa => 'Str');
  has ccEmailAddresses => (is => 'ro', isa => 'ArrayRef[Str]');
  has communicationBody => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'AddCommunicationToCase');
  has _returns => (isa => 'Aws::Support::AddCommunicationToCaseResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'AddCommunicationToCaseResult');  
}
class Aws::Support::CreateCase {
  has categoryCode => (is => 'ro', isa => 'Str');
  has ccEmailAddresses => (is => 'ro', isa => 'ArrayRef[Str]');
  has communicationBody => (is => 'ro', isa => 'Str', required => 1);
  has issueType => (is => 'ro', isa => 'Str');
  has language => (is => 'ro', isa => 'Str');
  has serviceCode => (is => 'ro', isa => 'Str');
  has severityCode => (is => 'ro', isa => 'Str');
  has subject => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'CreateCase');
  has _returns => (isa => 'Aws::Support::CreateCaseResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'CreateCaseResult');  
}
class Aws::Support::DescribeCases {
  has afterTime => (is => 'ro', isa => 'Str');
  has beforeTime => (is => 'ro', isa => 'Str');
  has caseIdList => (is => 'ro', isa => 'ArrayRef[Str]');
  has displayId => (is => 'ro', isa => 'Str');
  has includeResolvedCases => (is => 'ro', isa => 'Str');
  has language => (is => 'ro', isa => 'Str');
  has maxResults => (is => 'ro', isa => 'Int');
  has nextToken => (is => 'ro', isa => 'Str');

  has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeCases');
  has _returns => (isa => 'Aws::Support::DescribeCasesResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'DescribeCasesResult');  
}
class Aws::Support::DescribeCommunications {
  has afterTime => (is => 'ro', isa => 'Str');
  has beforeTime => (is => 'ro', isa => 'Str');
  has caseId => (is => 'ro', isa => 'Str', required => 1);
  has maxResults => (is => 'ro', isa => 'Int');
  has nextToken => (is => 'ro', isa => 'Str');

  has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeCommunications');
  has _returns => (isa => 'Aws::Support::DescribeCommunicationsResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'DescribeCommunicationsResult');  
}
class Aws::Support::DescribeServices {
  has language => (is => 'ro', isa => 'Str');
  has serviceCodeList => (is => 'ro', isa => 'ArrayRef[Str]');

  has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeServices');
  has _returns => (isa => 'Aws::Support::DescribeServicesResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'DescribeServicesResult');  
}
class Aws::Support::DescribeSeverityLevels {
  has language => (is => 'ro', isa => 'Str');

  has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeSeverityLevels');
  has _returns => (isa => 'Aws::Support::DescribeSeverityLevelsResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'DescribeSeverityLevelsResult');  
}
class Aws::Support::DescribeTrustedAdvisorCheckRefreshStatuses {
  has checkIds => (is => 'ro', isa => 'ArrayRef[Str]', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeTrustedAdvisorCheckRefreshStatuses');
  has _returns => (isa => 'Aws::Support::DescribeTrustedAdvisorCheckRefreshStatusesResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'DescribeTrustedAdvisorCheckRefreshStatusesResult');  
}
class Aws::Support::DescribeTrustedAdvisorCheckResult {
  has checkId => (is => 'ro', isa => 'Str', required => 1);
  has language => (is => 'ro', isa => 'Str');

  has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeTrustedAdvisorCheckResult');
  has _returns => (isa => 'Aws::Support::DescribeTrustedAdvisorCheckResultResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'DescribeTrustedAdvisorCheckResultResult');  
}
class Aws::Support::DescribeTrustedAdvisorCheckSummaries {
  has checkIds => (is => 'ro', isa => 'ArrayRef[Str]', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeTrustedAdvisorCheckSummaries');
  has _returns => (isa => 'Aws::Support::DescribeTrustedAdvisorCheckSummariesResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'DescribeTrustedAdvisorCheckSummariesResult');  
}
class Aws::Support::DescribeTrustedAdvisorChecks {
  has language => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'DescribeTrustedAdvisorChecks');
  has _returns => (isa => 'Aws::Support::DescribeTrustedAdvisorChecksResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'DescribeTrustedAdvisorChecksResult');  
}
class Aws::Support::RefreshTrustedAdvisorCheck {
  has checkId => (is => 'ro', isa => 'Str', required => 1);

  has _api_call => (isa => 'Str', is => 'ro', default => 'RefreshTrustedAdvisorCheck');
  has _returns => (isa => 'Aws::Support::RefreshTrustedAdvisorCheckResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'RefreshTrustedAdvisorCheckResult');  
}
class Aws::Support::ResolveCase {
  has caseId => (is => 'ro', isa => 'Str');

  has _api_call => (isa => 'Str', is => 'ro', default => 'ResolveCase');
  has _returns => (isa => 'Aws::Support::ResolveCaseResult', is => 'ro');
  has _result_key => (isa => 'Str', is => 'ro', default => 'ResolveCaseResult');  
}

class Aws::Support::AddCommunicationToCaseResult with AWS::API::ResultParser {
  has result => (is => 'ro', isa => 'Str');

}
class Aws::Support::CreateCaseResult with AWS::API::ResultParser {
  has caseId => (is => 'ro', isa => 'Str');

}
class Aws::Support::DescribeCasesResult with AWS::API::ResultParser {
  has cases => (is => 'ro', isa => 'ArrayRef[Aws::Support::CaseDetails]');
  has nextToken => (is => 'ro', isa => 'Str');

}
class Aws::Support::DescribeCommunicationsResult with AWS::API::ResultParser {
  has communications => (is => 'ro', isa => 'ArrayRef[Aws::Support::Communication]');
  has nextToken => (is => 'ro', isa => 'Str');

}
class Aws::Support::DescribeServicesResult with AWS::API::ResultParser {
  has services => (is => 'ro', isa => 'ArrayRef[Aws::Support::Service]');

}
class Aws::Support::DescribeSeverityLevelsResult with AWS::API::ResultParser {
  has severityLevels => (is => 'ro', isa => 'ArrayRef[Aws::Support::SeverityLevel]');

}
class Aws::Support::DescribeTrustedAdvisorCheckRefreshStatusesResult with AWS::API::ResultParser {
  has statuses => (is => 'ro', isa => 'ArrayRef[Aws::Support::TrustedAdvisorCheckRefreshStatus]', required => 1);

}
class Aws::Support::DescribeTrustedAdvisorCheckResultResult with AWS::API::ResultParser {
  has result => (is => 'ro', isa => 'Aws::Support::TrustedAdvisorCheckResult');

}
class Aws::Support::DescribeTrustedAdvisorCheckSummariesResult with AWS::API::ResultParser {
  has summaries => (is => 'ro', isa => 'ArrayRef[Aws::Support::TrustedAdvisorCheckSummary]', required => 1);

}
class Aws::Support::DescribeTrustedAdvisorChecksResult with AWS::API::ResultParser {
  has checks => (is => 'ro', isa => 'ArrayRef[Aws::Support::TrustedAdvisorCheckDescription]', required => 1);

}
class Aws::Support::RefreshTrustedAdvisorCheckResult with AWS::API::ResultParser {
  has status => (is => 'ro', isa => 'Aws::Support::TrustedAdvisorCheckRefreshStatus', required => 1);

}
class Aws::Support::ResolveCaseResult with AWS::API::ResultParser {
  has finalCaseStatus => (is => 'ro', isa => 'Str');
  has initialCaseStatus => (is => 'ro', isa => 'Str');

}

class Aws::Support with (Net::AWS::Caller, AWS::API::SingleEndpointCaller, Net::AWS::V4Signature, Net::AWS::JsonCaller, Net::AWS::JsonResponse) {
  has service => (is => 'ro', isa => 'Str', default => 'support');
  has version => (is => 'ro', isa => 'Str', default => '2013-04-15');
  has target_prefix => (is => 'ro', isa => 'Str', default => 'AWSSupport_20130415');

  
  method AddCommunicationToCase (%args) {
    my $call = Aws::Support::AddCommunicationToCase->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::AddCommunicationToCaseResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method CreateCase (%args) {
    my $call = Aws::Support::CreateCase->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::CreateCaseResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method DescribeCases (%args) {
    my $call = Aws::Support::DescribeCases->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::DescribeCasesResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method DescribeCommunications (%args) {
    my $call = Aws::Support::DescribeCommunications->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::DescribeCommunicationsResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method DescribeServices (%args) {
    my $call = Aws::Support::DescribeServices->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::DescribeServicesResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method DescribeSeverityLevels (%args) {
    my $call = Aws::Support::DescribeSeverityLevels->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::DescribeSeverityLevelsResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method DescribeTrustedAdvisorCheckRefreshStatuses (%args) {
    my $call = Aws::Support::DescribeTrustedAdvisorCheckRefreshStatuses->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::DescribeTrustedAdvisorCheckRefreshStatusesResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method DescribeTrustedAdvisorCheckResult (%args) {
    my $call = Aws::Support::DescribeTrustedAdvisorCheckResult->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::DescribeTrustedAdvisorCheckResultResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method DescribeTrustedAdvisorChecks (%args) {
    my $call = Aws::Support::DescribeTrustedAdvisorChecks->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::DescribeTrustedAdvisorChecksResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method DescribeTrustedAdvisorCheckSummaries (%args) {
    my $call = Aws::Support::DescribeTrustedAdvisorCheckSummaries->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::DescribeTrustedAdvisorCheckSummariesResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method RefreshTrustedAdvisorCheck (%args) {
    my $call = Aws::Support::RefreshTrustedAdvisorCheck->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::RefreshTrustedAdvisorCheckResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
  method ResolveCase (%args) {
    my $call = Aws::Support::ResolveCase->new(%args);
    my $result = $self->_api_caller($call->_api_call, $call);
    my $o_result = Aws::Support::ResolveCaseResult->from_result($result->{ $call->_result_key });
    return $o_result;
  }
}
