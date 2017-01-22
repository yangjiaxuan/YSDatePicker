//
//  NSDate+Extend.h
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extend)

- (NSInteger)getYear;
- (NSDateComponents *)dateComponents;

- (NSString *)stringDateFromDefaultDateFormatter;

+ (NSDate *)dateFromDefaultDateFormatterWithDateStr:(NSString *)dateStr;

+ (NSDateFormatter *)defaultDateFormatter;

@end
