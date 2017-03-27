//
//  SFJTextField.m
//  SFJTextFieldDemo
//
//  Created by 沙缚柩 on 2017/3/24.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJTextField.h"
#import "UITextField+SFJKeyBoardAdjust.h"

@implementation SFJTextField

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_commentInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self p_commentInit];
    }
    return self;
}

- (void)p_commentInit{
    self.maxTextLength = NSUIntegerMax;
}

- (void)setRestrictType:(SFJRestrictType)restrictType{
    _restrictType = restrictType;
    self.textRestrict = [SFJTextRestrict textRestrictWithRestrictType: restrictType];
}

- (void)setTextRestrict: (SFJTextRestrict *)textRestrict
{
    if (_textRestrict) {
        [self removeTarget: _textRestrict action: @selector(textDidChanged:) forControlEvents: UIControlEventEditingChanged];
    }
    textRestrict.maxLength = self.maxTextLength;
    [self addTarget: textRestrict action: @selector(textDidChanged:) forControlEvents: UIControlEventEditingChanged];
    _textRestrict = textRestrict;
}

- (void)setMaxTextLength: (NSUInteger)maxTextLength
{
    _maxTextLength = maxTextLength;
    if (maxTextLength == 0) {
        _maxTextLength = NSUIntegerMax;
    }
    
    if (self.textRestrict) {
        [self setTextRestrict:self.textRestrict];
    }
}

@end
