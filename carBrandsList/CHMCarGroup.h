//
//  CHMCarGroup.h
//  carBrandsList
//
//  Created by  chenhanmao on 9/6/16.
//  Copyright © 2016  chenhanmao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHMCars.h"
@interface CHMCarGroup : NSObject

@property(nonatomic,strong)NSArray *cars;
@property(nonatomic,strong)NSString *title;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carGroupWithDict:(NSDictionary *)dict;


@end
