//
//  countryViewController.m
//  funfactspractice
//
//  Created by Janet Lustgarten on 5/10/16.
//  Copyright © 2016 Eoin Whitney. All rights reserved.
//

#import "countryViewController.h"

@interface countryViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pressRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *GDPRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *literacyRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *populationRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *populationDensityRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthRateRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *militaryRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *flagImage;

@end

@implementation countryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLabels];
    self.view.backgroundColor = [UIColor colorWithRed:238.0f/255.0f green:204.0f/255.0f blue:204.0f/255.0f alpha:1.0];
    
    
   
    // Do any additional setup after loading the view.
}

-(void)setLabels {
    
    self.pressRankLabel.text = [NSString stringWithFormat:@"%lu",self.selectedCountry.pressRank];
    self.populationDensityRankLabel.text = [NSString stringWithFormat:@"%lu",self.selectedCountry.populationDensity];
    self.GDPRankLabel.text = [NSString stringWithFormat:@"%lu",self.selectedCountry.GDPRank];
    self.literacyRankLabel.text = [NSString stringWithFormat:@"%lu",self.selectedCountry.LiteracyRanking];
    self.populationRankLabel.text = [NSString stringWithFormat:@"%lu",self.selectedCountry.populationRank];
    self.birthRateRankLabel.text = [NSString stringWithFormat:@"%lu",self.selectedCountry.birthRateRank];
    self.militaryRankLabel.text = [NSString stringWithFormat:@"%lu",self.selectedCountry.militaryExpenditureRank];
    self.nameLabel.text = self.selectedCountry.name;
    self.flagImage.image = self.selectedCountry.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
