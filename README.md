# XLBubbleTransition

iOS ViewController间切换的转场动画

### 功能说明

* 适用于ViewController通过UINavigation的Push和Pop切换时的转场动画。

* 适用于ViewController通过Present和Dismiss切换时的转场动画。

### 显示效果

<img src="https://github.com/mengxianliang/XLBubbleTransition/blob/master/GIF/1.gif" width=300 height=538 />

### 使用方法

* 以ViewControllerA切换到ViewControllerB为例

1、 通过Navigation的Push和Pop进行切换时，在ViewControllerA添加如下代码，设置push和pop设置动画，并设置锚点。

```objc
self.xl_pushTranstion = [XLBubblePushTransition transitionWithAnchorRect:button.frame];
self.xl_popTranstion = [XLBubblePopTransition transitionWithAnchorRect:button.frame];
```

2、 通过Present和Dismiss进行切换时，在ViewControllerB中添加如下代码，设置Present和Dismiss设置动画，并设置锚点。

```objc
self.xl_presentTranstion = [XLBubblePresentTransition transitionWithAnchorRect:button.frame];
self.xl_dismissTranstion = [XLBubbleDismissTransition transitionWithAnchorRect:button.frame];
```
