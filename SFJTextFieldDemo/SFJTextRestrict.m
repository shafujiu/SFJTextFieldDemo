//
//  SFJTextRestrict.m
//  SFJTextFieldDemo
//
//  Created by 沙缚柩 on 2017/3/24.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJTextRestrict.h"

@interface SFJTextRestrict ()

@property (nonatomic, readwrite) SFJRestrictType restrictType;

@end

@interface SFJNumberTextRestrict : SFJTextRestrict

@end

@interface SFJDecimalTextRestrict : SFJTextRestrict

@end

@interface SFJCharacterTextRestrict : SFJTextRestrict

@end

@implementation SFJTextRestrict

+ (instancetype)textRestrictWithRestrictType:(SFJRestrictType)restrictType{
   
    SFJTextRestrict *textRestrict;
    switch (restrictType) {
        case SFJRestrictTypeOnlyNumber:
            textRestrict = [[SFJNumberTextRestrict alloc] init];
            break;
        case SFJRestrictTypeOnlyDecimal:
            textRestrict = [[SFJDecimalTextRestrict alloc] init];
            break;
        case SFJRestrictTypeOnlyCharacter:
            textRestrict = [[SFJCharacterTextRestrict alloc] init];
            break;
        default:
            break;
    }
    textRestrict.maxLength = NSUIntegerMax;
    textRestrict.restrictType = restrictType;
    return textRestrict;
}

- (void)textDidChanged:(UITextField *)textField{
    
}

- (NSString *)restrictMaxLength: (NSString *)text
{
    if (text.length > _maxLength) {
        text = [text substringToIndex: self.maxLength];
    }
    return text;
}

@end

static inline NSString * kFilterString(NSString *handleString, SFJStringFilter substringFilter){
    NSMutableString *modifyString = handleString.mutableCopy;
    for (NSInteger idx = 0; idx < modifyString.length;) {
        NSString *subString = [modifyString substringWithRange:NSMakeRange(idx, 1)];
        if (substringFilter(subString)) {
            idx++;
        }else{
            [modifyString deleteCharactersInRange:NSMakeRange(idx, 1)];
        }
    }
    return modifyString;
}

static inline BOOL kMatchStringFormat(NSString *aString, NSString *matchFormat){
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",matchFormat];
    return [predicate evaluateWithObject:aString];
}

static NSString *const kRegxNumber = @"^\\d$";
static NSString *const kRegxDecimal = @"^[0-9.]$";
static NSString *const kRegxCharacter = @"^[^[\\u4e00-\\u9fa5]]$";

@implementation SFJNumberTextRestrict

- (void)textDidChanged:(UITextField *)textField{
    NSString *filterText = kFilterString(textField.text, ^BOOL(NSString *aString) {
        return kMatchStringFormat(aString, kRegxNumber);
    });
    textField.text = [super restrictMaxLength:filterText];
}

@end

@implementation SFJDecimalTextRestrict

- (void)textDidChanged:(UITextField *)textField{
    NSString *filterText = kFilterString(textField.text, ^BOOL(NSString *aString) {
        return kMatchStringFormat(aString, kRegxDecimal);
    });
    textField.text = [super restrictMaxLength:filterText];
}

@end

@implementation SFJCharacterTextRestrict

- (void)textDidChanged:(UITextField *)textField{
    NSString *filterText = kFilterString(textField.text, ^BOOL(NSString *aString) {
        return kMatchStringFormat(aString, kRegxCharacter);
    });
    textField.text = [super restrictMaxLength:filterText];
}

@end
