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
                onError: (void (^) (NSError*)) onErrorHandler
           onCompletion: (void (^) (NSHTTPURLResponse* httpResponse,
                                    NSData* responseData
                                    )) onCompletionHandler;
@end
