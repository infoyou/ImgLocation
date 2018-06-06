//
//  LocationObject.h
//  ImgLocation
//
//  Created by Adam on 2018/6/6.
//  Copyright © 2018年 JDJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LocationObject : NSObject

@property (nonatomic, assign) CGFloat pointX;
@property (nonatomic, assign) CGFloat pointY;

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
