//
//  CHMCars.m
//  carBrandsList
//
//  Created by  chenhanmao on 9/6/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import "CHMCars.h"

@implementation CHMCars

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        
        _icon = dict[@"icon"];
        _name = dict[@"name"];
    }
    return self;
}
+(instancetype)carsWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
