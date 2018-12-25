//
//  UIBarButtonItem+Item.h
//  BDJ
//
//  Created by 唯一 on 2018/12/11.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Item)
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(nullable id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage target:(nullable id)target action:(SEL)action;
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage target:(nullable id)target action:(SEL)action title:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
