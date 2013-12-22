//
//  NSString+RESTClientString.h
//  RESTClient
//
//  Created by RAJESH JAIN on 7/22/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RESTClient)
- (BOOL) isEqualIgnoreCase: (NSString*) other;
- (BOOL) isEqualIgnoreCase: (NSString*) other shouldTrimSpaces:(BOOL) shouldTrimSpaces;
- (NSString*) trim: (NSString*) stringToTrim;
- (BOOL) isEmpty;
- (NSString*) urlEncodedString;

@end
