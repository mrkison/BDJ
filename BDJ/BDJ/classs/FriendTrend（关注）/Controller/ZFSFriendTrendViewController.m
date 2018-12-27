//
//  ZFSFriendTrendViewController.m
//  BDJ
//
//  Created by 唯一 on 2018/12/6.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSFriendTrendViewController.h"
#import "ZFSLoginRegisterViewController.h"
@interface ZFSFriendTrendViewController ()

@end

@implementation ZFSFriendTrendViewController
//复杂点的xib步骤：// 1.划分结构(顶部 中间 底部) // 2.一个结构一个结构搭建（占位视图思想）
/*监听点击登录按钮*/
- (IBAction)clickLoginRegister:(id)sender {
    //moda出登陆界面
    ZFSLoginRegisterViewController *logRegister = [[ZFSLoginRegisterViewController alloc] init];
    [self presentViewController:logRegister animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
}
- (void)setupNavBar
{
    // 左边按钮
    // 把UIButton包装成UIBarButtonItem.就导致按钮点击区域扩大
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] highlightImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(friendsRecomment)];
    
    // titleView
    self.navigationItem.title = @"我的关注";
    
}

// 推荐关注
- (void)friendsRecomment
{
    
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
