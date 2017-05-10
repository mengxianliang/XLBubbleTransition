//
//  UIViewController+XLBubbleTransition.m
//  XLBubbleTransitionDemo
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "UIViewController+XLBubbleTransition.h"
#import "XLBubbleTransition.h"
#import <objc/runtime.h>

static NSString *XLPushTransitionKey = @"XLPushTransitionKey";
static NSString *XLPopTransitionKey = @"XLPopTransitionKey";
static NSString *XLPresentTransitionKey = @"XLPresentTransitionKey";
static NSString *XLDismissTransitionKey = @"XLDismissTransitionKey";


@implementation UIViewController (XLBubbleTransition)


#pragma mark -
#pragma mark Setter&Getter

-(void)setXl_pushTranstion:(XLBubbleTransition *)xl_pushTranstion{
    if (xl_pushTranstion) {
        xl_pushTranstion.transitionType = XLBubbleTransitionTypeShow;
        self.navigationController.delegate = self;
        objc_setAssociatedObject(self, &XLPushTransitionKey,
                                 xl_pushTranstion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

-(XLBubbleTransition *)xl_pushTranstion{
    return objc_getAssociatedObject(self, &XLPushTransitionKey);
}

-(void)setXl_popTranstion:(XLBubbleTransition *)xl_popTranstion{
    if (xl_popTranstion) {
        xl_popTranstion.transitionType = XLBubbleTransitionTypeHide;
        self.navigationController.delegate = self;
        objc_setAssociatedObject(self, &XLPopTransitionKey,
                                 xl_popTranstion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

-(XLBubbleTransition *)xl_popTranstion{
    return objc_getAssociatedObject(self, &XLPopTransitionKey);
}

-(void)setXl_presentTranstion:(XLBubbleTransition *)xl_presentTranstion{
    if (xl_presentTranstion) {
        xl_presentTranstion.transitionType = XLBubbleTransitionTypeShow;
        self.transitioningDelegate = self;
        objc_setAssociatedObject(self, &XLPresentTransitionKey,
                                 xl_presentTranstion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

-(XLBubbleTransition *)xl_presentTranstion{
    return objc_getAssociatedObject(self, &XLPresentTransitionKey);
}

-(void)setXl_dismissTranstion:(XLBubbleTransition *)xl_dismissTranstion{
    if (xl_dismissTranstion) {
        xl_dismissTranstion.transitionType = XLBubbleTransitionTypeHide;
        self.transitioningDelegate = self;
        objc_setAssociatedObject(self, &XLDismissTransitionKey,
                                 xl_dismissTranstion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

-(XLBubbleTransition *)xl_dismissTranstion{
    return objc_getAssociatedObject(self, &XLDismissTransitionKey);
}


#pragma mark -
#pragma mark Navigation的Push和Pop转场动画设置
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush && [fromVC isEqual:self]) {
        return self.xl_pushTranstion;
    }else if(operation == UINavigationControllerOperationPop && [toVC isEqual:self]) {
        return self.xl_popTranstion;
    }else{
        return nil;
    }
}

#pragma mark -
#pragma mark Present和Dismiss转场动画
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return (id<UIViewControllerAnimatedTransitioning>)self.xl_presentTranstion;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return (id<UIViewControllerAnimatedTransitioning>)self.xl_dismissTranstion;
}
@end
