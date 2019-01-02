//
//  ZFSLogRegisterView.m
//  BDJ
//
//  Created by 唯一 on 2018/12/28.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSLogRegisterView.h"
@interface ZFSLogRegisterView()
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterbuttom;
@end
@implementation ZFSLogRegisterView
/*快速创建注册xib*/
+ (instancetype) loginView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}
+ (instancetype) registerViwe{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];

}
- (void)awakeFromNib{
//    [super awakeFromNib];
    /*设置登陆注册按钮背景图片不拉伸*/
    UIImage *loginImage= _loginRegisterbuttom.currentBackgroundImage;
    loginImage = [loginImage stretchableImageWithLeftCapWidth:loginImage.size.width * 0.5 topCapHeight:loginImage.size.height * 0.5];
    [_loginRegisterbuttom setBackgroundImage:loginImage forState:UIControlStateNormal];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
