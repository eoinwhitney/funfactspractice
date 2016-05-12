//
//  ENWCountries.m
//  funfactspractice
//
//  Created by Janet Lustgarten on 5/6/16.
//  Copyright © 2016 Eoin Whitney. All rights reserved.
//

#import "ENWCountries.h"
@interface ENWCountries ()



@end

@implementation ENWCountries



-(instancetype)initWithCountryOfName:(NSString *)name pressRank:(NSUInteger)pressRank GDPRank:(NSUInteger)GDPRank {
    self = [super init];
    if (self) {
        _name=name;
        _pressRank=pressRank;
        _GDPRank=GDPRank;
    
    }
    return self;
}

-(instancetype)initWithCountryOfName:(NSString *)name pressRank:(NSUInteger)pressRank GDPRank:(NSUInteger)GDPRank LiteracyRanking:(NSUInteger)LiteracyRanking image:(UIImage *)image populationRank:(NSUInteger)populationRank populationDensity:(NSUInteger)populationDensity birthRateRank:(NSUInteger)birthRateRank militaryExpenditureRank:(NSUInteger)militaryExpenditureRank {
    self = [super init];
    if (self) {
        _name=name;
        _pressRank=pressRank;
        _GDPRank=GDPRank;
        _LiteracyRanking=LiteracyRanking;
        _image=image;
        _populationRank=populationRank;
        _populationDensity=populationDensity;
        _birthRateRank=birthRateRank;
        _militaryExpenditureRank=militaryExpenditureRank;
    }
    return self;
}

@end
