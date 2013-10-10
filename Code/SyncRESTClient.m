//
//  RESTClient.m
//  RESTClient
//
//  Created by RAJESH JAIN on 7/26/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import "SyncRESTClient.h"
#import "NSURLRequest+RESTClient.h"
@implementation SyncRESTClient{
}

- (void) executeRequest:(NSURLRequest *)request
                onError: (void (^) (NSError*)) onerrorHandler
           onCompletion: (void (^) (NSHTTPURLResponse* httpResponse,
                                    NSString* responseData
                                    )) onCompletionHandler {


    assert(request != nil);
    
    NSHTTPURLResponse* theResponse;
    NSError* theError;
    
    NSData *recdData = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&theError];
    NSString *recdDataString = [NSString stringWithUTF8String:recdData.bytes];
    
    if(theError != nil){
        onerrorHandler (theError);
    }else{
        onCompletionHandler (theResponse, recdDataString);
    }
}
@end
