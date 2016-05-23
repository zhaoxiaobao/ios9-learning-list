//
//  personModel.m
//  bishi
//
//  Created by zhaoyuan on 16/4/11.
//  Copyright © 2016年 赵远. All rights reserved.
//

#import "personModel.h"

@implementation personModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        self.ID=dict[@"id"];
        self.name=dict[@"name"];
        self.phone=dict[@"phone"];
        self.nameSX=dict[@"nameSX"];
        self.sex=dict[@"sex"];
        self.company=dict[@"company"];
        self.url=dict[@"url"];
    }
    return self;
}

@end
