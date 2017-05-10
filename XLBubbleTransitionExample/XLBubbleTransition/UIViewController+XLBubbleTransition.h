//
//  UIViewController+XLBubbleTransition.h
//  XLBubbleTransitionDemo
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//  GitHub ：https://github.com/mengxianliang/XLBubbleTransition

#import <UIKit/UIKit.h>
@class XLBubbleTransition;

@interface UIViewController (XLBubbleTransition)<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic, retain) XLBubbleTransition *xl_pushTranstion;

@property (nonatomic, retain) XLBubbleTransition *xl_popTranstion;

@property (nonatomic, retain) XLBubbleTransition *xl_presentTranstion;

@property (nonatomic, retain) XLBubbleTransition *xl_dismissTranstion;

@end
