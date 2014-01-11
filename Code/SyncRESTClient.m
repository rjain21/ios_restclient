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
                onError: (void (^) (NSError*)) onErrorHandler
           onCompletion: (void (^) (NSHTTPURLResponse* httpResponse,
                                    NSData* responseData
                                    )) onCompletionHandler {


    assert(request != nil);
    
    NSHTTPURLResponse* theResponse;
    NSError* theError;
    
    NSData *recdData = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&theError];
    
    
    NSString *recdDataString = [NSString stringWithUTF8String:recdData.bytes];
    
    NSLog(@"\n----Response Recd %d bytes-------\n %@ \n-------End Response--------\n", recdData.length, recdDataString);
    
    if(theError != nil){
        onErrorHandler (theError);
    }else{
        onCompletionHandler (theResponse, recdData);
    }

}
@end
