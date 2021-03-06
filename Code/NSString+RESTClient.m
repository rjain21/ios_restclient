//
//  NSString+RESTClientString.m
//  RESTClient
//
//  Created by RAJESH JAIN on 7/22/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import "NSString+RESTClient.h"

@implementation NSString (RESTClient)
- (BOOL) isEqualIgnoreCase: (NSString*) other{
    NSString *selfStr = [self trim:self];
    return [selfStr compare:other options:NSCaseInsensitiveSearch] == NSOrderedSame;
}

- (BOOL) isEqualIgnoreCase: (NSString*) other shouldTrimSpaces:(BOOL) shouldTrimSpaces{
    other = [self trim:other];
    
    return [self isEqualIgnoreCase:other];
}

- (NSString*) trim: (NSString*) stringToTrim{
    return [stringToTrim stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL) isEmpty{
    if(self){
        return [self isEqualIgnoreCase:@"" shouldTrimSpaces:YES];
    }
    else{
        return YES; //because the string is nill;
    }
}

-(NSString*) urlEncodedString{
    return (__bridge_transfer NSString *)
        CFURLCreateStringByAddingPercentEscapes(
                                                NULL,
                                                (__bridge CFStringRef)self,
                                                NULL,
                                                CFSTR("!*'();:@&=+$,/?%#[]\" "),
                                                CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
}
@end
