//
//  countryTableViewCell.h
//  funfactspractice
//
//  Created by Janet Lustgarten on 5/6/16.
//  Copyright © 2016 Eoin Whitney. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface countryTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *flagimageview;
@property (weak, nonatomic) IBOutlet UILabel *countrynamelabel;
@property (weak, nonatomic) IBOutlet UILabel *rankinglabel;

@end
