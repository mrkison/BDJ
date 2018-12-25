//
//  ZFSEssenceViewController.m
//  BDJ
//
//  Created by 唯一 on 2018/12/6.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSEssenceViewController.h"

@interface ZFSEssenceViewController ()

@end

@implementation ZFSEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
}
#pragma mark - 设置导航条
- (void) setUpNavBar{
    //右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] highlightImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(game)];
    //tittleView
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] highlightImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
}

-(void) game{
    ZFSLog(@"1");
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
