//
//  4PPSGununYemegiViewController.m
//  Hacettepe Yemekhane
//
//  Created by Mert Simsek on 23.11.2013.
//  Copyright (c) 2013 4pps. All rights reserved.
//

#import "_PPSGununYemegiViewController.h"

@interface _PPSGununYemegiViewController ()

@end

@implementation _PPSGununYemegiViewController
@synthesize gununYemegi;

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
	NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:date];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Yemekhane"];
    [query whereKey:@"date" equalTo:dateString];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects) {
                [gununYemegi setText:[self parseYemekString: object[@"yemek"]]];
            }
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
