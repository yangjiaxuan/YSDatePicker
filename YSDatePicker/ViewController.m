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
{
    YSDatePicker *datePicker;
    UITextField  *tf;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    datePicker = [[YSDatePicker alloc]initWithFrame:(CGRect){{0, 100},{self.view.frame.size.width,200}}];

    [self.view addSubview:datePicker];

    tf = [[UITextField alloc]initWithFrame:(CGRect){{10, 320},{120,30}}];
    tf.placeholder = @"请输入...";
    [self.view addSubview:tf];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = (CGRect){{170, 320},{120,30}};
    [btn setTitle:@"刷新" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor purpleColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction{
    NSInteger index = tf.text.integerValue;
    if (index > 18) {
        return;
    }
    datePicker.datePickerStyle = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
