//
//  SFJTextRestrict.h
//  SFJTextFieldDemo
//
//  Created by 沙缚柩 on 2017/3/24.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef BOOL(^SFJStringFilter)(NSString *aString);

typedef NS_ENUM(NSInteger, SFJRestrictType) {
    SFJRestrictTypeOnlyNumber = 1, // 只允许输入数字
    SFJRestrictTypeOnlyDecimal,    // 只允许实数，包括‘.’
    SFJRestrictTypeOnlyCharacter   // 只允许非中文输入
};

@interface SFJTextRestrict : NSObject

@property (nonatomic, assign) NSUInteger maxLength;
@property (nonatomic, readonly) SFJRestrictType restrictType;

+ (instancetype)textRestrictWithRestrictType:(SFJRestrictType)restrictType;
- (void)textDidChanged:(UITextField *)textField;

@end
