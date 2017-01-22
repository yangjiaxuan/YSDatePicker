//
//  YSDatePickerDataManager.h
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSDatePickerDataDefine.h"

@interface YSDatePickerDataManager : NSObject

@property (assign, nonatomic) NSInteger yearComponentIndex;
@property (assign, nonatomic) NSInteger monthComponentIndex;
@property (assign, nonatomic) NSInteger dayComponentIndex;
@property (assign, nonatomic) NSInteger hourComponentIndex;
@property (assign, nonatomic) NSInteger minuteComponentIndex;
@property (assign, nonatomic) NSInteger secondComponentIndex;

@property (assign, nonatomic) YSDatePickerStyle datePickerStyle;
@property (strong, nonatomic) NSArray *datePickerData;
@property (strong, nonatomic) NSDate *date;

+ (instancetype)datePickerDataManagerWithStyle:(YSDatePickerStyle)style;

+ (NSArray *)getYearArrayFromYear:(NSInteger)year;

@end
