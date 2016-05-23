//
//  TableViewCell.h
//  bishi
//
//  Created by zhaoyuan on 16/4/11.
//  Copyright © 2016年 赵远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "personModel.h"


@interface TableViewCell : UITableViewCell


@property(nonatomic,strong)UIImageView *imgViewL;
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UILabel *slabel;
@property(nonatomic,strong)personModel *model;

@end
