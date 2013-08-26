//
//  RESTClient.h
//  RESTClient
//
//  Created by RAJESH JAIN on 8/5/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RESTClient <NSObject>
@required
    - (void) executeRequest:(NSURLRequest *)request
                    onError: (void (^) (NSError*)) onerrorHandler
               onCompletion: (void (^) (NSInteger httpStatusCode, NSString* httpStatusCodeString, NSString* responseData,
                                        NSDictionary *responseHeaders)) onCompletionHandler;
@end
