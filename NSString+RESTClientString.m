//
//  NSString+RESTClientString.m
//  RESTClient
//
//  Created by RAJESH JAIN on 7/22/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import "NSString+RESTClientString.h"

@implementation NSString (RESTClientString)
- (BOOL) isEqualIgnoreCase: (NSString*) other{
    return [self compare:other options:NSCaseInsensitiveSearch] == NSOrderedSame;
}

@end
