//
//  UIImage+Color.m
//  TikiReader
//
//  Created by Duc Nguyen on 11/30/13.
//  Copyright (c) 2013 Tiki.vn. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [UIImage imageWithColor:color size:CGSizeMake(4, 4)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    beginImageContextWithOptions(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)roundImageWithColor:(UIColor *)color radius:(float)radius {
    beginImageContextWithOptions(CGSizeMake(radius, radius));
    
    [color setFill];
    
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, radius, radius)];
    oval.lineWidth = 1;
    [oval fill];
    
    UIImage *ovalImg = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return ovalImg;
}

void beginImageContextWithOptions(CGSize size) {
    static CGFloat scale = -1.0;
    if (scale < 0.0) {
        UIScreen *screen = [UIScreen mainScreen];
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0) {
            scale = [screen scale];
        } else {
            scale = 0.0;    // mean use old api
        }
    }
    if (scale>0.0) {
        UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    } else {
        UIGraphicsBeginImageContext(size);
    }
}
+ (UIImage *) buttonBackGround:(UIColor*)color {
    return [UIImage buttonBackGround:color cornerRadius:4.0];
}
+ (UIImage *) buttonBackGround:(UIColor*)color cornerRadius:(CGFloat)radius {
    CGRect rect = CGRectMake(0.0f, 0.0f, 10, 10);
    beginImageContextWithOptions(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect outerRect = CGRectInset(rect, 1, 1);
    CGMutablePathRef outerPath = createRoundedRectForRect(outerRect, radius);
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddPath(context, outerPath);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextClip(context);
    CGContextRestoreGState(context);
    UIImage *buttonImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CFRelease(outerPath);
    return buttonImage;

}

+ (UIImage *)buttonBackground:(UIColor*)color
                  borderColor:(UIColor*)borderColor
                       radius:(CGFloat)radius {
    CGRect rect = CGRectMake(0.0f, 0.0f, 10, 10);
    beginImageContextWithOptions(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect outerRect = CGRectInset(rect, 1, 1);
    CGMutablePathRef outerPath = createRoundedRectForRect(outerRect, radius);
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddPath(context, outerPath);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextClip(context);
    CGContextRestoreGState(context);
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 1);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextAddPath(context, outerPath);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
    UIImage *buttonImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CFRelease(outerPath);
    return buttonImage;
}

+ (UIImage *) buttonSelectedBackGround:(UIColor*)color radius:(CGFloat)radius {
    return [UIImage buttonBackground:color
                         borderColor:UIColorFromRGB(0x00B7F1)
                              radius:radius];

}
+ (UIImage *) buttonSelectedBackGround:(UIColor*)color {
    return [UIImage buttonSelectedBackGround:color radius:3.0];
}

CGMutablePathRef createRoundedRectForRect(CGRect rect, CGFloat radius)
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect), CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
    CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
    CGPathCloseSubpath(path);
    
    return path;
}

@end
