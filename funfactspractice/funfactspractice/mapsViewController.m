//
//  mapsViewController.m
//  funfactspractice
//
//  Created by Janet Lustgarten on 5/11/16.
//  Copyright © 2016 Eoin Whitney. All rights reserved.
//

#import "mapsViewController.h"

@interface mapsViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *mapImage;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation mapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:238.0f/255.0f green:204.0f/255.0f blue:204.0f/255.0f alpha:1.0];
    self.mapImage.image = self.map;
    self.scrollView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
        return self.mapImage;   
}

@end
