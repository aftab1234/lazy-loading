//
//  lazy cell.m
//  lazy loading
//
//  Created by Sam on 03/03/15.
//  Copyright (c) 2015 Bets. All rights reserved.
//

#import "lazy cell.h"
//#import "Programming_DemoViewController.h"

@implementation lazy_cell
@synthesize thumbnailImageView=_thumbnailImageView;
@synthesize nameLabel=_nameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
