//
//  LocationObject.m
//  ImgLocation
//
//  Created by Adam on 2018/6/6.
//  Copyright © 2018年 JDJ. All rights reserved.
//

#import "LocationObject.h"

@implementation LocationObject

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.name = dict[@"roomName"];

        self.pointX = [dict[@"pointx"] floatValue];
        self.pointY = [dict[@"pointy"] floatValue];
    }
    return self;
}

@end
