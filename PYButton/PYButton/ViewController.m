//
//  ViewController.m
//  PYButton
//
//  Created by Apple on 16/8/23.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "JHButton.h"
#import "UIButton+LXMImagePosition.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *SBButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //方法二 系统的方法
   
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(10, 450, self.view.frame.size.width - 20, 30);

    //图片60*60像素 2X图 上 左 下 右
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, (self.view.frame.size.width - 20) - 30);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -(self.view.frame.size.width - 20) / 2 - 60, 0, 0);
    [button setImage:[UIImage imageNamed:@"1"] forState:(UIControlStateNormal)];
    [button setTitle:@"12311" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    button.titleLabel.backgroundColor = [UIColor cyanColor];
//    button.backgroundColor = [UIColor cyanColor];

//    [button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    
    
   //方法二  封装
 JHButton *button_1 = [JHButton buttonWithType:(UIButtonTypeCustom) frame:CGRectMake(100, 100, 80, 100) title:@"12345" titleColor:[UIColor cyanColor] titleFont:15 textAlignment:NSTextAlignmentCenter image:[UIImage imageNamed:@"1"] imageViewContentMode:UIViewContentModeCenter handler:^(UIButton *sender) {
     //点击事件
     NSLog(@"1");
 }];
    button_1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:button_1];
    
    
    //方法三  SB
    //图片是60*60的2x的图
    CGFloat imageWidth = 40;
    CGFloat imageHeight = 40;
    CGFloat labelWidth = [self.SBButton.titleLabel.text sizeWithFont:self.SBButton.titleLabel.font].width;
    CGFloat labelHeight = [self.SBButton.titleLabel.text sizeWithFont:self.SBButton.titleLabel.font].height;
    
    CGFloat spacing = 10;
    
    //image在上，文字在下
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    self.SBButton.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
    self.SBButton.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
