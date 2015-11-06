//
//  ViewController.m
//  aaaaa
//
//  Created by 方天添 on 15/11/6.
//  Copyright © 2015年 fangtiantian. All rights reserved.
//

#import "ViewController.h"
#import "SegemgntView.h"

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

@interface ViewController ()<SegemgntViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *array = [NSArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"", nil];
    
    SegmentView *view = [[SegmentView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 49) withData:array withMaxItemNum:4];
    view.delegate = self;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectType:(NSString *)selectedType{
    NSLog(@"选择了第%@个",selectedType);
}

@end
