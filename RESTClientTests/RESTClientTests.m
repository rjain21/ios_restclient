//
//  RESTClientTests.m
//  RESTClientTests
//
//  Created by RAJESH JAIN on 7/22/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RESTClient.h"
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

- (void)testExample
{
    RESTClient *r=[[RESTClient alloc] init];
    [r getData];
}

@end
