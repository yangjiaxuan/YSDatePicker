//
//  YSDatePicker.m
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import "YSDatePicker.h"
#import "NSDate+Extend.h"
#import "YSDatePickerItem.h"
#import "YSDatePickerItemModel.h"

@interface YSDatePicker()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray  *_dataArr;
    NSString *_year;
    NSString *_month;
    NSString *_day;
    NSString *_hour;
    NSString *_min;
    NSString *_sec;
    
    YSDatePickerDataManager *_dataPickerDataManager;
}
@property (strong, nonatomic) UIPickerView *datePicker;

@end

@implementation YSDatePicker

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupData];
        [self setupUI];
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        [self setupData];
        [self setupUI];
    }
    return self;
}

- (void)setupData{

    self.datePickerStyle = YSDatePickerStyleNormal;
    self.date = [NSDate date];
}

- (void)setupUI{

    self.datePicker = [[UIPickerView alloc]initWithFrame:self.bounds];
    self.datePicker.delegate   = self;
    self.datePicker.dataSource = self;
    [self addSubview:self.datePicker];
    [self setSelectedRowAndComponentWithDate:self.date WithComponent:100];
}

- (void)createData{
    
    _dataPickerDataManager = [YSDatePickerDataManager datePickerDataManagerWithStyle:_datePickerStyle datePickerSize:self.frame.size];
    _dataPickerDataManager.date = self.date;
    _dataArr = _dataPickerDataManager.datePickerData;
    [self.datePicker reloadAllComponents];
    [self setSelectedRowAndComponentWithDate:self.date WithComponent:100];
}

// 设置显示日期 如果 component 为 100，则为全部更新
- (void)setSelectedRowAndComponentWithDate:(NSDate *)date WithComponent:(NSInteger)component{
    
    NSDateComponents *dateComponents = [date dateComponents];
    NSInteger month = dateComponents.month;
    NSInteger day   = dateComponents.day;
    NSInteger hour  = dateComponents.hour;
    NSInteger min   = dateComponents.minute;
    NSInteger sec   = dateComponents.second;
    if (component == 100) {
        
        if (_dataPickerDataManager.yearComponentIndex != DateComponentsNono) {
            [self datePickerSelectedRow:120 realRow:120 atComponent:_dataPickerDataManager.yearComponentIndex animated:NO];
        }
        if (_dataPickerDataManager.monthComponentIndex != DateComponentsNono){
            [self datePickerSelectedRow:month-1 realRow:month+12*10-1 atComponent:_dataPickerDataManager.monthComponentIndex animated:NO];
        }
        if (_dataPickerDataManager.dayComponentIndex != DateComponentsNono){
            [self datePickerSelectedRow:day-1 realRow:day+31*4-1 atComponent:_dataPickerDataManager.dayComponentIndex animated:NO];
        }
        if (_dataPickerDataManager.hourComponentIndex != DateComponentsNono){
            [self datePickerSelectedRow:hour realRow:hour + 24*5  atComponent:_dataPickerDataManager.hourComponentIndex animated:NO];
        }
        if (_dataPickerDataManager.minuteComponentIndex != DateComponentsNono){
            [self datePickerSelectedRow:min realRow:min + 60  atComponent:_dataPickerDataManager.minuteComponentIndex animated:NO];
        }
        if (_dataPickerDataManager.secondComponentIndex != DateComponentsNono){
            [self datePickerSelectedRow:sec realRow:sec + 60  atComponent:_dataPickerDataManager.secondComponentIndex animated:NO];
        }
    }
    else if (component == _dataPickerDataManager.yearComponentIndex){
        [self datePickerSelectedRow:120 realRow:120 atComponent:_dataPickerDataManager.yearComponentIndex animated:NO];
    }
    else if (component == _dataPickerDataManager.monthComponentIndex){
        [self datePickerSelectedRow:month-1 realRow:month+12*10-1 atComponent:_dataPickerDataManager.monthComponentIndex animated:NO];
    }
    else if (component == _dataPickerDataManager.dayComponentIndex){
        [self datePickerSelectedRow:day-1 realRow:day+31*4-1 atComponent:_dataPickerDataManager.dayComponentIndex animated:NO];
    }
    else if (component == _dataPickerDataManager.hourComponentIndex){
        [self datePickerSelectedRow:hour realRow:hour + 24*5  atComponent:_dataPickerDataManager.hourComponentIndex animated:NO];
    }
    else if (component == _dataPickerDataManager.minuteComponentIndex){
        [self datePickerSelectedRow:min realRow:min + 60  atComponent:_dataPickerDataManager.minuteComponentIndex animated:NO];
    }
    else if (component == _dataPickerDataManager.secondComponentIndex){
        [self datePickerSelectedRow:sec realRow:sec + 60  atComponent:_dataPickerDataManager.secondComponentIndex animated:NO];
    }
}

- (void)datePickerSelectedRow:(NSInteger)row realRow:(NSUInteger)realRow atComponent:(NSInteger)component animated:(BOOL)animated{
    YSDatePickerComponentModel *componentModel = _dataArr[component];
    [componentModel selectedRowAtIndex:row];
    [self.datePicker selectRow:realRow           inComponent:component animated:NO];
}

#pragma mark ---  set get ---
-(void)setDate:(NSDate *)date{
    _date = date;
    
    NSDateComponents *dateComponents = [date dateComponents];
    _year  = [NSString stringWithFormat:@"%04ld", dateComponents.year];
    _month = [NSString stringWithFormat:@"%02ld", dateComponents.month];
    _day   = [NSString stringWithFormat:@"%02ld", dateComponents.day];
    
    _hour  = [NSString stringWithFormat:@"%02ld", dateComponents.hour];
    _min   = [NSString stringWithFormat:@"%02ld", dateComponents.minute];
    _sec   = [NSString stringWithFormat:@"%02ld", dateComponents.second];
    
    [self createData];
}

- (void)setDatePickerStyle:(YSDatePickerStyle)datePickerStyle{
    
    _datePickerStyle = datePickerStyle;
    [self createData];
}

#pragma mark --- pickerView 代理 ----
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{

    YSDatePickerComponentModel *componentModel = _dataArr[component];
    return componentModel.componentWidth;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    YSDatePickerComponentModel *componentModel = _dataArr[0];
    return componentModel.componentHeight;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return _dataArr.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return 240;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

    if (![view isKindOfClass:[YSDatePickerItem class]]) {
        YSDatePickerItem *item  = [[YSDatePickerItem alloc]init];
        view = item;
    }
    YSDatePickerComponentModel *componentModel = _dataArr[component];
    YSDatePickerItemModel      *itemModel      = [self getDateModelWithComponent:component row:row];
    view.frame = CGRectMake(0, 0, componentModel.componentWidth, componentModel.componentHeight);
    [(YSDatePickerItem *)view setItemModel:itemModel];
    return view;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    YSDatePickerItemModel *itemModel = [self getDateModelWithComponent:component row:row];
    itemModel.isSelected = YES;
    if (self.datePickerStyle == YSDatePickerStyleNormal) {
        if (component == 0) {
            _year = [itemModel.title stringByReplacingOccurrencesOfString:@"年" withString:@""];
            [self selectedRightDay];
        }
        else if (component == 1) {
            _month = [itemModel.title stringByReplacingOccurrencesOfString:@"月" withString:@""];
            [self selectedRightDay];
        }
        else if (component == 2){
            _day = [itemModel.title stringByReplacingOccurrencesOfString:@"日" withString:@""];
            [self selectedRightDay];
        }
        else if (component == 3){
            _hour = [itemModel.title stringByReplacingOccurrencesOfString:@"时" withString:@""];
        }
        else if (component == 4){
            _min = [itemModel.title stringByReplacingOccurrencesOfString:@"分" withString:@""];
        }
    }
    if ([_month isEqualToString:@"00"]) {
        _month = @"01";
    }
    if ([_day isEqualToString:@"00"]) {
        _day = @"01";
    }
    NSString *dateStr = [NSString stringWithFormat:@"%@-%@-%@ %@:%@:%@",_year,_month,_day,_hour,_min,_sec];
    NSDate *date = [NSDate dateFromDefaultDateFormatterWithDateStr:dateStr];
    self.date = date;
    [self setSelectedRowAndComponentWithDate:date  WithComponent:component];
    if (self.dateSelectedAction) {
        self.dateSelectedAction(date);
    }
}

- (YSDatePickerItemModel *)getDateModelWithComponent:(NSInteger)component row:(NSInteger)row{

    YSDatePickerComponentModel *componentModel = _dataArr[component];
    YSDatePickerItemModel *itemModel;
    if (component == _dataPickerDataManager.yearComponentIndex) {
        itemModel = [componentModel itemModels][row];
    }
    else if (component == _dataPickerDataManager.monthComponentIndex){
        itemModel = [componentModel itemModels][row%12];
    }
    else if (component == _dataPickerDataManager.dayComponentIndex){
        itemModel = [componentModel itemModels][row%31];
    }
    else if (component == _dataPickerDataManager.hourComponentIndex){
        itemModel = [componentModel itemModels][row%24];
    }
    else if (component == _dataPickerDataManager.minuteComponentIndex){
        itemModel = [componentModel itemModels][row%60];
    }
    else if (component == _dataPickerDataManager.secondComponentIndex){
        itemModel = [componentModel itemModels][row%60];
    }
    return itemModel;
}

// 检测当前的日期是否合法 不合法的话 向前推 找到合法的日期
- (void)selectedRightDay{

    NSInteger year  = _year.integerValue;
    NSInteger month = _month.integerValue;
    NSInteger day   = _day.integerValue;
    if (month == 2) {
        if (!(year % 4) && (year%100) && day > 29) {
            _day = @"29";
        }
        else if (day > 28) {
            _day = @"28";
        }
    }
    else if((month == 4 || month == 6 || month == 9 || month == 11)&&(day > 30)){
        _day = @"30";
    }
}

@end
