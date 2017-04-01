//
//  XLBubblePushTransition.m
//  XLBubbleTransitionDemo
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLBubblePushTransition.h"

@interface XLBubblePushTransition ()<CAAnimationDelegate>
{
    CGRect _startRect;
    
    NSObject<UIViewControllerContextTransitioning> *_transitionContext;
}
@end

@implementation XLBubblePushTransition

-(instancetype)initWithAnchorRect:(CGRect)rect{
    if (self = [super init]) {
        _startRect = rect;
    }
    return self;
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.35f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    _transitionContext = transitionContext;
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *contView = [transitionContext containerView];
    
    [contView addSubview:fromView];
    [contView addSubview:toView];
    
    //开始的圆环
    UIBezierPath *startPath =  [UIBezierPath bezierPathWithOvalInRect:_startRect];
    
    //结束圆环
    CGFloat radius = [self radiusOfBubbleInView:toView startPoint:CGPointMake(CGRectGetMidX(_startRect), CGRectGetMidY(_startRect))];
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(_startRect, - radius, - radius)];
    //创建一个 CAShapeLayer 来负责展示圆形遮盖
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalPath.CGPath; //将它的 path 指定为最终的 path 来避免在动画完成后会回弹
    toView.layer.mask = maskLayer;
    
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)(startPath.CGPath);
    maskLayerAnimation.toValue = (__bridge id)((finalPath.CGPath));
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    maskLayerAnimation.delegate = self;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
}

//遍历view的四个角 获取最长的半径
-(CGFloat)radiusOfBubbleInView:(UIView*)view startPoint:(CGPoint)startPoint{
    
    //获取四个角所在的点
    CGPoint point1 = CGPointMake(0, 0);
    CGPoint point2 = CGPointMake(view.bounds.size.width, 0);
    CGPoint point3 = CGPointMake(0 ,view.bounds.size.height);
    CGPoint point4 = CGPointMake(view.bounds.size.width,view.bounds.size.height);
    NSArray *pointArrar = @[[NSValue valueWithCGPoint:point1],[NSValue valueWithCGPoint:point2],[NSValue valueWithCGPoint:point3],[NSValue valueWithCGPoint:point4]];
    //做一个冒泡排序获得最长的半径
    CGFloat radius = 0;
    for (NSValue *value in pointArrar) {
        CGPoint point = [value CGPointValue];
        CGFloat apartX = point.x - startPoint.x;
        CGFloat apartY = point.y - startPoint.y;
        CGFloat realRadius = sqrt(apartX*apartX + apartY*apartY);
        if (radius <= realRadius) {
            radius = realRadius;
        }
    }
    return radius;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //告诉 iOS 这个 transition 完成
    [_transitionContext completeTransition:![_transitionContext transitionWasCancelled]];
    //清除 fromVC 的 mask
    [_transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [_transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
}

+(instancetype)transitionWithAnchorRect:(CGRect)rect{
    XLBubblePushTransition *transition = [[XLBubblePushTransition alloc] initWithAnchorRect:rect];
    return transition;
}

@end
