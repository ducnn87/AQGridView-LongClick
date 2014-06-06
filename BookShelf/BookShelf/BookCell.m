//
//  TKBookCell.m
//  TikiReader
//
//  Created by Duc Nguyen on 9/26/13.
//  Copyright (c) 2013 Tiki.vn. All rights reserved.
//

#import "BookCell.h"
#import "objc/runtime.h"

#define k_book_border 7


@interface BookCell ()

@end

@implementation BookCell

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
        
	}
	return self;
}


- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)aReuseIdentifier {
	self = [super initWithFrame:frame reuseIdentifier:aReuseIdentifier];
	if (self != nil) {
        self.radius = 2.0f;
        [self setSelectionStyle:AQGridViewCellSelectionStyleBlue];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(k_book_border, k_book_border,
                                                                       frame.size.width - 2*k_book_border,
                                                                       frame.size.height - 2*k_book_border)];
        
        self.imageView.backgroundColor = [UIColor clearColor];
        CGFloat height = 40;
        CGFloat topMargin = 0;
        if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
            height = 72;
            topMargin = 8;
        }
        self.bookTitle = [[UILabel alloc] initWithFrame:CGRectMake(k_book_border+4,
                                                                   frame.size.height/2 -topMargin ,
                                                                   frame.size.width-2*(k_book_border+4),
                                                                   height)];
        self.bookTitle.textAlignment = NSTextAlignmentCenter;
        self.bookTitle.numberOfLines = 3;
        self.bookTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.bookTitle setFont:[UIFont systemFontOfSize:10]];
        [self.bookTitle setTextColor:UIColorFromRGB(0xafacac)];
        [self.contentView addSubview:self.bookTitle];
        [self.contentView addSubview:self.imageView];

    }
	return self;
}

- (void)setTitle:(NSString *)title {
    title = [title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [self.bookTitle setText:title];
    CGSize titleSize = [self.bookTitle sizeThatFits:self.bookTitle.frame.size];
    self.bookTitle.frame = CGRectMake(self.bookTitle.frame.origin.x, self.bookTitle.frame.origin.y, self.bookTitle.frame.size.width, titleSize.height);
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
    [self setViewWithSize:image.size];
}


- (void) setViewWithSize:(CGSize)size {
    CGSize contentSize = self.contentView.frame.size;
    CGFloat maxWidth = contentSize.width - 2*k_book_border;
    CGFloat maxHeight = contentSize.height - 2*k_book_border;
    if (maxWidth/maxHeight < size.width/size.height) {
        CGFloat imageViewHeight = maxWidth * size.height/size.width;
        self.imageView.frame = CGRectMake(k_book_border, k_book_border,
                                          maxWidth,
                                          imageViewHeight);
    } else {
        CGFloat imageViewWidth = maxHeight * size.width/size.height;
        self.imageView.frame = CGRectMake(k_book_border, k_book_border,
                                          imageViewWidth, maxHeight);
    }
    [self setSelectedBackgroundViewFrame:self.contentView.frame];
    self.imageView.center = self.contentView.center;
}


@end