//
//  YSDatePickerItemModel.h
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSDatePickerDataManager.h"
#import "YSDatePickerDataDefine.h"

@interface YSDatePickerItemModel : NSObject<NSCopying>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) UIColor  *textColor;
@property (copy, nonatomic) UIColor  *selectedTextColor;
@property (copy, nonatomic) UIFont   *font;
@property (copy, nonatomic) UIFont   *selectedFont;

+ (instancetype)modelWithTitle:(NSString *)title;

@end

@interface YSDatePickerComponentModel : NSObject

@property (assign, nonatomic) double componentHeight;
@property (assign, nonatomic) double componentWidth;

@property (assign, nonatomic, readonly) YSDatePickerComponentType componentType;
@property (assign, nonatomic, readonly) YSDatePickerStyle datePickerStyle;

@property (strong, nonatomic) NSArray <YSDatePickerItemModel *>*itemModels;

+ (instancetype)datePickerComponentModelWithCompontType:(YSDatePickerComponentType)componentType datePickerStyle:(YSDatePickerStyle)datePickerStyle;

@end
