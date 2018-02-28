# SFJTextFieldDemo

[inputkit也许是更好的解决方案](https://github.com/tingxins/InputKit) 
解决UITextField的输入检测的方案，以及非第三方键盘适应的小demo

> 该demo 主要是借鉴，LXDTextFieldAdjust写的

> 分析： 该demo是借助，策略模式，讲输入的检测与控件隔离，建立单独的类来做检测，
原文是使用的分类的方式，为UITextFeild通过增加属性的方式，来绑定策略对象。不过
感觉这样做稍微有点不妥，虽然使用runtime可以完美实现，但是这样的方式是不被苹果官
方推荐的，分类主要是方法的扩张，并非属性的扩展。
## 文本限制
```Objective-c
@interface SFJTextRestrict : NSObject

@property (nonatomic, assign) NSUInteger maxLength;
@property (nonatomic, readonly) SFJRestrictType restrictType;

+ (instancetype)textRestrictWithRestrictType:(SFJRestrictType)restrictType;

- (void)textDidChanged:(UITextField *)textField; // 公共接口
```
通过公共接口进行检测，并且该接口是通过addTarget的方式进行绑定，检测文字实时变化。
对于少量文本的输入，该方案可行，但是大文本的输入，效率相对来说不是最好的。

```Objective-c
@interface SFJTextField : UITextField

@property (nonatomic, assign) SFJRestrictType restrictType;

// 文本最长长度
@property (nonatomic, assign) NSUInteger maxTextLength;

// 设置自定义的文本限制
@property (nonatomic, strong) SFJTextRestrict *textRestrict;

@end
```
提供两种方式绑定检测对象，restrictType或者textRestrict
通过textRestrict，我们也可以实现自己的自定义，限制方案。

## 键盘自适应
> 键盘自适应是通过分类实现的，核心是通过键盘的，show，hide通知，获取键盘
frame，然后对窗口进行调整。按照网上的经验，我们应该监听的是键盘frame发生
改变的通知，这样更精准，但是发现在第一次掉出第三方键盘的时候，会有bug，所以
该方案只适用于系统自带键盘。毕竟也只是一个小小的分类，作为键盘自适应的完美解
决方案我们完全可以使用第三方成熟的框架、[IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager)
