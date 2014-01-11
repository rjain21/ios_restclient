RESTClient
==========

Simple RESTClient SDK for iOS. Based on no other dependendecy such as ASIHTTPRequest

Example
=======
    NSURLRequest *getRequest = [NSURLRequest httpGetRequestWithURL:[NSURL URLWithString:@"http://www.apple.com"]];
    id<RESTClient> restClient = [SyncRESTClient new];
    
    [restClient executeRequest:getRequest onError:^(NSError* error)
    {
        NSLog(@"%@", [error description]);
    }
    
    onCompletion:^(NSHTTPURLResponse *httpResponse, NSData* responseData)
    {
        NSLog(@"%@",[NSHTTPURLResponse localizedStringForStatusCode:httpResponse.statusCode]);

    }];
