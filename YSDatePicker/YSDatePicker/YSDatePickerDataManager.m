//
//  YSDatePickerDataManager.m
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import "NSDate+Extend.h"
#import "YSDatePickerDataManager.h"
#import "YSDatePickerItemModel.h"

@interface YSDatePickerDataManager()
{
    NSMutableArray *_yearTitleArr;
    NSMutableArray *_monthTitleArr;
    NSMutableArray *_dayTitleArr;
    NSMutableArray *_hourTitleArr;
    NSMutableArray *_minTitleArr;
    NSMutableArray *_secTitleArr;
    
    CGSize _datePickerSize;
}
@end

@implementation YSDatePickerDataManager

+ (instancetype)datePickerDataManagerWithStyle:(YSDatePickerStyle)style datePickerSize:(CGSize)datePickerSize{

    YSDatePickerDataManager *dateManager = [[YSDatePickerDataManager alloc]init];
    dateManager.datePickerStyle          = style;
    dateManager->_datePickerSize = datePickerSize;
    return dateManager;
}

- (instancetype)init{
    if (self = [super init]) {
        [self createData];
    }
    return self;
}

- (void)createData{
    
    self.datePickerStyle = YSDatePickerStyleNormal;

    _yearComponentIndex   = DateComponentsNono;
    _monthComponentIndex  = DateComponentsNono;
    _dayComponentIndex    = DateComponentsNono;
    _hourComponentIndex   = DateComponentsNono;
    _minuteComponentIndex = DateComponentsNono;
    _secondComponentIndex = DateComponentsNono; // 等于 100
    
    _monthTitleArr = [NSMutableArray array];
    _dayTitleArr   = [NSMutableArray array];
    _hourTitleArr  = [NSMutableArray array];
    _minTitleArr   = [NSMutableArray array];
    _secTitleArr   = [NSMutableArray array];
    
    for (int i = 0; i<60; i++) {
        if (i < 12) {

            [_monthTitleArr addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d月",i+1]]];
            [_dayTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d日",i+1]]];
            [_hourTitleArr  addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d时",i]]];
            [_minTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d分",i]]];
            [_secTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d秒",i]]];
        }
        else if (i < 24){
            [_dayTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d日",i+1]]];
            [_hourTitleArr  addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d时",i]]];
            [_minTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d分",i]]];
            [_secTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d秒",i]]];
        }
        else if (i < 31){
            [_dayTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d日",i+1]]];
            [_minTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d分",i]]];
            [_secTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d秒",i]]];
        }
        else{
            [_minTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d分",i]]];
            [_secTitleArr   addObject:[YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%02d秒",i]]];
        }
    }
}

- (NSArray *)datePickerData{

    NSMutableArray *data = [NSMutableArray array];
    YSDatePickerComponentModel *compontModelY = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeYear datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
    compontModelY.itemModels = [[self class] getYearArrayFromYear:[self.date?:[NSDate date] getYear]];
    
    YSDatePickerComponentModel *compontModelMo = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeOther datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
    compontModelMo.itemModels = _monthTitleArr;
    
    YSDatePickerComponentModel *compontModelD = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeOther datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
    compontModelD.itemModels = _dayTitleArr;
    
    YSDatePickerComponentModel *compontModelH = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeOther datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
    compontModelH.itemModels = _hourTitleArr;
    
    YSDatePickerComponentModel *compontModelMi = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeOther datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
    compontModelMi.itemModels = _minTitleArr;
    
    YSDatePickerComponentModel *compontModelS = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeOther datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
    compontModelS.itemModels = _secTitleArr;


    if (self.datePickerStyle == YSDatePickerStyleNormal) {
        [data addObject:compontModelY];
        [data addObject:compontModelMo];
        [data addObject:compontModelD];
        [data addObject:compontModelH];
        [data addObject:compontModelMi];
        _yearComponentIndex   = 0;
        _monthComponentIndex  = 1;
        _dayComponentIndex    = 2;
        _hourComponentIndex   = 3;
        _minuteComponentIndex = 4;
    }
    else if (self.datePickerStyle == YSDatePickerStyleYear) {
        [data addObject:compontModelY];
        _yearComponentIndex   = 0;
    }
    else if (self.datePickerStyle == YSDatePickerStyleYearMonth) {
        [data addObject:compontModelY];
        [data addObject:compontModelMo];
        _yearComponentIndex   = 0;
        _monthComponentIndex  = 1;
    }
    else if (self.datePickerStyle == YSDatePickerStyleYearMonthDay) {
        [data addObject:compontModelY];
        [data addObject:compontModelMo];
        [data addObject:compontModelD];
        _yearComponentIndex   = 0;
        _monthComponentIndex  = 1;
        _dayComponentIndex    = 2;
    }
    else if (self.datePickerStyle == YSDatePickerStyleYearMonthDayHour) {
        [data addObject:compontModelY];
        [data addObject:compontModelMo];
        [data addObject:compontModelD];
        [data addObject:compontModelH];
        _yearComponentIndex   = 0;
        _monthComponentIndex  = 1;
        _dayComponentIndex    = 2;
        _hourComponentIndex   = 3;
    }
    else if (self.datePickerStyle == YSDatePickerStyleMonth) {
        [data addObject:compontModelMo];
        _monthComponentIndex  = 0;
    }
    else if (self.datePickerStyle == YSDatePickerStyleMonthDay) {
        [data addObject:compontModelMo];
        [data addObject:compontModelD];
        _monthComponentIndex  = 0;
        _dayComponentIndex    = 1;
    }
    else if (self.datePickerStyle == YSDatePickerStyleMonthDayHour) {
        [data addObject:compontModelMo];
        [data addObject:compontModelD];
        [data addObject:compontModelH];
        _monthComponentIndex  = 0;
        _dayComponentIndex    = 1;
        _hourComponentIndex   = 2;
    }
    else if (self.datePickerStyle == YSDatePickerStyleMonthDayHourMin) {
        [data addObject:compontModelMo];
        [data addObject:compontModelD];
        [data addObject:compontModelH];
        [data addObject:compontModelMi];
        _monthComponentIndex  = 0;
        _dayComponentIndex    = 1;
        _hourComponentIndex   = 2;
        _minuteComponentIndex = 3;
    }
    else if (self.datePickerStyle == YSDatePickerStyleMonthDayHourMinSec) {
        [data addObject:compontModelMo];
        [data addObject:compontModelD];
        [data addObject:compontModelH];
        [data addObject:compontModelMi];
        [data addObject:compontModelS];
        _monthComponentIndex  = 0;
        _dayComponentIndex    = 1;
        _hourComponentIndex   = 2;
        _minuteComponentIndex = 3;
        _secondComponentIndex = 4;
    }
    else if (self.datePickerStyle == YSDatePickerStyleDay) {
        [data addObject:compontModelD];
        _dayComponentIndex    = 0;
    }
    else if (self.datePickerStyle == YSDatePickerStyleDayHour) {
        [data addObject:compontModelD];
        [data addObject:compontModelH];
        _dayComponentIndex    = 0;
        _hourComponentIndex   = 1;
    }
    else if (self.datePickerStyle == YSDatePickerStyleDayHourMin) {
        [data addObject:compontModelD];
        [data addObject:compontModelH];
        [data addObject:compontModelMi];
        _dayComponentIndex    = 0;
        _hourComponentIndex   = 1;
        _minuteComponentIndex = 2;
    }
    else if (self.datePickerStyle == YSDatePickerStyleDayHourMinSec) {
        [data addObject:compontModelD];
        [data addObject:compontModelH];
        [data addObject:compontModelMi];
        [data addObject:compontModelS];
        _dayComponentIndex    = 0;
        _hourComponentIndex   = 1;
        _minuteComponentIndex = 2;
        _secondComponentIndex = 3; // 等于 100
    }
    else if (self.datePickerStyle == YSDatePickerStyleHour) {
        [data addObject:compontModelH];
        _hourComponentIndex   = 0;
    }
    else if (self.datePickerStyle == YSDatePickerStyleHourMin) {
        [data addObject:compontModelH];
        [data addObject:compontModelMi];
        _hourComponentIndex   = 0;
        _minuteComponentIndex = 1;
    }
    else if (self.datePickerStyle == YSDatePickerStyleMin) {
        [data addObject:compontModelMi];
        _minuteComponentIndex = 0;
    }
    else if (self.datePickerStyle == YSDatePickerStyleSec) {
        [data addObject:compontModelS];
        _secondComponentIndex = 0; // 等于 100
    }
    else if (self.datePickerStyle == YSDatePickerStyleAll) {
        [data addObject:compontModelY];
        [data addObject:compontModelMo];
        [data addObject:compontModelD];
        [data addObject:compontModelH];
        [data addObject:compontModelMi];
        [data addObject:compontModelS];
        _yearComponentIndex   = 0;
        _monthComponentIndex  = 1;
        _dayComponentIndex    = 2;
        _hourComponentIndex   = 3;
        _minuteComponentIndex = 4;
        _secondComponentIndex = 5; // 等于 100
    }
    [self componentModelResetWithWithComponentModels:data];
    return data;
}

+ (NSArray *)getYearArrayFromYear:(NSInteger)year{
    
    NSMutableArray *yearArr = [NSMutableArray array];
    for (int i = 0; i < 240; i++) {
        YSDatePickerItemModel *itemModel = [YSDatePickerItemModel modelWithTitle:[NSString stringWithFormat:@"%04ld年",(year + i - 120)]];
        [yearArr addObject:itemModel];
    }
    return [yearArr copy];
}

- (void)componentModelResetWithWithComponentModels:(NSArray *)componentModels{
    for (YSDatePickerComponentModel *compontModel in componentModels) {
        compontModel.datePickerStyle = self.datePickerStyle;
    }
}


@end
