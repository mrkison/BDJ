//
//  ZFSLoginRegisterViewController.m
//  BDJ
//
//  Created by 唯一 on 2018/12/27.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSLoginRegisterViewController.h"
#import "ZFSLogRegisterView.h"
#import "ZFSFastLoginView.h"
@interface ZFSLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *midView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadCons;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation ZFSLoginRegisterViewController
- (IBAction)close:(UIButton *)sender {
    //退出登陆注册界面
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickLoginRegister:(UIButton *)sender {
    //点击取反,登陆框和注册框切换
    sender.selected = !sender.selected;
    //用约束改变输入框位置并添加动画，达到切换效果
    _leadCons.constant = _leadCons.constant == 0 ? -self.midView.ZFS_width * 0.5 : 0;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    /*加载登陆和注册k输入框*/
    ZFSLogRegisterView *login = [ZFSLogRegisterView loginView];
    [self.midView addSubview:login];//登陆输入框xib
    ZFSLogRegisterView *registe = [ZFSLogRegisterView registerViwe];
    [self.midView addSubview:registe];//注册输入框xib
    ZFSFastLoginView *fastLoginView = [ZFSFastLoginView loadFastLonginView];
    [self.bottomView addSubview:fastLoginView];//快速登陆xib
}
/*
 屏幕适配:
 1.一个view从xib加载,需不需在重新固定尺寸 一定要在重新设置一下
 
 2.在viewDidLoad设置控件frame不好,开发中一般在viewDidLayoutSubviews布局子控件
 
 */
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //手动添加布局，防止适配出问题。
    ZFSLogRegisterView *loginV = self.midView.subviews[0];
    loginV.frame = CGRectMake(0, 0, self.midView.ZFS_width * 0.5, self.midView.ZFS_height);
    ZFSLogRegisterView *registerV = self.midView.subviews[1];
    registerV.frame = CGRectMake(self.midView.ZFS_width * 0.5, 0, self.midView.ZFS_width * 0.5, self.midView.ZFS_height);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
