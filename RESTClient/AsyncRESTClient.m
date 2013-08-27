//
//  AsyncRESTClient.m
//  RESTClient
//
//  Created by RAJESH JAIN on 8/5/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//
#define MAX_CONNECTIONS 3
#import "AsyncRESTClient.h"

@implementation AsyncRESTClient
{
    NSOperationQueue *theQueue;
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
- (void) executeRequest:(NSURLRequest *)request
                onError: (void (^) (NSError* error)) onerrorHandler
           onCompletion: (void (^) (NSInteger httpStatusCode, NSString* httpStatusCodeString, NSString* responseData, NSDictionary* responseHeaders) ) onCompletionHandler{
    assert(request != nil);
    
    // create the connection with the request and start loading the data
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:nil];
    if (theConnection) {
        // Create the NSMutableData to hold the received data.
        [NSURLConnection sendAsynchronousRequest:request queue:theQueue completionHandler:
         ^(NSURLResponse *response, NSData *recdData, NSError *connectionError) {
             
             if(connectionError){
                 onerrorHandler(connectionError);
             }else{
                 NSString *myString = [[NSString alloc] initWithData:recdData encoding:NSUTF8StringEncoding];
                 
                 NSHTTPURLResponse *theResponse = (NSHTTPURLResponse*) response;
                 
                 NSInteger responseCode = [theResponse statusCode];
                 
                 NSString* localResponse = [NSHTTPURLResponse localizedStringForStatusCode:responseCode];
                 
                 NSDictionary  *allResponseHeaders = [theResponse allHeaderFields];
                 onCompletionHandler(responseCode, localResponse, myString, allResponseHeaders);
             }
         }
         ];
    } else {
        onerrorHandler(nil);
    }
    
}
@end
