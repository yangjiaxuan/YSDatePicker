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

@implementation YSDatePickerComponentModel

+ (instancetype)datePickerComponentModelWithCompontType:(YSDatePickerComponentType)componentType datePickerStyle:(YSDatePickerStyle)datePickerStyle{

    YSDatePickerComponentModel *componentModel = [[YSDatePickerComponentModel alloc]init];
    componentModel->_componentType   = componentType;
    componentModel->_datePickerStyle = datePickerStyle;
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

    CGFloat viewW = [UIScreen mainScreen].bounds.size.width - 20;
    if (self.datePickerStyle   == YSDatePickerStyleNormal) {
        if (self.componentType == YSDatePickerComponentTypeYear) {
            self.componentWidth = viewW * 5.0/17;
        }
        else{
            self.componentWidth = viewW * 3.0/17;
        }
    }
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
