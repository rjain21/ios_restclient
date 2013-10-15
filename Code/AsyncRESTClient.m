//
//  AsyncRESTClient.m
//  RESTClient
//
//  Created by RAJESH JAIN on 8/5/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//
#define MAX_CONNECTIONS 3
#import "AsyncRESTClient.h"
typedef void (^ onSuccessResponse) (NSHTTPURLResponse* httpResponse, NSData* responseData);

@implementation AsyncRESTClient
{
    NSOperationQueue *theQueue;
    NSMutableData *data_;
    onSuccessResponse successResponse;    
}

-(id) init{
    self = [super init];
    if(self){
        theQueue = [NSOperationQueue new];
        [theQueue setMaxConcurrentOperationCount:MAX_CONNECTIONS];
        return self;
    }
    return nil;
}


- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)redirectResponse
{
    return request;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *theResponse = (NSHTTPURLResponse*) response;
    successResponse (theResponse , [data_ copy]);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [data_ appendData:data];
}

- (void) executeRequest:(NSURLRequest *)request
                onError: (void (^) (NSError* error)) onerrorHandler
           onCompletion: (void (^) (NSHTTPURLResponse* httpResponse, NSData* responseData)) onCompletionHandler{
    assert(request != nil);
    successResponse = onCompletionHandler;
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    [connection start];
}
@end
