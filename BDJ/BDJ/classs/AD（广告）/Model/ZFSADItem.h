//
//  ZFSADItem.h
//  BDJ
//
//  Created by 唯一 on 2018/12/17.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFSADItem : NSObject
/** 广告地址 */
@property (nonatomic, strong) NSString *w_picurl;
/** 点击广告跳转的界面 */
@property (nonatomic, strong) NSString *ori_curl;

@property (nonatomic, assign) CGFloat w;

@property (nonatomic, assign) CGFloat h;
@end

NS_ASSUME_NONNULL_END
