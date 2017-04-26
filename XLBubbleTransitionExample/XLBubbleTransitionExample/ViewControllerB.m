//
//  ViewController1.m
//  XLBubbleTransitionExample
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "ViewControllerB.h"
#import "UIViewController+XLBubbleTransition.h"


@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:189/255.0 green:79/255.0 blue:70/255.0 alpha:1];
    
    //示例label
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.textColor = [UIColor whiteColor];
    label.text = @"Hello!";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"AmericanTypewriter" size:40];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMaxY(self.view.frame) - 60);
    [button setImage:[UIImage imageNamed:@"Close_icn"] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    button.layer.cornerRadius = button.bounds.size.width/2.0f;
    [button addTarget:self action:@selector(popMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    //在ViewControllerB中添加Present和Dismiss的动画
    self.xl_presentTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
    self.xl_dismissTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
}

-(void)popMethod{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:true];
    }else{
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
