//
//  NSUrlRequestTest.m
//  RESTClient
//
//  Created by RAJESH JAIN on 7/23/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURLRequest+RESTClient.h"
#import "NSString+RESTClientString.h"
@interface NSUrlRequestTest : XCTestCase

@end

@implementation NSUrlRequestTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testHTTPGETScenario
{
    NSURLRequest* urlRequest = [NSURLRequest httpGetRequestWithURL:[NSURL URLWithString:@"http://www.yahoo.com"]];
    
    NSString* httpMethod =urlRequest.HTTPMethod;
    
    XCTAssertTrue([httpMethod isEqualIgnoreCase:@"GET"], @"The Request method should be GET");
}


- (void)testHTTPPOSTScenario
{
    NSURLRequest* urlRequest = [NSURLRequest httpPostRequestWithURL:[NSURL URLWithString:@"http://www.yahoo.com"] body:@"<root></root>" mimeType:MimeTypeXML];
    
    NSString* httpMethod =urlRequest.HTTPMethod;
    
    XCTAssertTrue([httpMethod isEqualIgnoreCase:@"post"], @"The Request method should be GET");
}


- (void)testHTTPDELETEScenario
{
    NSURLRequest* urlRequest = [NSURLRequest httpDeleteRequestWithURL:[NSURL URLWithString:@"http://www.yahoo.com"]];
    
    NSString* httpMethod =urlRequest.HTTPMethod;
    
    XCTAssertTrue([httpMethod isEqualIgnoreCase:@"delete"], @"The Request method should be GET");
}


- (void)testHTTPPUTScenario
{
    NSURLRequest* urlRequest = [NSURLRequest httpPutRequestWithURL:[NSURL URLWithString:@"http://www.yahoo.com"] body:@"<root></root>" mimeType:MimeTypeXML];
    
    NSString* httpMethod =urlRequest.HTTPMethod;
    
    XCTAssertTrue([httpMethod isEqualIgnoreCase:@"put"], @"The Request method should be GET");
}


- (void)testHTTPPUTScenario_WithHeaders
{
    NSURLRequest* urlRequest = [NSURLRequest httpPutRequestWithURL:[NSURL URLWithString:@"http://www.yahoo.com"] body:@"<root></root>" mimeType:MimeTypeXML];
    
    NSString* httpMethod =urlRequest.HTTPMethod;
    NSDictionary *headers = [urlRequest allHTTPHeaderFields];
    XCTAssertTrue([httpMethod isEqualIgnoreCase:@"put"], @"The Request method should be GET");
    
    NSString* content_type=[headers valueForKey:@"Content-Type"];
    
    XCTAssertTrue([content_type isEqualIgnoreCase:@"application/xml"], @"The Request content type should be XML");
}

@end
