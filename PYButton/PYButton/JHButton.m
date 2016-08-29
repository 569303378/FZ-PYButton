//
//  JHButton.m
//  PYButton
//
//  Created by Apple on 16/8/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "JHButton.h"

//title所占的conentView的比例
#define kTitleRatio 0.2

@implementation JHButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType frame:       (CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment  image:(UIImage *)image imageViewContentMode:(UIViewContentMode)imageViewContentMode handler:(tapHandler)handler {
    
    //button的类型
    JHButton *button = [super buttonWithType:buttonType];
    //button的frame
    button.frame = frame;
    //文字居中
    button.titleLabel.textAlignment = textAlignment;
    //文字大小
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    //文字颜色
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    //图片填充的内容模式
    button.imageView.contentMode = imageViewContentMode;
    //button的title
    [button setTitle:title forState:UIControlStateNormal];
    //button的image
    [button setImage:image forState:UIControlStateNormal];
    //关闭点击高亮效果
        [button setAdjustsImageWhenHighlighted:NO];
//    [button setImage:image forState:UIControlStateHighlighted];
    //button的点击事件
    button.handler = handler;
    [button addTarget:button action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
#pragma mark - button点击事件
- (void)handleButton:(UIButton *)sender{
    if (self.handler) {
        self.handler(sender);
    }
}

#pragma mark - 调整内部ImageView的frame --
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height * (1 - kTitleRatio);
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}
#pragma mark - 调整内部UIlable的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX = 0;
    CGFloat titleHeight = contentRect.size.height * kTitleRatio;
    CGFloat titleY = contentRect.size.height - titleHeight - 3;
    CGFloat titleWidth = contentRect.size.width;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}
@end
