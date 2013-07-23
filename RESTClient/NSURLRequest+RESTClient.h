//
//  NSURLRequest+RESTClient.h
//  RESTClient
//
//  Created by RAJESH JAIN on 7/22/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (RESTClient)


+ (NSURLRequest*)httpGetRequestWithURL:(NSURL *)theURL;
+ (NSURLRequest*)httpGetRequestWithURL:(NSURL *)theURL headerFields:(NSDictionary*) headers;
+ (NSURLRequest*)httpGetRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval headerFields:(NSDictionary*) headers;


+ (NSURLRequest*)httpDeleteRequestWithURL:(NSURL *)theURL;
+ (NSURLRequest*)httpDeleteRequestWithURL:(NSURL *)theURL headerFields:(NSDictionary*) headers;
+ (NSURLRequest*)httpDeleteRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval headerFields:(NSDictionary*) headers;

+ (NSURLRequest*)httpPostRequestWithURL:(NSURL *)theURL body:(NSString*) stringBody;

+ (NSURLRequest*)httpPostRequestWithURL:(NSURL *)theURL headerFields:(NSDictionary*) headers body:(NSString*) stringBody;

+ (NSURLRequest*)httpPostRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval headerFields:(NSDictionary*) headers body:(NSString*) stringBody;


+ (NSURLRequest*)httpPutRequestWithURL:(NSURL *)theURL body:(NSString*) stringBody;


+ (NSURLRequest*)httpPutRequestWithURL:(NSURL *)theURL headerFields:(NSDictionary*) headers body:(NSString*) stringBody;

+ (NSURLRequest*)httpPutRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval headerFields:(NSDictionary*) headers body:(NSString*) stringBody;


@end
