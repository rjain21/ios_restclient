//
//  NSStringUtilityTests.m
//  RESTClient
//
//  Created by RAJESH JAIN on 7/23/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+RESTClientString.h"
@interface NSStringUtilityTests : XCTestCase

@end

@implementation NSStringUtilityTests

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

- (void)testYahooExamplePositive1
{
    NSString *str = @"hTTp://www.yahoo.com";
    BOOL isEqu = [str isEqualIgnoreCase:@"http://www.yahoo.com"];
    XCTAssertTrue(isEqu, @"Yahoo URLS with different cases should be the same");
}

- (void)testYahooExamplePositive2
{
    //Just to make sure that the same case is not messed up now
    NSString *str = @"http://www.yahoo.com";
    BOOL isEqu = [str isEqualIgnoreCase:@"http://www.yahoo.com"];
    XCTAssertTrue(isEqu, @"Yahoo URLS with different cases should be the same");
}


- (void)testYahooExampleNegative1
{
    NSString *str = @"hTTp://www.yahoo.com";
    BOOL isEqu = [str isEqualIgnoreCase:@"http://www.yaoo.com"]; //only the "h" in yahoo is missing
    XCTAssertFalse(isEqu, @"Yahoo URLS with different cases should be the same");
}

- (void)testYahooExampleNegative2
{
    //Any Leading or Trailing Space Should fail
    NSString *str = @"hTTp://www.yahoo.com";
    BOOL isEqu = [str isEqualIgnoreCase:@" http://www.yaoo.com"]; //only the "h" in yahoo is missing
    XCTAssertFalse(isEqu, @"Yahoo URLS with different cases should be the same");
}


- (void)testYahooExamplePositive3_WithWhiteSpace
{
    //Any Leading or Trailing Space Should fail
    NSString *str = @"hTTp://www.yahoo.com";
    BOOL isEqu = [str isEqualIgnoreCase:@" http://www.yahoo.com" shouldTrimSpaces:YES];
    XCTAssertTrue(isEqu, @"Yahoo URLS with different cases should be the same (with Whitespace)");
}

- (void)testYahooExamplePositive3_WithWhiteSpace_1
{
    //Any Leading or Trailing Space Should fail
    NSString *str = @"hTTp://www.yahoo.com ";
    BOOL isEqu = [str isEqualIgnoreCase:@" http://www.yahoo.com" shouldTrimSpaces:YES];
    XCTAssertTrue(isEqu, @"Yahoo URLS with different cases should be the same (with Whitespace)");
}


- (void)testYahooExamplePositive3_WithNewLine
{
    //Any Leading or Trailing Space Should fail
    NSString *str = @" hTTp://www.yahoo.com ";
    BOOL isEqu = [str isEqualIgnoreCase:@"\nhttp://www.yahoo.com " shouldTrimSpaces:YES]; //only the "h" in yahoo is missing
    XCTAssertTrue(isEqu, @"Yahoo URLS with different cases should be the same");
}

- (void) testStringIsEmpty{
    NSString *stringToTest = @"";
    BOOL isEq = [stringToTest isEmpty];
    XCTAssertTrue(isEq, @"The String is Empty.");
}

- (void) testStringIsEmpty_NegativeTest{
    NSString *stringToTest = @" test ";
    BOOL isEq = [stringToTest isEmpty];
    XCTAssertFalse(isEq, @"The String is Empty.");
}
@end
