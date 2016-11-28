//
//  UIViewController+ZgyExtension.m
//  BSBDJ-ZGY
//
//  Created by jiemo on 16/11/25.
//  Copyright © 2016年 张高远. All rights reserved.
//

#import "UIViewController+ZgyExtension.h"

@implementation UIViewController (ZgyExtension)

+ (instancetype)StoryboradInstanceWithMain:(NSString *)storyboradName{
    if ([self isEmpty:storyboradName]) {
        storyboradName = @"Main";
    }
    UIStoryboard *storyborad = [UIStoryboard storyboardWithName:storyboradName bundle:nil];
    return [storyborad instantiateViewControllerWithIdentifier:NSStringFromClass(self)];
}


+(BOOL)isEmpty:(NSString *)str {
    
    if (!str) {
        return YES;
    } else {
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return YES;
        } else {
            return NO;
        }
    }
}
/*
 class HomeViewController: UIViewController {
 static func storyboardInstance() -> HomeViewController? {
 let storyboard = UIStoryboard(name: String.className(self),
 bundle: nil) return
 storyboard.instantiateInitialViewController() as?
 HomeViewController
 }
 }
 
 class LoginView: UIView {
 
 static func nibInstance() -> LoginView? {
 if let loginView =
 Bundle.mainBundle.loadNibNamed(String.className(self),
 owner: nil, options: nil)?.first as?
 LoginView {
 return loginView
 }
 return nil
 }
 }
 xib的方法
 
 swift中的方法
 */
@end
