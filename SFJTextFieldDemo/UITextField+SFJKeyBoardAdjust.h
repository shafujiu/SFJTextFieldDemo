//
//  UITextField+SFJKeyBoardAdjust.h
//  SFJTextFieldDemo
//
//  Created by 沙缚柩 on 2017/3/24.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//  键盘自适应 只适合系统自带的键盘，第三方的会有bug

#import <UIKit/UIKit.h>

@interface UITextField (SFJKeyBoardAdjust)
// 自动适应
- (void)setAutoAdjust: (BOOL)autoAdjust;

@end
