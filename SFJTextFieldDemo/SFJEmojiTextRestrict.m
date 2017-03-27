//
//  SFJEmojiTextRestrict.m
//  SFJTextFieldDemo
//
//  Created by 沙缚柩 on 2017/3/24.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJEmojiTextRestrict.h"

@implementation SFJEmojiTextRestrict

- (void)textDidChanged:(UITextField *)textField{
   
    NSMutableString * modifyString = textField.text.mutableCopy;
    for (NSInteger idx = 0; idx < modifyString.length;) {
        NSString * subString = [modifyString substringWithRange: NSMakeRange(idx, 1)];
        
        NSString * emojiExp = @"^[\\ud83c\\udc00-\\ud83c\\udfff]|[\\ud83d\\udc00-\\ud83d\\udfff]|[\\u2600-\\u27ff]$";
        // [//ud83c//udc00-//ud83c//udfff]|[//ud83d//udc00-//ud83d//udfff]|[//u2600-//u27ff]
        NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", emojiExp];
        if ([predicate evaluateWithObject: subString]) {
            idx++;
        } else {
            [modifyString deleteCharactersInRange: NSMakeRange(idx, 1)];
        }
    }
    textField.text = modifyString;
}

@end
