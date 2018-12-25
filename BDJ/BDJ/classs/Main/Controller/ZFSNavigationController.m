//
//  ZFSNavigationController.m
//  BDJ
//
//  Created by 唯一 on 2018/12/11.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSNavigationController.h"

@interface ZFSNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation ZFSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     实现全屏手势
     */
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget: self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    //控制手势什么时候触发,只有非根控制器才需要触发手势
    pan.delegate = self;
    //添加手势
    [self.view addGestureRecognizer:pan];
    //控制手势什么时候触发
    self.interactivePopGestureRecognizer.delegate = self;
}
+ (void)load
{
    //那全局UINavigationBar
UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    // 只要是通过模型设置,都是通过富文本设置
    // 设置导航条标题 => UINavigationBar
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attrs];
    // 设置导航条背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        //push后隐藏底部tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        //设置navigationbar左按钮
     viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] highlightImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];
    }
    [super pushViewController:viewController animated:YES];
}
- (void) back{
    [self popViewControllerAnimated:YES];
}
//决定手势是否触发
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return self.childViewControllers.count > 0;
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
