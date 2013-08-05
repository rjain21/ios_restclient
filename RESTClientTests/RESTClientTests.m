//
//  RESTClientTests.m
//  RESTClientTests
//
//  Created by RAJESH JAIN on 7/22/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SyncRESTClient.h"
#import "NSURLRequest+RESTClient.h"
@interface RESTClientTests : XCTestCase

@end

@implementation RESTClientTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testGetRequestSimple
{
    NSURLRequest *getRequest = [NSURLRequest httpGetRequestWithURL:[NSURL URLWithString:@"http://www.apple.com"]];    
    RESTClient *restClient = [RESTClient new];
    
    [restClient executeRequest:getRequest
                       onError:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData){
                           NSLog(@"Here");
                       }
                  onCompletion:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData){
                      NSLog(responseData);
                  }];
}


- (void) testURL{
    
}
@end
