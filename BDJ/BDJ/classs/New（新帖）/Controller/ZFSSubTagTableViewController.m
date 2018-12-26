//
//  ZFSTableViewController.m
//  BDJ
//
//  Created by 唯一 on 2018/12/19.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSSubTagTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "ZFSSubTagItem.h"
#import <MJExtension/MJExtension.h>
#import "ZFSSubTagTableViewCell.h"
#import <SVProgressHUD.h>

static NSString * const ID = @"cell";
@interface ZFSSubTagTableViewController ()
@property (strong , nonatomic) NSArray *subItem;
@property (weak , nonatomic)AFHTTPSessionManager *mgr;
@end

@implementation ZFSSubTagTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 展示标签数据 -> 请求数据(接口文档) -> 解析数据(写成Plist)(image_list,sub_number,theme_name) -> 设计模型 -> 字典转模型 -> 展示数据
    //加载数据
    [self laodData];
    //注册cell
//    [self.tableView registerNib:[UINib nibWithNibName:@"ZFSSubTagTableViewCell" bundle:nil] forHeaderFooterViewReuseIdentifier:ID];//这是错的
    [self.tableView registerNib:[UINib nibWithNibName:@"ZFSSubTagTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    self.title = @"推荐";
    //处理tableview的cell分割线,左边不留缝隙（占据全屏）。
//    self.tableView.separatorInset = UIEdgeInsetsZero;//第一种设置分割线方法
    // 处理cell分割线 1.自定义分割线 2.系统属性(iOS8才支持) 3.万能方式(重写cell的setFrame) 了解tableView底层实现了解 1.取消系统自带分割线 2.把tableView背景色设置为分割线的背景色 3.重写setFrame
    /*万能设置分割线*/
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 220 220 221
    self.tableView.backgroundColor = ZFSColor(220, 220, 221);
    // 提示用户当前正在加载数据 SVPro
    [SVProgressHUD showWithStatus:@"正在加载ing....."];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    /*网速慢时未加载完点返回时去除加载图像，取消数据请求*/
    // 销毁指示器
    [SVProgressHUD dismiss];
    // 取消之前的请求
    [_mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
}
- (void) laodData{
    //1.创建请求会话者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    _mgr = mgr;
    //2.设置参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    //3.请求
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [responseObject writeToFile:@"/Users/weiyi/Desktop/xcode练手/BDJ-plist/sub.plist" atomically:YES];
        //移除加载动画
        [SVProgressHUD dismiss];
        //字典转模型
        _subItem = [ZFSSubTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        // 刷新表格
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        //移除加载动画
        [SVProgressHUD dismiss];
    }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    //模型数据个数
    return self.subItem.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    //必须注册cell
//    static NSString *ID = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 注意:如果cell从xib加载,一定要记得绑定标示符
    // 注册cell
    //    if (cell == nil) {
    //        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass( [XMGSubTagCell class]) owner:nil options:nil][0];
    //    }
    
    //自定义cell
    ZFSSubTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 获取模型
    ZFSSubTagItem *item = self.subItem[indexPath.row];
    cell.item = item;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
