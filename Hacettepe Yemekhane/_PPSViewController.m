//
//  _PPSViewController.m
//  Hacettepe Yemekhane
//
//  Created by Mert Simsek on 14.11.2013.
//  Copyright (c) 2013 4pps. All rights reserved.
//

#import "_PPSViewController.h"

@interface _PPSViewController ()

@end

@implementation _PPSViewController

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
                NSLog(@"%@", object[@"yemek"]);
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

@end
