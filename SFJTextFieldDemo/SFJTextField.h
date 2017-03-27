//
//  SFJTextField.h
//  SFJTextFieldDemo
//
//  Created by 沙缚柩 on 2017/3/24.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFJTextRestrict.h"

@interface SFJTextField : UITextField

@property (nonatomic, assign) SFJRestrictType restrictType;

// 文本最长长度
@property (nonatomic, assign) NSUInteger maxTextLength;

// 设置自定义的文本限制
@property (nonatomic, strong) SFJTextRestrict *textRestrict;

@end
