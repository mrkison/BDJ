//
//  ZFSNewViewController.m
//  BDJ
//
//  Created by 唯一 on 2018/12/6.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSNewViewController.h"
#import "ZFSSubTagTableViewController.h"
@interface ZFSNewViewController ()

@end

@implementation ZFSNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavBar];
}
#pragma mark - 设置导航条
- (void) setUpNavBar{
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highlightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(tagclick)];
    //tittleView
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
}
- (void)tagclick{
    ZFSSubTagTableViewController *subTagTableViewController = [[ZFSSubTagTableViewController alloc] init];
    [self.navigationController pushViewController:subTagTableViewController animated:YES];
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
