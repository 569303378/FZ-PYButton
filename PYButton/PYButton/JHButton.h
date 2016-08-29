//
//  JHButton.h
//  PYButton
//
//  Created by Apple on 16/8/24.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tapHandler)(UIButton *sender);

@interface JHButton : UIButton

@property (nonatomic,strong)tapHandler handler;

+ (instancetype)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment  image:(UIImage *)image imageViewContentMode:(UIViewContentMode)imageViewContentMode handler:(tapHandler)handler;


@end
