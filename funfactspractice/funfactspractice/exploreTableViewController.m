//
//  exploreTableViewController.m
//  funfactspractice
//
//  Created by Janet Lustgarten on 5/11/16.
//  Copyright © 2016 Eoin Whitney. All rights reserved.
//

#import "exploreTableViewController.h"
#import "mapsViewController.h"

@interface exploreTableViewController ()
@property (strong, nonatomic) NSArray *arrayOfImages;
@property (strong, nonatomic) UIImage *imageToDisplay;

@end

@implementation exploreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"press.png"],[UIImage imageNamed:@"GDP.png"],[UIImage imageNamed:@"literacy.png"],[UIImage imageNamed:@"population.png"],[UIImage imageNamed:@"populationdensity.png"],[UIImage imageNamed:@"birthrate.png"],[UIImage imageNamed:@"military.png"], nil];
    
    self.view.backgroundColor = [UIColor colorWithRed:182.0f/255.0f green:215.0f/255.0f blue:168.0f/255.0f alpha:1.0];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrayOfStats.count-1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
   
    NSString *stat = self.arrayOfStats[indexPath.row+1];
    
    cell.textLabel.text = stat;
    cell.textLabel.center = cell.center;
    
    cell.backgroundColor = [UIColor colorWithRed:238.0f/255.0f green:204.0f/255.0f blue:204.0f/255.0f alpha:1.0];
    
    return cell;
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    mapsViewController *vc = [segue destinationViewController];

    NSIndexPath*path = self.tableView.indexPathForSelectedRow;
    
    vc.map = self.arrayOfImages[path.row];
}


@end
