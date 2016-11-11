//
//  RegistLoginTextField.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/11.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "RegistLoginTextField.h"
#import "UITextField+ZgyExtension.h"

@implementation RegistLoginTextField

- (instancetype)init{
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.textColor = [UIColor whiteColor];
    self.tintColor = [UIColor whiteColor];
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addTarget:self action:@selector(editingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
}
-(void)editingDidBegin
{
    self.placeholderColor = [UIColor whiteColor];
}
-(void)editingDidEnd
{
    self.placeholderColor = [UIColor grayColor];
}
@end
