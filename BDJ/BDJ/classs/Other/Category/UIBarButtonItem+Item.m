//
//  UIBarButtonItem+Item.m
//  BDJ
//
//  Created by 唯一 on 2018/12/11.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *contentView = [[UIView alloc]initWithFrame:btn.bounds];
    [contentView addSubview:btn];
   return [[UIBarButtonItem alloc]initWithCustomView:contentView];
    
}
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(nullable id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *contentView = [[UIView alloc]initWithFrame:btn.bounds];
    [contentView addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:contentView];
    
}
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(nullable id)target action:(SEL)action title:(NSString *)title{
    UIButton *backButton = [[UIButton alloc]init];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:highlightImage forState:UIControlStateHighlighted];
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:backButton];
}
@end
