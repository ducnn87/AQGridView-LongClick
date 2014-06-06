//
//  MasterViewController.m
//  BookShelf
//
//  Created by Duc Nguyen on 5/15/14.
//  Copyright (c) 2014 Duc Nguyen. All rights reserved.
//

#import "MasterViewController.h"
#import "BookCell.h"
#import "iToast.h"

static NSString *cellIdentify = @"CellIdentify";

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@property (strong, nonatomic) NSMutableArray *fileArray;
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    header.backgroundColor = [UIColor clearColor];
    [self.gridView setGridHeaderView:header];
    [self.gridView setGridFooterView:header];
    [self.view setBackgroundColor:UIColorFromRGB(0xE4E2E2)];
    self.fileArray = [@[@"Apple", @"Samsung", @"Nokia",@"MS", @"Google", @"Facebook"] mutableCopy];
    [self.gridView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGSize)portraitGridCellSizeForGridView:(AQGridView *) gridView {
    CGSize size = CGSizeMake(104, 150);
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        size = CGSizeMake(248, 360);
    }
    return size;
}

- (NSUInteger)numberOfItemsInGridView:(AQGridView *) gridView {
    if (self.fileArray) {
        return self.fileArray.count;
    }
    return 0;
}

- (AQGridViewCell *)gridView:(AQGridView *) gridView cellForItemAtIndex:(NSUInteger) index {
    BookCell *cell = (BookCell*)[gridView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil) {
        CGRect frame = CGRectMake(0, 0, 96, 142);
        cell = [[BookCell alloc] initWithFrame:frame reuseIdentifier:cellIdentify];
    }
    
    UIImage *placeHolder = [UIImage imageNamed:@"cover_holder"];
    cell.image = placeHolder;
    [cell.bookTitle setText:[self.fileArray objectAtIndex:index]];
    return cell;
}

- (void)gridView:(AQGridView*)gridView didLongClickItemAtIndex:(NSUInteger) index {
    [gridView deselectItemAtIndex:index animated:YES];
    
    [[[[iToast makeText:[NSString stringWithFormat:@"long clicked %@",[self.fileArray objectAtIndex:index]]] setGravity:iToastGravityBottom] setDuration:iToastDurationNormal] show];
}

- (void)gridView:(AQGridView *)gridView didSelectItemAtIndex:(NSUInteger)index {
    [gridView deselectItemAtIndex:index animated:YES];
    [[[[iToast makeText:[NSString stringWithFormat:@"selected %@",[self.fileArray objectAtIndex:index]]] setGravity:iToastGravityBottom] setDuration:iToastDurationNormal] show];
    
}



@end
