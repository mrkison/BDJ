//
//  UIView+Frame.m
//  BDJ
//
//  Created by 唯一 on 2018/12/10.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
/*
 设置x
 */
- (void)setZFS_x:(CGFloat)ZFS_x{
   CGRect rect = self.frame;
    rect.origin.x = ZFS_x;
    self.frame = rect;
}
- (CGFloat)ZFS_x{
    return self.frame.origin.x;
}
/*
 设置y
 */
- (void)setZFS_y:(CGFloat)ZFS_y{
    CGRect rect = self.frame;
    rect.origin.y = ZFS_y;
    self.frame = rect;
}
- (CGFloat)ZFS_y{
    return self.frame.origin.y;
}
/*
 设置width
 */
- (void)setZFS_width:(CGFloat)ZFS_width{
    CGRect rect = self.frame;
    rect.size.width = ZFS_width;
    self.frame = rect;
}
-(CGFloat)ZFS_width{
    return self.frame.size.width;
}

/*
 设置height
 */
- (void)setZFS_height:(CGFloat)ZFS_height{
    CGRect rect = self.frame;
    rect.size.height = ZFS_height;
    self.frame = rect;
}
- (CGFloat)ZFS_height{
    return self.frame.size.height;
}
- (void)setZFS_centerX:(CGFloat)ZFS_centerX{
    CGPoint center = self.center;
    center.x = ZFS_centerX;
    self.center = center;
}
- (CGFloat)ZFS_centerX{
    return self.center.x;
}
- (void)setZFS_centerY:(CGFloat)ZFS_centerY{
    CGPoint center = self.center;
    center.y = ZFS_centerY;
    self.center = center;
}
- (CGFloat)ZFS_centerY{
    return self.center.y;
}
@end
