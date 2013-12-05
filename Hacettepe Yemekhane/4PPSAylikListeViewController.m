//
//  4PPSAylikListeViewController.m
//  Hacettepe Yemekhane
//
//  Created by Mert Şimşek on 05/12/13.
//  Copyright (c) 2013 4pps. All rights reserved.
//

#import "4PPSAylikListeViewController.h"

@interface _PPSAylikListeViewController ()

@end

@implementation _PPSAylikListeViewController
@synthesize aylikText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSDate *dateOfDay = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:dateOfDay];
    
	PFQuery *query = [PFQuery queryWithClassName:@"Yemekhane"];
    [query whereKey:@"date" greaterThanOrEqualTo:dateString];
    query.limit = 5;
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSString *totalText = @"";
        if (!error) {
            for (PFObject *object in objects) {
                NSString *currentDate = object[@"date"];
                NSString *gun = object[@"gun"];
                NSString *kaloriText = object[@"kalori"];
                NSString *yemek = [self parseYemekString:object[@"yemek"]];
                
                totalText = [totalText stringByAppendingString:currentDate];
                totalText = [totalText stringByAppendingString:@"\n"];
                totalText = [totalText stringByAppendingString:gun];
                totalText = [totalText stringByAppendingString:@"\n"];
                totalText = [totalText stringByAppendingString:kaloriText];
                totalText = [totalText stringByAppendingString:@" kalori\n"];
                totalText = [totalText stringByAppendingString:yemek];
                totalText = [totalText stringByAppendingString:@"\n\n"];
            }
            
            [aylikText setText:totalText];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*) parseYemekString:(NSString *)unParsedString
{
    NSArray *array = [unParsedString componentsSeparatedByString:@"/"];
    return [array componentsJoinedByString:@"\n"];
}

@end
