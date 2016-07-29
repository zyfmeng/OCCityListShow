//
//  ViewController.m
//  CityListDemo
//
//  Created by md on 16/6/1.
//  Copyright © 2016年 HKQ. All rights reserved.
//

#import "MainViewController.h"
#import "CitySelectViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"f_navtop"] forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self showCity:@"城市"];
}
#pragma mark - 城市
- (void)showCity:(NSString *)cityname
{
    //实现富文本
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:cityname attributes:nil];
    //进行图文混排
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
    textAttachment.image = [UIImage imageNamed:@"f_flagdown02@2x"];
    textAttachment.bounds = CGRectMake(0, 0, 12,10);
    NSAttributedString * textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment ];
    //判断选择的城市名称长度是否大于5个字符的长度，如果大于五个字符就取前四个字符，然后再在最后添加一个图标
    if (string.length >= 5) {
        //去前四个字符
        NSAttributedString *str = [string attributedSubstringFromRange:NSMakeRange(0, 4)];
        //将NSAttributedString类型转换成NSString类型
        NSString *cityString = [str string];
        string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@...",cityString] attributes:nil];
    }
    //在城市名称后插入图片
    [string insertAttributedString:textAttachmentString atIndex:string.length];
    //自定义按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0, 0, 70, 30);
    [btn addTarget:self action:@selector(navBtnCLick) forControlEvents:UIControlEventTouchUpInside];
    UILabel *lbText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, btn.frame.size.width+50, btn.frame.size.height)];
    lbText.attributedText = string;
    lbText.textColor = [UIColor whiteColor];
    lbText.font = [UIFont systemFontOfSize:15];
    [btn addSubview:lbText];
    btn.backgroundColor = [UIColor clearColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

- (void)navBtnCLick
{
    CitySelectViewController *citySelectVC = [[CitySelectViewController alloc] init];
    //block传过来的值
    citySelectVC.cityBlock = ^(NSString *str){
        NSLog(@"城市 ＝ %@",str);
        [self showCity:str];
    };
    citySelectVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:citySelectVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
