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
    
    if (self.datePickerStyle == YSDatePickerStyleNormal) {
        YSDatePickerComponentModel *compontModel = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeYear datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
        compontModel.itemModels = [[self class] getYearArrayFromYear:[self.date?:[NSDate date] getYear]];
        [data addObject:compontModel];
        
        compontModel = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeOther datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
        compontModel.itemModels = _monthTitleArr;
        [data addObject:compontModel];
        
        compontModel = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeOther datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
        compontModel.itemModels = _dayTitleArr;
        [data addObject:compontModel];
        
        compontModel = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeOther datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
        compontModel.itemModels = _hourTitleArr;
        [data addObject:compontModel];
        
        compontModel = [YSDatePickerComponentModel datePickerComponentModelWithCompontType:YSDatePickerComponentTypeOther datePickerStyle:YSDatePickerStyleNormal datePickerSize:_datePickerSize];
        compontModel.itemModels = _minTitleArr;
        [data addObject:compontModel];
        
        _yearComponentIndex   = 0;
        _monthComponentIndex  = 1;
        _dayComponentIndex    = 2;
        _hourComponentIndex   = 3;
        _minuteComponentIndex = 4;
        _secondComponentIndex = DateComponentsNono; // 等于 100
    }
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


@end
