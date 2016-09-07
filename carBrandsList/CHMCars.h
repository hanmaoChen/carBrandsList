//
//  CHMCars.h
//  carBrandsList
//
//  Created by  chenhanmao on 9/6/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHMCars : NSObject

@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *name;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carsWithDict:(NSDictionary *)dict;
@end
