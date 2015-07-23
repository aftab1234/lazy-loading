//
//  lazy cell.h
//  lazy loading
//
//  Created by Sam on 03/03/15.
//  Copyright (c) 2015 Bets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lazy_cell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@end
