//
//  ZFSTabBarController.m
//  BDJ
//
//  Created by 唯一 on 2018/12/6.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSTabBarController.h"
#import "ZFSFriendTrendViewController.h"
#import "ZFSNewViewController.h"
#import "ZFSMeTableViewController.h"
#import "ZFSPublishViewController.h"
#import "ZFSEssenceViewController.h"
#import "ZFSTabBarController.h"
#import "ZFSTabBar.h"
#import "ZFSNavigationController.h"
#import "UIImage+Image.h"
@interface ZFSTabBarController ()

@end

@implementation ZFSTabBarController
+ (void)load
{
    UITabBarItem *item = [UITabBarItem appearance];
    //设置tabBar字颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    //设置字体大小：只能在normal才有效
    NSMutableDictionary *attrsFont = [NSMutableDictionary dictionary];
    attrsFont[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsFont forState:UIControlStateNormal];
}
#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建子控制器
    [self setupAllChildViewController];
    //设置tabBar按钮
    [self setupAllTitleButton];
    //创建自定义的TabBar
    [self setUpTabBar];
}
#pragma mark - 添加所有子控制器
- (void)setupAllChildViewController
{
    //精华
    ZFSEssenceViewController *essenceVc = [[ZFSEssenceViewController alloc]init];
     ZFSNavigationController *nav3 = [[ZFSNavigationController alloc]initWithRootViewController:essenceVc];
    [self addChildViewController:nav3];
    //新帖
    ZFSNewViewController *newVc = [[ZFSNewViewController alloc]init];
    ZFSNavigationController *nav = [[ZFSNavigationController alloc]initWithRootViewController:newVc];
    [self addChildViewController:nav];
//    //发布
//    ZFSPublishViewController *publishVc = [[ZFSPublishViewController alloc]init];
//    [self addChildViewController:publishVc];
    //关注
    ZFSFriendTrendViewController *friendTrendVc = [[ZFSFriendTrendViewController alloc]init];
    ZFSNavigationController *nav1 = [[ZFSNavigationController alloc]initWithRootViewController:friendTrendVc];
    [self addChildViewController:nav1];
    //我
//    UITableViewController *tb = [[UITableViewController alloc] init];
//    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:tb];
//    [self addChildViewController:nav2];
    ZFSMeTableViewController *meVc = [[ZFSMeTableViewController alloc]init];
    ZFSNavigationController *nav2 = [[ZFSNavigationController alloc]initWithRootViewController:meVc];
    [self addChildViewController:nav2];
}
- (void)setupAllTitleButton
{
    //1.精华
    UINavigationController *nav = self.childViewControllers[0];
    nav.tabBarItem.title = @"精华";
    nav.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    nav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    //新帖
    UINavigationController *nav1 = self.childViewControllers[1];
    nav1.tabBarItem.title = @"新帖";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    nav1.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
//    //发布：不同于其他的控制器
//    ZFSPublishViewController *publish = self.childViewControllers[2];
//    publish.tabBarItem.image = [UIImage imageNamed:@"tabBar_publish_icon"];
//    publish.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_publish_click_icon"];
    //关注
    UINavigationController *nav2 = self.childViewControllers[2];
    nav2.tabBarItem.title = @"关注";
    nav2.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    nav2.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];
    //我
    UINavigationController *nav3 = self.childViewControllers[3];
    nav3.tabBarItem.title = @"我";
    nav3.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    nav3.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_me_click_icon"];
}

- (void) setUpTabBar
{
    
    ZFSTabBar *tabBar = [[ZFSTabBar alloc] init];
    //系统tabBar是只读，用kvc
    [self setValue:tabBar forKey:@"tabBar"];
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
