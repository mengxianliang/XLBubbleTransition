# XLBubbleTransition
iOS UINavigation 转场动画

### 功能说明

* 适用于UINavigation的转场动画，在Push和Pop这两个动作是显示。
### 显示效果

![image](https://github.com/mengxianliang/XLBubbleTransition/blob/master/GIF/1.gif)

### 使用方法

* 在ViewController中设置push和pop的转场动画

```objc
    self.xl_pushTranstion = [XLBubblePushTransition transitionWithAnchorRect:button.frame];
    self.xl_popTranstion = [XLBubblePopTransition transitionWithAnchorRect:button.frame];
```
