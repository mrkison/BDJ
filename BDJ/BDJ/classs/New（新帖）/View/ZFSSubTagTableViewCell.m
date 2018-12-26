//
//  ZFSSubTagTableViewCell.m
//  BDJ
//
//  Created by 唯一 on 2018/12/20.
//  Copyright © 2018 com.ios. All rights reserved.
//

#import "ZFSSubTagTableViewCell.h"
#import "ZFSSubTagItem.h"
#import <UIImageView+WebCache.h>

@interface ZFSSubTagTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *numView;
@end

@implementation ZFSSubTagTableViewCell
#pragma - mark 空出分割线位置
- (void)setFrame:(CGRect)frame{
    frame.size.height -= 1;
    [super setFrame:frame];
}
#pragma - mark 把数据赋值给cell
-(void)setItem:(ZFSSubTagItem *)item{
    _item = item;
    /*
     设置内容，数据加入cell
     */
    _nameView.text = item.theme_name;
    //判断订阅数大于10000
    [self processNum];
   
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}
#pragma - 处理订阅数大于10000时
- (void) processNum{
    NSString *subNum = [NSString stringWithFormat:@"%@人订阅",_item.sub_number];
    NSInteger num = _item.sub_number.integerValue;
    if (num > 10000) {
        CGFloat numF = num / 10000.0;
        subNum = [NSString stringWithFormat:@"%.1f万人订阅",numF];
        [subNum stringByReplacingOccurrencesOfString:@".0" withString:@""];
         _numView.text = subNum;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    //设置头像图片圆角
    _iconImage.layer.cornerRadius = 30;
    _iconImage.layer.masksToBounds = YES;
    //
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
