//
//  YSDatePickerDataDefine.h
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#ifndef YSDatePickerDataDefine_h
#define YSDatePickerDataDefine_h

// 当日期选择器中没有这一项时 该项的component被置为 1000
#define DateComponentsNono 1000

typedef NS_ENUM(NSInteger, YSDatePickerStyle){
    
    YSDatePickerStyleNormal,
    YSDatePickerStyleYear,
    YSDatePickerStyleYearMonth,
    YSDatePickerStyleYearMonthDay,
    YSDatePickerStyleYearMonthDayHour,
    YSDatePickerStyleMonth,
    YSDatePickerStyleMonthDay,
    YSDatePickerStyleMonthDayHour,
    YSDatePickerStyleMonthDayHourMin,
    YSDatePickerStyleMonthDayHourMinSec,
    YSDatePickerStyleDay,
    YSDatePickerStyleDayHour,
    YSDatePickerStyleDayHourMin,
    YSDatePickerStyleDayHourMinSec,
    YSDatePickerStyleHour,
    YSDatePickerStyleHourMin,
    YSDatePickerStyleMin,
    YSDatePickerStyleSec,
    YSDatePickerStyleAll
};

typedef NS_ENUM(NSInteger, YSDatePickerComponentType){
    YSDatePickerComponentTypeYear,
    YSDatePickerComponentTypeOther
};

#endif /* YSDatePickerDataDefine_h */
