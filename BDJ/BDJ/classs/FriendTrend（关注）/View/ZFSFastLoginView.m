//
//  ZFSFastLoginView.m
//  BDJ
//
//  Created by 唯一 on 2019/1/2.
//  Copyright © 2019 com.ios. All rights reserved.
//

#import "ZFSFastLoginView.h"

@implementation ZFSFastLoginView
+ (instancetype)loadFastLonginView{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
