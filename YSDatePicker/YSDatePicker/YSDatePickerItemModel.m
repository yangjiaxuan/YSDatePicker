//
//  YSDatePickerItemModel.m
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import "YSDatePickerItemModel.h"
#import <UIKit/UIKit.h>

@implementation YSDatePickerItemModel

+ (instancetype)modelWithTitle:(NSString *)title{
    YSDatePickerItemModel *itemModel = [[YSDatePickerItemModel alloc]init];
    itemModel.title = title;
    return itemModel;
}

- (instancetype)init{
    if (self = [super init]) {
        self.title = @"";
        self.font  = [UIFont systemFontOfSize:15];
        self.textColor  = [UIColor grayColor];
        self.isSelected = NO;
        self.selectedFont  = [UIFont systemFontOfSize:16];
        self.selectedTextColor = [UIColor blackColor];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    YSDatePickerItemModel *itemModel = [[YSDatePickerItemModel alloc]init];
    itemModel.title = self.title;
    itemModel.font  = self.font;
    itemModel.textColor = self.textColor;
    itemModel.selectedFont = self.selectedFont;
    itemModel.selectedTextColor = self.selectedTextColor;
    return itemModel;
}

@end

@interface YSDatePickerComponentModel()
{
    CGSize _datePickerSize;
}
@end
@implementation YSDatePickerComponentModel

+ (instancetype)datePickerComponentModelWithCompontType:(YSDatePickerComponentType)componentType datePickerStyle:(YSDatePickerStyle)datePickerStyle  datePickerSize:(CGSize)datePickerSize{

    YSDatePickerComponentModel *componentModel = [[YSDatePickerComponentModel alloc]init];
    componentModel->_componentType   = componentType;
    componentModel->_datePickerStyle = datePickerStyle;
    componentModel->_datePickerSize  = datePickerSize;
    [componentModel setupData];
    return componentModel;
}

- (instancetype)init{
    if (self = [super init]) {
        self.componentWidth  = 50;
        self.componentHeight = 50;
    }
    return self;
}

- (void)setupData{

    NSArray *widthScaleArr = @[
        @[@"0.294",@"0.176"],@[@"1.0",@"0.01"],   @[@"0.625",@"0.375"],
        @[@"0.454",@"0.273"],@[@"0.357",@"0.214"],@[@"0.01",@"1.0"],
        @[@"0.5",@"0.5"],    @[@"0.333",@"0.333"],@[@"0.25",@"0.25"],
        @[@"0.2",@"0.2"],    @[@"0.01",@"1"],     @[@"0.5",@"0.5"],
        @[@"0.333",@"0.333"],@[@"0.25",@"0.25"],  @[@"0.01",@"1.0"],
        @[@"0.5",@"0.5"],    @[@"0.01",@"1.0"],   @[@"0.01",@"1.0"],
        @[@"0.25",@"0.15"]
        ];
    CGFloat viewW = _datePickerSize.width - 20;
    if (self.componentType == YSDatePickerComponentTypeYear) {
        self.componentWidth = [[widthScaleArr[_datePickerStyle] firstObject] doubleValue] * viewW;
    }
    else{
        self.componentWidth = [[widthScaleArr[_datePickerStyle] objectAtIndex:1] doubleValue] * viewW;
    }
}

- (void)setDatePickerStyle:(YSDatePickerStyle)datePickerStyle{
    _datePickerStyle = datePickerStyle;
    [self setupData];
}

- (void)selectedRowAtIndex:(NSInteger)index{
    self->_selectedIndex = index;
    [self deSelectedRowAtIndex:index];
    [self changeItemState:YES withIndex:index];
}

- (void)deSelectedRowAtIndex:(NSInteger)index{
    [self changeItemState:NO withIndex:index];
}

- (void)changeItemState:(BOOL)state withIndex:(NSInteger)index{
    if (index < _itemModels.count) {
        YSDatePickerItemModel *itemModel = [_itemModels objectAtIndex:index];
        itemModel.isSelected = state;
    }
}
@end
