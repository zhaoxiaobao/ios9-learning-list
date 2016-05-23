//
//  personModel.h
//  bishi
//
//  Created by zhaoyuan on 16/4/11.
//  Copyright © 2016年 赵远. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface personModel : NSObject

@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *nameSX;
@property(nonatomic,strong)NSString *company;
@property(nonatomic,strong)NSString *phone;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,strong)NSString *url;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
