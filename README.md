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


Copyright
=========
The MIT License (MIT)

Copyright (c) 2013 Rajesh Jain

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software. The person should give
proper and prominent attribution to the Copyright holder if the SDK is used in
a commercial project.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Attribution
=============
Uses Base 64 Encoding and Decoding by Matt Gallagher on 2009/06/03. All rights reserved
by Matt.