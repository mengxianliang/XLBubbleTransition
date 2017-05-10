//
//  ViewController.m
//  XLBubbleTransitionExample
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "XLBubbleTransition.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMaxY(self.view.frame) - 60);
    button.layer.cornerRadius = 25.0f;
    button.backgroundColor = [UIColor colorWithRed:189/255.0 green:79/255.0 blue:70/255.0 alpha:1];
    [button addTarget:self action:@selector(pushMethod) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"Menu_icn"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    //在ViewControllerA中添加push和pop的动画
    self.xl_pushTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
    self.xl_popTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
}

-(void)pushMethod{
    ViewControllerB *vcB = [[ViewControllerB alloc] init];
    if (_pushViewControllerB) {
        [self.navigationController pushViewController:vcB animated:true];
    }else{
        [self presentViewController:vcB animated:true completion:nil];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
