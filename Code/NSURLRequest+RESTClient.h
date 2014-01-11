//
//  NSURLRequest+RESTClient.h
//  RESTClient
//
//  Created by RAJESH JAIN on 7/22/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

typedef enum{
    MimeTypePlainText,
    MimeTypeXML,
    MimeTypeJSON
} MimeType;


#import <Foundation/Foundation.h>
@interface NSURLRequest (RESTClient)

//GET
+ (NSURLRequest*)httpGetRequestWithURL:(NSURL *)theURL;
+ (NSURLRequest*)httpGetRequestWithURL:(NSURL *)theURL allHeaders:(NSDictionary*) headers;
+ (NSURLRequest*)httpGetRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval allHeaders:(NSDictionary*) headers;

//DELETE
+ (NSURLRequest*)httpDeleteRequestWithURL:(NSURL *)theURL;
+ (NSURLRequest*)httpDeleteRequestWithURL:(NSURL *)theURL allHeaders:(NSDictionary*) headers;
+ (NSURLRequest*)httpDeleteRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval allHeaders:(NSDictionary*) headers;

//POST
+ (NSURLRequest*)httpPostRequestWithURL:(NSURL *)theURL body:(NSString*) stringBody mimeType:(MimeType) mimeType;
+ (NSURLRequest*)httpPostRequestWithURL:(NSURL *)theURL allHeaders:(NSDictionary*) headers body:(NSString*) stringBody mimeType:(MimeType) mimeType;
+ (NSURLRequest*)httpPostRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval allHeaders:(NSDictionary*) headers body:(NSString*) stringBody mimeType:(MimeType) mimeType;

//PUT

+ (NSURLRequest*)httpPutRequestWithURL:(NSURL *)theURL body:(NSString*) stringBody mimeType:(MimeType) mimeType;

+ (NSURLRequest*)httpPutRequestWithURL:(NSURL *)theURL allHeaders:(NSDictionary*) headers body:(NSString*) stringBody mimeType:(MimeType) mimeType;

+ (NSURLRequest*)httpPutRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval allHeaders:(NSDictionary*) headers body:(NSString*) stringBody mimeType:(MimeType) mimeType;


@end
