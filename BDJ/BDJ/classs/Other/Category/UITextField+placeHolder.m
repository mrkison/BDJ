//
//  UITextField+placeHolder.m
//  BDJ
//
//  Created by 唯一 on 2019/1/3.
//  Copyright © 2019 com.ios. All rights reserved.
//

#import "UITextField+placeHolder.h"

@implementation UITextField (placeHolder)
#pragma mark - 设置占位符颜色
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    UILabel *placehoderLab = [self valueForKey:@"placeholderLabel"];
    placehoderLab.textColor = placeholderColor;
}
- (UIColor *)placeholderColor{
    return nil;
}
@end

