//
//  ZFSTabBar.m
//  BDJ
//
//  Created by 唯一 on 2018/12/9.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSTabBar.h"
#import "UIView+Frame.h"
@interface ZFSTabBar()

@property (nonatomic,weak) UIButton *plusButton;

@end

@implementation ZFSTabBar
//懒加载➕按钮
- (UIButton *) plusButton{
    if (_plusButton == nil) {
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [plusButton sizeToFit];
        //一定要调addSubview：应为plusButton是weak
        [self addSubview:plusButton];
        _plusButton = plusButton;
    }
    return _plusButton;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    //遍历tabBarButton设置他们在tabBar上的位置
    NSInteger count = self.items.count;
    CGFloat x = 0;
    CGFloat btnW = self.ZFS_width / (count+1);
    CGFloat btnH =self.ZFS_height;
    int i = 0;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i==2) {
                i +=1;
            }
            x = btnW * i;
            i++;
            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
        }
      
    }
    //不能用self.center
    self.plusButton.center = CGPointMake(self.ZFS_width * 0.5, self.ZFS_height * 0.5);
}
@end
