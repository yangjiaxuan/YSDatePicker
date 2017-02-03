//
//  NSDate+Extend.m
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import "NSDate+Extend.h"

@implementation NSDate (Extend)


- (NSInteger)getYear{

    return [self dateComponents].year;
}

- (NSDateComponents *)dateComponents{
    
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];

    dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekOfYear fromDate:self];
    return dateComponents;
}

- (NSString *)stringDateFromDefaultDateFormatter{

    return [[[self class] defaultDateFormatter] stringFromDate:self];
}

+ (NSDate *)dateFromDefaultDateFormatterWithDateStr:(NSString *)dateStr{

    NSDateFormatter *defaultFormatter = [self defaultDateFormatter];
    NSDate *date = [self dateFromDateFormatter:defaultFormatter dateStr:dateStr];
    return date?:[NSDate date];
}

+ (NSDate *)dateFromDateFormatter:(NSDateFormatter *)dateFormatter dateStr:(NSString *)dateStr{

    NSDate *date = [dateFormatter dateFromString:dateStr];
    return date;
}

+ (NSDateFormatter *)defaultDateFormatter{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return dateFormatter;
}

@end
