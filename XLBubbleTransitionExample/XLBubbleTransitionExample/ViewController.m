//
//  ViewController.m
//  XLBubbleTransitionExample
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "XLBubbleTransition.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    //示例label
//    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
//    label.textColor = [UIColor whiteColor];
//    label.text = @"ViewController A";
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont boldSystemFontOfSize:30];
//    label.textColor = [UIColor colorWithRed:189/255.0 green:79/255.0 blue:70/255.0 alpha:1];
//    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMaxY(self.view.frame) - 60);
    button.layer.cornerRadius = 25.0f;
    button.backgroundColor = [UIColor colorWithRed:189/255.0 green:79/255.0 blue:70/255.0 alpha:1];
    [button addTarget:self action:@selector(pushMethod) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"Menu_icn"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    self.xl_pushTranstion = [XLBubblePushTransition transitionWithAnchorRect:button.frame];
    self.xl_popTranstion = [XLBubblePopTransition transitionWithAnchorRect:button.frame];
}

-(void)pushMethod{
    ViewController1 *vc = [[ViewController1 alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
