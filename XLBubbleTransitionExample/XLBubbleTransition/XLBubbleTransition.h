//
//  XLBubbleTransition.h
//  XLBubbleTransitionTest
//
//  Created by MengXianLiang on 2017/4/11.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIViewController+XLBubbleTransition.h"

typedef NS_ENUM(NSInteger,XLBubbleTransitionType) {
    XLBubbleTransitionTypeShow = 0,
    XLBubbleTransitionTypeHide,
};

@interface XLBubbleTransition : NSObject<UIViewControllerAnimatedTransitioning>

//转场方式：显示/隐藏
@property (nonatomic, assign) XLBubbleTransitionType transitionType;

//初始化方法
-(instancetype)initWithAnchorRect:(CGRect)anchorRect;
+(instancetype)transitionWithAnchorRect:(CGRect)anchorRect;

@end
