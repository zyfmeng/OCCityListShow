//
//  CitySelectViewController.h
//  CityListDemo
//
//  Created by md on 16/6/6.
//  Copyright © 2016年 HKQ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^CityBlock)(NSString *cityName);//block

@interface CitySelectViewController : UIViewController

@property (nonatomic, copy) CityBlock cityBlock;//block对象

@end
