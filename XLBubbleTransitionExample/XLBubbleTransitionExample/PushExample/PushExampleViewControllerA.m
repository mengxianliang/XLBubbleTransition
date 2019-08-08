//
//  PushExampleViewControllerA.m
//  XLBubbleTransitionExample
//
//  Created by MengXianLiang on 2019/8/8.
//  Copyright © 2019 MengXianLiang. All rights reserved.
//

#import "PushExampleViewControllerA.h"
#import "PushExampleViewControllerB.h"
#import "XLBubbleTransition.h"

@interface PushExampleViewControllerA ()

@end

@implementation PushExampleViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMaxY(self.view.frame) - 60);
    button.layer.cornerRadius = 25.0f;
    button.backgroundColor = [UIColor colorWithRed:189/255.0 green:79/255.0 blue:70/255.0 alpha:1];
    [button addTarget:self action:@selector(pushMethod:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"Menu_icn"] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)pushMethod:(UIButton *)button {
    //设置push&pop动画
    self.xl_pushTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
    self.xl_popTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
    
    PushExampleViewControllerB *vcB = [[PushExampleViewControllerB alloc] init];
    [self.navigationController pushViewController:vcB animated:true];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
