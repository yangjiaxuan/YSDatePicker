//
//  YSDatePickerItem.m
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import "YSDatePickerItem.h"

@implementation YSDatePickerItem

- (instancetype)init{
    if (self = [super init]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{

    self.textAlignment = NSTextAlignmentCenter;
}

- (void)setItemModel:(YSDatePickerItemModel *)itemModel{
    _itemModel = itemModel;
    self.text = itemModel.title;
    if (itemModel.isSelected) {
        self.textColor = itemModel.selectedTextColor;
        self.font      = itemModel.selectedFont;
    }
    else{
        self.textColor = itemModel.textColor;
        self.font      = itemModel.font;
    }
}

@end
