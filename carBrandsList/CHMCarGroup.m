//
//  CHMCarGroup.m
//  carBrandsList
//
//  Created by  chenhanmao on 9/6/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "CHMCarGroup.h"

@implementation CHMCarGroup
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        _cars = dict[@"cars"];
        _title = dict[@"title"];
        
//        将cars中的字典转为模型
        NSMutableArray *carsM = [NSMutableArray array];
        for (NSDictionary *dict in _cars) {
            
            CHMCars *car = [CHMCars carsWithDict:dict];
            [carsM addObject:car];
        }
        
        _cars = carsM;
        
    }
    return self;
}
+(instancetype)carGroupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
