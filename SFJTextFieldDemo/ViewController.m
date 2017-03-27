//
//  ViewController.m
//  SFJTextFieldDemo
//
//  Created by 沙缚柩 on 2017/3/24.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "ViewController.h"
#import "SFJTextField.h"
#import "SFJEmojiTextRestrict.h"
#import "UITextField+SFJKeyBoardAdjust.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet SFJTextField *textf1;
@property (weak, nonatomic) IBOutlet SFJTextField *textf2;
@property (weak, nonatomic) IBOutlet SFJTextField *textf3;
@property (weak, nonatomic) IBOutlet SFJTextField *textf4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _textf1.restrictType = SFJRestrictTypeOnlyNumber;
    _textf1.placeholder = @"只能输入数字";
    _textf1.maxTextLength = 6;
    _textf1.delegate = self;
    
    _textf2.restrictType = SFJRestrictTypeOnlyDecimal;
    _textf2.placeholder = @"只能输入数字和小数点";
    _textf2.maxTextLength = 8;
    _textf2.delegate = self;
    
    
    _textf3.restrictType = SFJRestrictTypeOnlyCharacter;
    _textf3.placeholder = @"只能输入非中文";
    _textf3.maxTextLength = 10;
    _textf3.delegate = self;
    
    _textf4.textRestrict = [[SFJEmojiTextRestrict alloc] init];
    _textf4.placeholder = @"只能输入emoji";
    _textf4.delegate = self;
    [_textf4 setAutoAdjust:YES];
    
}

- (BOOL)textFieldShouldReturn: (UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
