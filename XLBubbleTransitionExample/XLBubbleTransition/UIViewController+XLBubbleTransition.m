//
//  UIViewController+XLBubbleTransition.m
//  XLBubbleTransitionDemo
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "UIViewController+XLBubbleTransition.h"
#import "XLBubblePopTransition.h"
#import "XLBubblePushTransition.h"
#import <objc/runtime.h>

static NSString *XLPushTransitionKey = @"XLPushTransitionKey";
static NSString *XLPopTransitionKey = @"XLPopTransitionKey";

@implementation UIViewController (XLBubbleTransition)


-(void)setXl_pushTranstion:(XLBubblePushTransition *)xl_pushTranstion{
    if (xl_pushTranstion) {
        self.navigationController.delegate = self;
        objc_setAssociatedObject(self, &XLPushTransitionKey,
                                 xl_pushTranstion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

-(XLBubblePushTransition *)xl_pushTranstion{
    return objc_getAssociatedObject(self, &XLPushTransitionKey);
}

-(void)setXl_popTranstion:(XLBubblePopTransition *)xl_popTranstion{
    if (xl_popTranstion) {
        self.navigationController.delegate = self;
        objc_setAssociatedObject(self, &XLPopTransitionKey,
                                 xl_popTranstion, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

-(XLBubblePopTransition *)xl_popTranstion{
    return objc_getAssociatedObject(self, &XLPopTransitionKey);
}


-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return self.xl_pushTranstion;
    }else if(operation == UINavigationControllerOperationPop) {
        return self.xl_popTranstion;
    }else{
        return nil;
    }
}

@end
