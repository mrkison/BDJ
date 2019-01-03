//
//  ZFSTextField.m
//  BDJ
//
//  Created by 唯一 on 2019/1/3.
//  Copyright © 2019 com.ios. All rights reserved.
//

#import "ZFSTextField.h"
#import "UITextField+placeHolder.h"
@implementation ZFSTextField
- (void)awakeFromNib{
//    [super awakeFromNib];
    //思想： 监听文本框编辑: 1.代理 2.通知 3.target
    // 原则:不要自己成为自己代理，通知一对多
    self.tintColor = [UIColor whiteColor];
    // 思想：快速设置占位文字颜色 => 文本框占位文字可能是label => 验证占位文字是label => 拿到label => 查看label属性名(1.runtime 2.断点)
    self.placeholderColor = [UIColor grayColor];
    //开始编辑时设置TextField占位符颜色
    [self addTarget:self action:@selector(editBegin) forControlEvents:UIControlEventEditingDidBegin];
    //结束编辑时还原TextField占位符颜色
    [self addTarget:self action:@selector(editEnd) forControlEvents:UIControlEventEditingDidEnd];
}
- (void)editBegin{
    // 设置占位文字颜色变成白色****正常修改placeholder颜色方法
    //    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    //    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attrs];
    self.placeholderColor = [UIColor whiteColor];
}
- (void)editEnd{
    self.placeholderColor = [UIColor grayColor];
    //    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    //    placeholderLabel.textColor = [UIColor redColor];
    //    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    //    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    //    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attrs];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
