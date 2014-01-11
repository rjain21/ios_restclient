//
//  RESTClientTests.m
//  RESTClientTests
//
//  Created by RAJESH JAIN on 7/22/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import <XCTest/XCTest.h>
# import "RESTClient.h"
#import "SyncRESTClient.h"
#import "NSURLRequest+RESTClient.h"
#import "NSData+Base64.h"

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

- (void)testGetRequestSync
{
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
    
}


- (void)testGetRequestPVTSync
{
    
    NSString *basicAuth = @"rajeshjain1:LifeSucks";
    NSData *encodedData = [basicAuth dataUsingEncoding:NSUTF8StringEncoding];
    NSString* base64Str = [encodedData base64EncodedString];
    NSString* authStr=[NSString stringWithFormat:@"Basic %@", base64Str];
    
    NSDictionary *headers = @{
                              @"Authorization": authStr
                              };
    
    
    NSURLRequest *getRequest = [NSURLRequest httpGetRequestWithURL:[NSURL URLWithString:@"https://www.pivotaltracker.com/services/v3/tokens/active"] allHeaders:headers];
    
    id<RESTClient> restClient = [SyncRESTClient new];
    
    [restClient executeRequest:getRequest
                       onError:^(NSError * error){
                           NSLog(@"Here");
                           XCTAssertFalse(NO, @"Received %@", [error debugDescription]);
                       }

                  onCompletion:^(NSHTTPURLResponse *httpResponse, NSData* responseData){
                      NSLog(@"%@", responseData);
                      XCTAssertTrue(YES, @"Got a Proper Response");
                  }];
     
    
}


- (void) testURL{
    
}
@end
