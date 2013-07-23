//
//  NSURLRequest+RESTClient.m
//  RESTClient
//
//  Created by RAJESH JAIN on 7/22/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//
#define REST_TIME_OUTINTERVAL_DEFAULT 30 //in secs
#define REST_HTTP_TYPE_GET @"GET"
#define REST_HTTP_TYPE_POST @"POST"
#define REST_HTTP_TYPE_PUT @"PUT"
#define REST_HTTP_TYPE_DELETE @"DELETE"
#define REST_PROTOCOL_HTTP @"http"
#define REST_PROTOCOL_HTTPS @"https"


#import "NSURLRequest+RESTClient.h"
#import "NSString+RESTClientString.h"

@implementation NSURLRequest (RESTClient)

#pragma mark - HTTP GET
+ (NSURLRequest*)httpGetRequestWithURL:(NSURL *)theURL{
    return [self httpGetRequestWithURL:theURL headerFields:nil];
}

+ (NSURLRequest*)httpGetRequestWithURL:(NSURL *)theURL headerFields:(NSDictionary*) headers{
    return [self httpGetRequestWithURL:theURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:REST_TIME_OUTINTERVAL_DEFAULT headerFields:headers];
}

+ (NSURLRequest*)httpGetRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval headerFields:(NSDictionary*) headers{
 return [self createRequestWithgURL:theURL cachePolicy:cachePolicy timeoutInterval:timeoutInterval headerFields:headers body:nil requestType:REST_HTTP_TYPE_GET];
}

#pragma mark - HTTP DELETE
+ (NSURLRequest*)httpDeleteRequestWithURL:(NSURL *)theURL{
    return [self httpDeleteRequestWithURL:theURL headerFields:nil];
}

+ (NSURLRequest*)httpDeleteRequestWithURL:(NSURL *)theURL headerFields:(NSDictionary*) headers{
    return [self httpDeleteRequestWithURL:theURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:REST_TIME_OUTINTERVAL_DEFAULT headerFields:headers];
}
+ (NSURLRequest*)httpDeleteRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval headerFields:(NSDictionary*) headers{
    return [self createRequestWithgURL:theURL cachePolicy:cachePolicy timeoutInterval:timeoutInterval headerFields:headers body:nil requestType:REST_HTTP_TYPE_DELETE];
}



#pragma mark - HTTP POST
+ (NSURLRequest*)httpPostRequestWithURL:(NSURL *)theURL body:(NSString*) stringBody{
    return [self httpPostRequestWithURL:theURL headerFields:nil body:stringBody];
}

+ (NSURLRequest*)httpPostRequestWithURL:(NSURL *)theURL headerFields:(NSDictionary*) headers body:(NSString*) stringBody{
    
    return [self httpPostRequestWithURL:theURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:REST_TIME_OUTINTERVAL_DEFAULT headerFields:headers body:stringBody];
}
+ (NSURLRequest*)httpPostRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval headerFields:(NSDictionary*) headers body:(NSString*) stringBody{
   return [self createRequestWithgURL:theURL cachePolicy:cachePolicy timeoutInterval:timeoutInterval headerFields:headers body:stringBody requestType:REST_HTTP_TYPE_POST];
}


#pragma mark - HTTP PUT

+ (NSURLRequest*)httpPutRequestWithURL:(NSURL *)theURL body:(NSString*) stringBody{
    return [self httpPutRequestWithURL:theURL headerFields:nil body:stringBody];
}


+ (NSURLRequest*)httpPutRequestWithURL:(NSURL *)theURL headerFields:(NSDictionary*) headers body:(NSString*) stringBody{
    return [self httpPutRequestWithURL:theURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:REST_TIME_OUTINTERVAL_DEFAULT headerFields:headers body:stringBody];

}

+ (NSURLRequest*)httpPutRequestWithURL:(NSURL *)theURL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval headerFields:(NSDictionary*) headers body:(NSString*) stringBody{
    return [self createRequestWithgURL:theURL cachePolicy:cachePolicy timeoutInterval:timeoutInterval headerFields:headers body:stringBody requestType:REST_HTTP_TYPE_PUT];

}

+(NSURLRequest*) createRequestWithgURL: (NSURL*) theURL
                           cachePolicy:(NSURLRequestCachePolicy)cachePolicy
                       timeoutInterval:(NSTimeInterval)timeoutInterval
                          headerFields:(NSDictionary*) headers
                                  body:(NSString*) stringBody
                           requestType:(NSString*) requestType{
    assert(theURL != nil);

    assert([REST_PROTOCOL_HTTP isEqualIgnoreCase:theURL.scheme] || [REST_PROTOCOL_HTTPS isEqualIgnoreCase:theURL.scheme]);
    
    assert(timeoutInterval > 0.);
    
    /* If the request is a PUT or POST, some Body is required for sure. For GET and DELETE, we don't really care
     */
    
    if ([requestType isEqualIgnoreCase:REST_HTTP_TYPE_POST] || [requestType isEqualIgnoreCase:REST_HTTP_TYPE_PUT]){
        assert(stringBody != nil);
        assert([@"" isEqualToString:requestType]);
    }
    
    /* Only Support Put Post, Delete and Get for now*/
    
    assert([requestType isEqualIgnoreCase:REST_HTTP_TYPE_DELETE] ||
           [requestType isEqualIgnoreCase:REST_HTTP_TYPE_GET] ||
           [requestType isEqualIgnoreCase:REST_HTTP_TYPE_POST] ||
           [requestType isEqualIgnoreCase:REST_HTTP_TYPE_PUT]);
    ;
    
    /* Initialize */
    NSMutableURLRequest* theRequest = [NSURLRequest requestWithURL:theURL
                                                       cachePolicy:cachePolicy
                                                   timeoutInterval:timeoutInterval];
    
    /* Set Haders */
    NSDictionary * dict = [theRequest allHTTPHeaderFields];
    NSMutableDictionary* mutableDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [mutableDict addEntriesFromDictionary:headers];
    
    /* Set Request Type*/
    [theRequest setHTTPMethod:requestType];
    
    /* Add Body */
    
    if(stringBody){
        NSData *theBody = [stringBody dataUsingEncoding:NSUTF8StringEncoding];
        [theRequest setHTTPBody:theBody];
    }
    
    return theRequest;
}
@end
