//
//  TKBookCell.h
//  TikiReader
//
//  Created by Duc Nguyen on 9/26/13.
//  Copyright (c) 2013 Tiki.vn. All rights reserved.
//

#import "AQGridViewCell.h"

@interface BookCell : AQGridViewCell

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) NSUInteger cellIndex;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *bookTitle;


@end
