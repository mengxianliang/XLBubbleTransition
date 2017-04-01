//
//  XLBubblePushTransition.h
//  XLBubbleTransitionDemo
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//  GitHub ：https://github.com/mengxianliang/XLBubbleTransition

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XLBubblePushTransition : NSObject<UIViewControllerAnimatedTransitioning>

-(instancetype)initWithAnchorRect:(CGRect)rect;
+(instancetype)transitionWithAnchorRect:(CGRect)rect;

@end
