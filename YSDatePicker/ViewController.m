//
//  ViewController.m
//  YSDatePicker
//
//  Created by yangsen on 17/1/19.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import "ViewController.h"
#import "YSDatePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YSDatePicker *datePicker = [[YSDatePicker alloc]initWithFrame:(CGRect){{0, 300},{320,200}}];
    [self.view addSubview:datePicker];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
