//
//  ZFSFastButtom.m
//  BDJ
//
//  Created by 唯一 on 2019/1/2.
//  Copyright © 2019 com.ios. All rights reserved.
//

#import "ZFSFastButtom.h"

@implementation ZFSFastButtom
- (void)layoutSubviews{
    [super layoutSubviews];
    //计算图片位置
    self.imageView.ZFS_y = 0;
    self.imageView.ZFS_centerX = self.ZFS_width * 0.5;
    //计算标题位置
    self.titleLabel.ZFS_y = self.ZFS_height - self.titleLabel.ZFS_height;
    //标题大小自适应于文字
    [self.titleLabel sizeToFit];
    self.titleLabel.ZFS_centerX =self.ZFS_width * 0.5;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
