//
//  RESTClient.m
//  RESTClient
//
//  Created by RAJESH JAIN on 7/26/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import "RESTClient.h"
#import "NSURLRequest+RESTClient.h"
@implementation RESTClient{

}


- (void) executeRequest:(NSURLRequest *)request
                onError: (void (^) (NSInteger httpStatusCode, NSString* httpErrorString, NSString* responseData)) onerrorHandler
           onCompletion: (void (^) (NSInteger httpStatusCode, NSString* httpStatusCodeString, NSString* responseData) ) onCompletionHandler{
    assert(request != nil);
    
    // create the connection with the request and start loading the data
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:nil];
    if (theConnection) {
        
        // Create the NSMutableData to hold the received data.
        
        
        NSHTTPURLResponse* theResponse;
        NSError* theError;
        
        NSData *recdData = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&theError];
        NSString *recdDataString = [[NSString alloc] initWithData:recdData encoding:NSUTF8StringEncoding];
        
        NSInteger httpStatusCode = [theResponse statusCode];
        
        NSString* localizedResponseCode = [NSHTTPURLResponse localizedStringForStatusCode:httpStatusCode];
        NSDictionary  *allResponseHeaders = [theResponse allHeaderFields];
        
        if(theError == nil){
            onerrorHandler (httpStatusCode, localizedResponseCode, recdDataString);
        }else{
            onCompletionHandler (httpStatusCode, localizedResponseCode, recdDataString);
        }
        
        /*
         NSOperationQueue *theQueue = [NSOperationQueue new];
         [NSURLConnection sendAsynchronousRequest:theRequest queue:theQueue completionHandler:
         ^(NSURLResponse *response, NSData *recdData, NSError *connectionError) {
         NSString *myString = [[NSString alloc] initWithData:recdData encoding:NSUTF8StringEncoding];
         NSHTTPURLResponse *theResponse = (NSHTTPURLResponse*) response;
         NSInteger responseCode = [theResponse statusCode];
         NSString* localResponse = [NSHTTPURLResponse localizedStringForStatusCode:responseCode];
         NSDictionary  *allResponseHeaders = [theResponse allHeaderFields];
         NSLog(@"%@", myString);
         }
         ];
         */
        
        
        
    } else {
        // Inform the user that the connection failed.
    }
   
}
@end
