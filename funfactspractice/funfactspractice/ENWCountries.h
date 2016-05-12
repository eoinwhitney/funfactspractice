//
//  ENWCountries.h
//  funfactspractice
//
//  Created by Janet Lustgarten on 5/6/16.
//  Copyright © 2016 Eoin Whitney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ENWCountries : NSObject

@property (strong, nonatomic) NSMutableArray *countries;
@property (strong, nonatomic) NSString* name;
@property (nonatomic) NSUInteger pressRank;
@property (nonatomic) NSUInteger GDPRank;
@property (nonatomic) NSUInteger LiteracyRanking;
@property (strong, nonatomic) UIImage* image;
@property (nonatomic) NSUInteger populationRank;
@property (nonatomic) NSUInteger populationDensity;
@property (nonatomic) NSUInteger birthRateRank;
@property (nonatomic) NSUInteger militaryExpenditureRank;


-(instancetype)initWithCountryOfName:(NSString*)name
                           pressRank:(NSUInteger)pressRank
                             GDPRank:(NSUInteger)GDPRank
                     LiteracyRanking:(NSUInteger)LiteracyRanking
                               image:(UIImage*)image
                      populationRank:(NSUInteger)populationRank
                   populationDensity:(NSUInteger)populationDensity
                       birthRateRank:(NSUInteger)birthRateRank
             militaryExpenditureRank:(NSUInteger)militaryExpenditureRank;






@end
