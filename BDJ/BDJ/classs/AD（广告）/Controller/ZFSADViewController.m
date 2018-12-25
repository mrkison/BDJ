//
//  ZFSViewController.m
//  BDJ
//
//  Created by 唯一 on 2018/12/15.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSADViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <UIImageView+WebCache.h>
#import "ZFSADItem.h"
#import "ZFSTabBarController.h"
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"
@interface ZFSADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *adcontainView;
@property (weak, nonatomic) UIImageView *adImageView;
@property (strong,nonatomic) ZFSADItem *item;
@property (nonatomic, weak) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *jumpbtn;

@end

@implementation ZFSADViewController
//添加跳过按钮点击事件
- (IBAction)clickjump:(id)sender {
    //创建控制器
    ZFSTabBarController *tabBarContoller = [[ZFSTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarContoller;
    //销毁j定时器
    [_timer invalidate];
}
//懒加载广告ImageView
- (UIImageView *)adImageView{
    if (_adImageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.adcontainView addSubview:imageView];
        //添加tap（点击）手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [imageView addGestureRecognizer:tap];
        //允许用户交互（图片默认不允许交互）
        imageView.userInteractionEnabled = YES;
        _adImageView = imageView;
    }
    return _adImageView;
}
//广告页面点击跳转到safari打开
- (void) tap{
    NSURL *url = [NSURL URLWithString:_item.ori_curl];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建启动图片
    [self setUpLaunchImage];
    // 加载广告数据 => 拿到活时间 => 服务器 => 查看接口文档 1.判断接口对不对 2.解析数据(w_picurl,ori_curl:跳转到广告界面,w,h) => 请求数据(AFN)
    //加载启动图片数据
    [self loadData];
    //添加定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timechange) userInfo:nil repeats:YES];
}
- (void) timechange{
    static int i = 3;
    //广告3秒倒计时完后
    if (i == 0) {
       //直接调用条转按钮
        [self clickjump:nil];
    }
    i--;
    [_jumpbtn setTitle:[NSString stringWithFormat:@"跳过（%d）",i] forState:UIControlStateNormal];
}
//设置不同屏幕启动图片
- (void) setUpLaunchImage{
    if (iphone6P) { // 6p
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iphone6) { // 6
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iphone5) { // 5
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-568h"];
        
    } else if (iphone4) { // 4
        
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700"];
    }
}
/*
 1.以后添加东西.首先想到加多少次
 */
#pragma mark -取广告数据
- (void) loadData{
    //创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    //发送请求
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        ZFSLog(@"%@",responseObject);
        [responseObject writeToFile:@"/Users/weiyi/Desktop/xcode练手/ad.plist" atomically:YES];
        // 请求数据 -> 解析数据(写成plist文件) -> 设计模型 -> 字典转模型 -> 展示数据
        // 获取字典
        NSDictionary *adDict = [responseObject[@"ad"]lastObject];
        //字典转模型
        _item = [ZFSADItem mj_objectWithKeyValues:adDict];
        //创建图片视图并设置frame
        CGFloat adImageViewH = ZFSScreenW / _item.w * _item.h;
        self.adImageView.frame = CGRectMake(0, 0, ZFSScreenW, adImageViewH);
        //加载网络图片
       [self.adImageView sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
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
