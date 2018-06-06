//
//  ViewController.m
//  ImgLocation
//
//  Created by Adam on 2018/6/6.
//  Copyright © 2018年 JDJ. All rights reserved.
//

#import "ViewController.h"
#import "LocationObject.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *locationArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1，初始化location Object数据；
    [self loadLocationData];
    
    // 2，显示背景图,加载标记点到图上；
    [self drawElements];
}

- (void)loadLocationData {
    
    _locationArray = [NSMutableArray arrayWithCapacity:10];
    
    NSMutableDictionary *dict0 = [NSMutableDictionary dictionary];
    [dict0 setValue:@"602.2606120434" forKey:@"pointx"];
    [dict0 setValue:@"543.5794669299" forKey:@"pointy"];
    [dict0 setValue:@"主卧" forKey:@"roomName"];
    
    LocationObject *locationObject0 = [[LocationObject alloc] initWithDict:dict0];
    [_locationArray addObject:locationObject0];
    
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setValue:@"347.4274432379" forKey:@"pointx"];
    [dict1 setValue:@"376.4363277394" forKey:@"pointy"];
    [dict1 setValue:@"客餐厅" forKey:@"roomName"];
    
    LocationObject *locationObject1 = [[LocationObject alloc] initWithDict:dict1];
    [_locationArray addObject:locationObject1];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setValue:@"602.2606120434" forKey:@"pointx"];
    [dict2 setValue:@"156.2922013829" forKey:@"pointy"];
    [dict2 setValue:@"次卧" forKey:@"roomName"];
    
    LocationObject *locationObject2 = [[LocationObject alloc] initWithDict:dict2];
    [_locationArray addObject:locationObject2];
}

- (void)drawElements {

    CGFloat offsetX = 10;
    CGFloat offsetY = 50;
    CGFloat pWH = 800.0;
    
    CGFloat showWH = SCREEN_WIDTH - 2*offsetX;
    CGFloat scale = showWH/pWH;
    NSLog(@"scale is %@", [NSString stringWithFormat:@"%f", scale]);
    
    // 显示背景图
    CGRect frame = CGRectMake(offsetX, offsetY, showWH, showWH);
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    imgView.image = [UIImage imageNamed:@"huxing.png"];
    imgView.userInteractionEnabled = YES;
    [self.view addSubview:imgView];
    self.view.backgroundColor = [UIColor blackColor];
    
    // 加载标记点到图上
    NSInteger count = [_locationArray count];
    CGFloat pointWH = 30;
    
    for (NSInteger i=0; i<count; i++) {
        
        LocationObject *locationObject = _locationArray[i];
        CGRect pointFrame = CGRectMake(locationObject.pointX * scale - pointWH/2, locationObject.pointY * scale - pointWH/2, pointWH, pointWH);
        
        UIButton *pointBtn =  [[UIButton alloc] initWithFrame:pointFrame];
        pointBtn.userInteractionEnabled = YES;
        pointBtn.tag = i;

        pointBtn.backgroundColor = [UIColor grayColor];
        pointBtn.layer.cornerRadius = pointWH/2;
        pointBtn.layer.masksToBounds = YES;
        [pointBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [imgView addSubview:pointBtn];
    }
}

- (void)clickBtn:(id)sender {
    
    NSInteger i = ((UIButton *)sender).tag;
    
    LocationObject *locationObject = _locationArray[i];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:locationObject.name
                          
                                                   message:@""
                          
                                                  delegate:self
                          
                                         cancelButtonTitle:@"取消"
                          
                                         otherButtonTitles:@"打开", nil];
    
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
