//
//  YSDatePicker.h
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSDatePickerDataManager.h"

@interface YSDatePicker : UIView

@property (assign, nonatomic) YSDatePickerStyle datePickerStyle;
@property (strong, nonatomic) NSDate *date;

@end
