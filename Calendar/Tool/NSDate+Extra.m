//
//  NSDate+Extra.m
//  Calendar
//
//  Created by user on 17/8/15.
//  Copyright © 2017年 user. All rights reserved.
//

#import "NSDate+Extra.h"

@implementation NSDate (Extra)

- (NSString *)stringWithDateFormatString:(NSString *)formateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans"];
    [formatter setLocale:locale];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:formateString];
    return [formatter stringFromDate:self];
}

@end
