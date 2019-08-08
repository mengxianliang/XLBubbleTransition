//
//  PresentExampleViewControllerA.m
//  XLBubbleTransitionExample
//
//  Created by MengXianLiang on 2019/8/8.
//  Copyright © 2019 MengXianLiang. All rights reserved.
//

#import "PresentExampleViewControllerA.h"
#import "PresentExampleViewControllerB.h"
#import "XLBubbleTransition.h"

@interface PresentExampleViewControllerA ()

@end

@implementation PresentExampleViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMaxY(self.view.frame) - 60);
    button.layer.cornerRadius = 25.0f;
    button.backgroundColor = [UIColor colorWithRed:189/255.0 green:79/255.0 blue:70/255.0 alpha:1];
    [button addTarget:self action:@selector(presentMethod) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"Menu_icn"] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

-(void)presentMethod {
    PresentExampleViewControllerB *vcB = [[PresentExampleViewControllerB alloc] init];
    [self presentViewController:vcB animated:true completion:nil];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
