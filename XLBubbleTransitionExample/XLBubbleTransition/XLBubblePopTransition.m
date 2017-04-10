//
//  XLBubblePopTransition.m
//  XLBubbleTransitionDemo
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import "XLBubblePopTransition.h"

@interface XLBubblePopTransition ()<CAAnimationDelegate>
{
    CGRect _startRect;
    
    NSObject<UIViewControllerContextTransitioning> *_transitionContext;
    
    CAShapeLayer *_maskLayer;
}
@end

@implementation XLBubblePopTransition

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
    
    [self showRoundMaskAnimationTo:transitionContext];
    
    [self showScaleAnimationTo:transitionContext];
}

-(void)showRoundMaskAnimationTo:(id<UIViewControllerContextTransitioning>)transitionContext{
    _transitionContext = transitionContext;
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *contView = [transitionContext containerView];
    [contView addSubview:toView];
    [contView addSubview:fromView];
    
    
    //创建一个 CAShapeLayer 来负责展示圆形遮盖
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.bounds = toView.layer.bounds;
    maskLayer.position = toView.layer.position;
    maskLayer.fillColor = fromView.backgroundColor.CGColor;
//    fromView.layer.mask = maskLayer;
    [toView.layer addSublayer:maskLayer];
    _maskLayer = maskLayer;
    
    //结束圆环
    CGFloat radius = [self radiusOfBubbleInView:toView startPoint:CGPointMake(CGRectGetMidX(_startRect), CGRectGetMidY(_startRect))];
    //开始的圆环
    UIBezierPath *startPath =  [UIBezierPath bezierPathWithOvalInRect:CGRectInset(_startRect, - radius, - radius)];
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:_startRect];
    
    //放大动画
    //将它的 path 指定为最终的 path 来避免在动画完成后会回弹
    maskLayer.path = finalPath.CGPath;
    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)(startPath.CGPath);
    maskLayerAnimation.toValue = (__bridge id)((finalPath.CGPath));
    maskLayerAnimation.duration = [self transitionDuration:transitionContext];
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
}

-(void)showScaleAnimationTo:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    //位移动画
    fromView.layer.position = CGPointMake(CGRectGetMidX(_startRect), CGRectGetMidY(_startRect));
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(fromView.bounds), CGRectGetMidY(fromView.bounds))];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(_startRect), CGRectGetMidY(_startRect))];
    positionAnimation.duration = [self transitionDuration:transitionContext];
    positionAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    positionAnimation.delegate = self;
    [fromView.layer addAnimation:positionAnimation forKey:@"position"];
    
    //缩放动画
    fromView.transform = CGAffineTransformMakeScale(0.0, 0.0);
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(1);
    scaleAnimation.toValue = @(0);
    scaleAnimation.duration = [self transitionDuration:transitionContext];
    scaleAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [fromView.layer addAnimation:scaleAnimation forKey:@"scale"];
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
    
    [_maskLayer removeFromSuperlayer];
    _maskLayer = nil;
}

+(instancetype)transitionWithAnchorRect:(CGRect)rect{
    XLBubblePopTransition *transition = [[XLBubblePopTransition alloc] initWithAnchorRect:rect];
    return transition;
}

@end
