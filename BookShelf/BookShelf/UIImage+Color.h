//
//  UIImage+Color.h
//  TikiReader
//
//  Created by Duc Nguyen on 11/30/13.
//  Copyright (c) 2013 Tiki.vn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)roundImageWithColor:(UIColor *)color radius:(float)radius;
+ (UIImage *) buttonBackGround:(UIColor*)color ;
+ (UIImage *) buttonSelectedBackGround:(UIColor*)color ;
+ (UIImage *) buttonBackGround:(UIColor*)color cornerRadius:(CGFloat)radius;
+ (UIImage *) buttonSelectedBackGround:(UIColor*)color radius:(CGFloat)radius;
CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius);
+ (UIImage *)buttonBackground:(UIColor*)color
                  borderColor:(UIColor*)borderColor
                       radius:(CGFloat)radius;
@end
