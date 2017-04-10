# XLBubbleTransition
iOS UINavigation 转场动画

### 功能说明

* 适用于UINavigation的转场动画，在Push和Pop这两个动作是显示。
### 显示效果

<img src="https://github.com/mengxianliang/XLBubbleTransition/blob/master/GIF/1.gif" width=300 height=538 />

### 使用方法

* 在ViewController中设置push和pop的转场动画,初始化时需要设置动画的起始范围和结束范围.
```objc
    self.xl_pushTranstion = [XLBubblePushTransition transitionWithAnchorRect:button.frame];
    self.xl_popTranstion = [XLBubblePopTransition transitionWithAnchorRect:button.frame];
```
