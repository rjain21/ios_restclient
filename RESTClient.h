//
//  RESTClient.h
//  RESTClient
//
//  Created by RAJESH JAIN on 7/26/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RESTClient : NSObject<NSURLConnectionDelegate>
- (void) executeRequest:(NSURLRequest *)request
                onError: (void (^) (NSInteger httpStatusCode, NSString* httpErrorString, NSString* responseData)) onerrorHandler
           onCompletion: (void (^) (NSInteger httpStatusCode, NSString* httpStatusCodeString, NSString* responseData) ) onCompletionHandler;

@end
