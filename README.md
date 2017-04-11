# XLBubbleTransition

iOS ViewController间切换的转场动画

### 功能说明

* 适用于ViewController通过UINavigation的Push和Pop切换时的转场动画。

* 适用于ViewController通过Present和Dismiss切换时的转场动画。

### 显示效果

<img src="https://github.com/mengxianliang/XLBubbleTransition/blob/master/GIF/1.gif" width=300 height=538 />

### 使用方法

__以`ViewControllerA`切换到`ViewControllerB`为例：__

##### 1、 通过Navigation的Push和Pop进行切换时:
在`ViewControllerA`中导入头文件：UIViewController+XLBubbleTransition.h
<br>
添加如下代码，设置push和pop设置动画，并设置锚点。

```objc
self.xl_pushTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
self.xl_popTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
```

##### 2、 通过Present和Dismiss进行切换时:
首先在`ViewControllerB`中导入头文件：UIViewController+XLBubbleTransition.h
<br>
添加如下代码，设置Present和Dismiss设置动画，并设置锚点。
    
```objc
self.xl_presentTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
self.xl_dismissTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
```
