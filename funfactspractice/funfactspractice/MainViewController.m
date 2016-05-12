//
//  MainViewController.m
//  funfactspractice
//
//  Created by Janet Lustgarten on 5/10/16.
//  Copyright © 2016 Eoin Whitney. All rights reserved.
//

#import "MainViewController.h"
#import "ENWCountries.h"
#import "countryTableViewCell.h"
#import "countryViewController.h"
#import "exploreTableViewController.h"

@interface MainViewController () <UIPickerViewDelegate>

@property (strong, nonatomic) ENWCountries *country;
@property (atomic) BOOL rankingLabelShouldBeHidden;
@property (strong, nonatomic) NSArray* demographicsArray;
@property (weak, nonatomic) IBOutlet UIPickerView *sortByPickerView;
@property (nonatomic) BOOL sortByName;
@property (nonatomic) BOOL sortByPressRank;
@property (nonatomic) BOOL sortByGDPRank;
@property (nonatomic) BOOL sortByLiteracyRank;
@property (nonatomic) BOOL sortByPopulationRank;
@property (nonatomic) BOOL sortByPopulationDensityRank;
@property (nonatomic) BOOL sortByBirthRateRank;
@property (nonatomic) BOOL sortByMilitaryExpenditureRank;
@property (strong, nonatomic) NSArray *sortedArrays;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) ENWCountries *countryRankProperty;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleLabel;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self instantiateCountries];
    [self setBools];
    [self customizePickerView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    // this deselects a selected row whenever the table view will pop up again
    self.view.backgroundColor = [UIColor colorWithRed:238.0f/255.0f green:204.0f/255.0f blue:204.0f/255.0f alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)customizePickerView {
    
    self.sortByPickerView.layer.cornerRadius = 15;
    self.sortByPickerView.layer.masksToBounds = YES;
    self.sortByPickerView.backgroundColor = [UIColor colorWithRed:182.0f/255.0f green:215.0f/255.0f blue:168.0f/255.0f alpha:1.0];
    
}
- (NSInteger) numberOfComponentsInPickerView: (UIPickerView*)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.demographicsArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    
    return self.demographicsArray[row];

}

-(void)setBools {
    self.rankingLabelShouldBeHidden = YES;
    self.sortByName = YES;
    self.sortByPressRank = NO;
    self.sortByGDPRank = NO;
    self.sortByLiteracyRank = NO;
    self.sortByPopulationRank = NO;
    self.sortByPopulationDensityRank = NO;
    self.sortByBirthRateRank = NO;
    self.sortByMilitaryExpenditureRank = NO;
}

-(void)instantiateCountries {
    
    ENWCountries* UnitedStates = [[ENWCountries alloc] initWithCountryOfName:@"United States" pressRank:41 GDPRank:1 LiteracyRanking:45 image:[UIImage imageNamed:@"UnitedStates.png"] populationRank:3 populationDensity:176 birthRateRank:150 militaryExpenditureRank:11];
    ENWCountries* Armenia = [[ENWCountries alloc] initWithCountryOfName:@"Armenia" pressRank:74 GDPRank:136 LiteracyRanking:23 image:[UIImage imageNamed:@"Armenia.png"] populationRank:136 populationDensity:101 birthRateRank:142 militaryExpenditureRank:14];
    ENWCountries* HongKong = [[ENWCountries alloc] initWithCountryOfName:@"Hong Kong" pressRank:69 GDPRank:39 LiteracyRanking:115 image:[UIImage imageNamed:@"HongKong.png"] populationRank:101 populationDensity:4 birthRateRank:203 militaryExpenditureRank:300];
    ENWCountries* Brazil = [[ENWCountries alloc] initWithCountryOfName:@"Brazil" pressRank:104 GDPRank:7 LiteracyRanking:131 image:[UIImage imageNamed:@"Brazil.png"] populationRank:5 populationDensity:184 birthRateRank:134 militaryExpenditureRank:65];
    ENWCountries* China = [[ENWCountries alloc] initWithCountryOfName:@"China" pressRank:176 GDPRank:2 LiteracyRanking:99 image:[UIImage imageNamed:@"China.png"] populationRank:1 populationDensity:79 birthRateRank:163 militaryExpenditureRank:43];
    ENWCountries* India = [[ENWCountries alloc]initWithCountryOfName:@"India" pressRank:133 GDPRank:9 LiteracyRanking:185 image:[UIImage imageNamed:@"India.png"] populationRank:2 populationDensity:31 birthRateRank:86 militaryExpenditureRank:32];
    ENWCountries* Indonesia = [[ENWCountries alloc] initWithCountryOfName:@"Indonesia" pressRank:130 GDPRank:16 LiteracyRanking:121 image:[UIImage imageNamed:@"Indonesia.png"] populationRank:4 populationDensity:83 birthRateRank:108 militaryExpenditureRank:122];
    ENWCountries* Russia = [[ENWCountries alloc] initWithCountryOfName:@"Russia" pressRank:148 GDPRank:10 LiteracyRanking:19 image:[UIImage imageNamed:@"Russia.png"] populationRank:9 populationDensity:218 birthRateRank:168 militaryExpenditureRank:10];
    ENWCountries* Angola = [[ENWCountries alloc] initWithCountryOfName:@"Angola" pressRank:123 GDPRank:58 LiteracyRanking:175 image:[UIImage imageNamed:@"Angola.png"] populationRank:58 populationDensity:204 birthRateRank:9 militaryExpenditureRank:16];
    ENWCountries* Tanzania = [[ENWCountries alloc] initWithCountryOfName:@"Tanzania" pressRank:71 GDPRank:86 LiteracyRanking:179 image:[UIImage imageNamed:@"Tanzania.png"] populationRank:25 populationDensity:150 birthRateRank:17 militaryExpenditureRank:94];
    ENWCountries* Estonia = [[ENWCountries alloc] initWithCountryOfName:@"Estonia" pressRank:14 GDPRank:105 LiteracyRanking:9 image:[UIImage imageNamed:@"Estonia.png"] populationRank:157 populationDensity:181 birthRateRank:186 militaryExpenditureRank:42];
    ENWCountries* Sweden = [[ENWCountries alloc] initWithCountryOfName:@"Sweden" pressRank:8 GDPRank:21 LiteracyRanking:47 image:[UIImage imageNamed:@"Sweden.png"] populationRank:90 populationDensity:190 birthRateRank:167 militaryExpenditureRank:92];
    ENWCountries* Norway = [[ENWCountries alloc] initWithCountryOfName:@"Norway" pressRank:3 GDPRank:26 LiteracyRanking:103 image:[UIImage imageNamed:@"Norway.png"] populationRank:120 populationDensity:201 birthRateRank:165 militaryExpenditureRank:77];
    ENWCountries* SouthAfrica = [[ENWCountries alloc] initWithCountryOfName:@"South Africa" pressRank:39 GDPRank:33 LiteracyRanking:120 image:[UIImage imageNamed:@"SouthAfrica.png"] populationRank:27 populationDensity:168 birthRateRank:94 militaryExpenditureRank:107];
    ENWCountries* Japan = [[ENWCountries alloc] initWithCountryOfName:@"Japan" pressRank:72 GDPRank:3 LiteracyRanking:28 image:[UIImage imageNamed:@"Japan.png"] populationRank:10 populationDensity:38 birthRateRank:221 militaryExpenditureRank:109];
    
    self.countriesArray = [NSArray arrayWithObjects:UnitedStates,Armenia,HongKong,Brazil,China,India,Indonesia,Russia,Angola,Tanzania,Estonia,Sweden,Norway,SouthAfrica,Japan, nil];
    self.demographicsArray = [NSArray arrayWithObjects:@"Country Name",@"Press Freedom Rank",@"GDP Rank",@"Literacy Rate Rank",@"Total Population",@"Population Density",@"Birth Rate",@"Military Expenditure", nil];
    
}

- (IBAction)submitButtonTapped:(id)sender {
    NSString *selectedSort = [self.demographicsArray objectAtIndex:[self.sortByPickerView selectedRowInComponent:0]];
    
    if ([selectedSort isEqualToString:@"Press Freedom Rank"]) {
        [self pressRankSort];
    }
    if ([selectedSort isEqualToString:@"Country Name"]) {
        [self countryNameSort];
    }
    if ([selectedSort isEqualToString:@"GDP Rank"]) {
        [self GDPRankSort];
    }
    if ([selectedSort isEqualToString:@"Literacy Rate Rank"]) {
        [self literacySort];
    }
    if ([selectedSort isEqualToString:@"Total Population"]) {
        [self totalPopulationSort];
    }
    if ([selectedSort isEqualToString:@"Population Density"]) {
        [self populationDensitySort];
    }
    if ([selectedSort isEqualToString:@"Birth Rate"]) {
        [self birthSort];
    }
    if ([selectedSort isEqualToString:@"Military Expenditure"]) {
        [self militarySort];
    }
   
    [self.tableView reloadData];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.countriesArray.count;
    
}

-(void)countryNameSort {
    
    self.sortByName = YES;
    self.sortByPressRank = NO;
    self.sortByGDPRank = NO;
    self.sortByLiteracyRank = NO;
    self.sortByPopulationRank = NO;
    self.sortByPopulationDensityRank = NO;
    self.sortByBirthRateRank = NO;
    self.sortByMilitaryExpenditureRank = NO;
    self.rankingLabelShouldBeHidden = YES;
    self.navigationController.navigationBar.topItem.title = @"Countries by Name";
    NSSortDescriptor *sortByName = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByName, nil];
    NSArray *sortedArray = [self.countriesArray sortedArrayUsingDescriptors:sortDescriptors];
    self.sortedArrays=sortedArray;
}

-(void)militarySort {
    
    self.sortByName = NO;
    self.sortByPressRank = NO;
    self.sortByGDPRank = NO;
    self.sortByLiteracyRank = NO;
    self.sortByPopulationRank = NO;
    self.sortByPopulationDensityRank = NO;
    self.sortByBirthRateRank = NO;
    self.sortByMilitaryExpenditureRank = YES;
    self.rankingLabelShouldBeHidden = NO;
    self.navigationController.navigationBar.topItem.title = @"Countries by Military";
    NSSortDescriptor *sortByMilitary = [[NSSortDescriptor alloc] initWithKey:@"militaryExpenditureRank" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByMilitary, nil];
    NSArray *sortedArray = [self.countriesArray sortedArrayUsingDescriptors:sortDescriptors];
    self.sortedArrays=sortedArray;
}

-(void)GDPRankSort {
    
    self.sortByName = NO;
    self.sortByPressRank = NO;
    self.sortByGDPRank = YES;
    self.sortByLiteracyRank = NO;
    self.sortByPopulationRank = NO;
    self.sortByPopulationDensityRank = NO;
    self.sortByBirthRateRank = NO;
    self.sortByMilitaryExpenditureRank = NO;
    self.rankingLabelShouldBeHidden = NO;
    self.navigationController.navigationBar.topItem.title = @"Countries by GDP";
    NSSortDescriptor *sortByGDP = [[NSSortDescriptor alloc] initWithKey:@"GDPRank" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByGDP, nil];
    NSArray *sortedArray = [self.countriesArray sortedArrayUsingDescriptors:sortDescriptors];
    self.sortedArrays=sortedArray;
}

-(void)totalPopulationSort {
    
    self.sortByName = NO;
    self.sortByPressRank = NO;
    self.sortByGDPRank = NO;
    self.sortByLiteracyRank = NO;
    self.sortByPopulationRank = YES;
    self.sortByPopulationDensityRank = NO;
    self.sortByBirthRateRank = NO;
    self.sortByMilitaryExpenditureRank = NO;
    self.rankingLabelShouldBeHidden = NO;
    self.navigationController.navigationBar.topItem.title = @"Countries by Total Population";
    NSSortDescriptor *sortByPop = [[NSSortDescriptor alloc] initWithKey:@"populationRank" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByPop, nil];
    NSArray *sortedArray = [self.countriesArray sortedArrayUsingDescriptors:sortDescriptors];
    self.sortedArrays=sortedArray;
}

-(void)populationDensitySort {
    
    self.sortByName = NO;
    self.sortByPressRank = NO;
    self.sortByGDPRank = NO;
    self.sortByLiteracyRank = NO;
    self.sortByPopulationRank = NO;
    self.sortByPopulationDensityRank = YES;
    self.sortByBirthRateRank = NO;
    self.sortByMilitaryExpenditureRank = NO;
    self.rankingLabelShouldBeHidden = NO;
     self.navigationController.navigationBar.topItem.title = @"Countries by Population Density";
    NSSortDescriptor *sortByPopDensity = [[NSSortDescriptor alloc] initWithKey:@"populationDensity" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByPopDensity, nil];
    NSArray *sortedArray = [self.countriesArray sortedArrayUsingDescriptors:sortDescriptors];
    self.sortedArrays=sortedArray;
   
}

-(void)birthSort {
    
    self.sortByName = NO;
    self.sortByPressRank = NO;
    self.sortByGDPRank = NO;
    self.sortByLiteracyRank = NO;
    self.sortByPopulationRank = NO;
    self.sortByPopulationDensityRank = NO;
    self.sortByBirthRateRank = YES;
    self.sortByMilitaryExpenditureRank = NO;
    self.rankingLabelShouldBeHidden = NO;
    self.navigationController.navigationBar.topItem.title = @"Countries by Birth Rate";
    NSSortDescriptor *sortByBirth = [[NSSortDescriptor alloc] initWithKey:@"birthRateRank" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByBirth, nil];
    NSArray *sortedArray = [self.countriesArray sortedArrayUsingDescriptors:sortDescriptors];
    self.sortedArrays=sortedArray;
}

-(void)literacySort {
    
    self.sortByName = NO;
    self.sortByPressRank = NO;
    self.sortByGDPRank = NO;
    self.sortByLiteracyRank = YES;
    self.sortByPopulationRank = NO;
    self.sortByPopulationDensityRank = NO;
    self.sortByBirthRateRank = NO;
    self.sortByMilitaryExpenditureRank = NO;
    self.rankingLabelShouldBeHidden = NO;
    self.navigationController.navigationBar.topItem.title = @"Countries by Literacy Rate";
    NSSortDescriptor *sortByLiteracy = [[NSSortDescriptor alloc] initWithKey:@"LiteracyRanking" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByLiteracy, nil];
    NSArray *sortedArray = [self.countriesArray sortedArrayUsingDescriptors:sortDescriptors];
    self.sortedArrays=sortedArray;
}

-(void)pressRankSort {
    
    self.sortByName = NO;
    self.sortByPressRank = YES;
    self.sortByGDPRank = NO;
    self.sortByLiteracyRank = NO;
    self.sortByPopulationRank = NO;
    self.sortByPopulationDensityRank = NO;
    self.sortByBirthRateRank = NO;
    self.sortByMilitaryExpenditureRank = NO;
    self.rankingLabelShouldBeHidden = NO;
    self.navigationController.navigationBar.topItem.title = @"Countries by Press Freedom";
    NSSortDescriptor *sortByPressRank = [[NSSortDescriptor alloc] initWithKey:@"pressRank" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortByPressRank, nil];
    NSArray *sortedArray = [self.countriesArray sortedArrayUsingDescriptors:sortDescriptors];
    self.sortedArrays=sortedArray;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"BasicCell";
    
    countryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (self.sortByName) {
        [self countryNameSort];
    }
    
    ENWCountries *country = self.sortedArrays[indexPath.row];
    cell.rankinglabel.hidden=YES;
    if (!self.rankingLabelShouldBeHidden) {
        if (self.sortByPressRank) {
        cell.rankinglabel.text = [NSString stringWithFormat:@"%lu",country.pressRank];
        }
        if (self.sortByGDPRank) {
            cell.rankinglabel.text = [NSString stringWithFormat:@"%lu",country.GDPRank];
        }
        if (self.sortByLiteracyRank) {
            cell.rankinglabel.text = [NSString stringWithFormat:@"%lu",country.LiteracyRanking];
        }
        if (self.sortByPopulationRank) {
            cell.rankinglabel.text = [NSString stringWithFormat:@"%lu",country.populationRank];
        }
        if (self.sortByPopulationDensityRank) {
            cell.rankinglabel.text = [NSString stringWithFormat:@"%lu",country.populationDensity];
        }
        if (self.sortByBirthRateRank) {
            cell.rankinglabel.text = [NSString stringWithFormat:@"%lu",country.birthRateRank];
        }
        if (self.sortByMilitaryExpenditureRank) {
            cell.rankinglabel.text = [NSString stringWithFormat:@"%lu",country.militaryExpenditureRank];
        }


         cell.rankinglabel.hidden=NO;
    };
    cell.countrynamelabel.text = country.name;
    cell.flagimageview.image = country.image;
    cell.backgroundColor = [UIColor colorWithRed:182.0f/255.0f green:215.0f/255.0f blue:168.0f/255.0f alpha:1.0];

    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"exploreSegue"]) {
        exploreTableViewController *vc = segue.destinationViewController;
        vc.arrayOfStats = self.demographicsArray;
    }
    else {
    countryViewController *vc = segue.destinationViewController;
    NSIndexPath*path = self.tableView.indexPathForSelectedRow;
    vc.selectedCountry = self.sortedArrays[path.row];
    }
}



@end
