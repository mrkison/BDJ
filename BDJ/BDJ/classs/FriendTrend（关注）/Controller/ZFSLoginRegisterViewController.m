//
//  ZFSLoginRegisterViewController.m
//  BDJ
//
//  Created by 唯一 on 2018/12/27.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSLoginRegisterViewController.h"

@interface ZFSLoginRegisterViewController ()

@end

@implementation ZFSLoginRegisterViewController
- (IBAction)close:(UIButton *)sender {
    //退出界面
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickLoginRegister:(UIButton *)sender {
    //点击取反
    sender.selected = !sender.selected;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
