//
//  URLHelpers.m
//  Satellite
//
//  Created by Benjamin Gordon on 7/19/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "URLHelpers.h"

@implementation URLHelpers

+(NSURL *)urlFromURLBarText:(NSString *)text {
    // Detect link
    __block NSURL *resultURL = nil;
    NSDataDetector *detector = [[NSDataDetector alloc] initWithTypes:(NSTextCheckingTypes)NSTextCheckingTypeLink error:nil];
    [detector enumerateMatchesInString:text options:kNilOptions range:NSMakeRange(0, text.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        resultURL = result.URL;
    }];
    
    // Return Link if it's there and there is no whitespace
    if (resultURL && ([text rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@" "]].location == NSNotFound)) {
        return resultURL;
    }
    
    // Else Return google search
    NSArray *textComponents = [text componentsSeparatedByString:@" "];
    NSString *newSearchString = @"";
    for (NSString *component in textComponents) {
        newSearchString = [newSearchString stringByAppendingString:[NSString stringWithFormat:@"%@+", component]];
    }
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://google.com/q=%@",[newSearchString substringToIndex:newSearchString.length - 1]]];
}

@end
