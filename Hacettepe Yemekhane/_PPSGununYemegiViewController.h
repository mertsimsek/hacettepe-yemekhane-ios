//
//  4PPSGununYemegiViewController.h
//  Hacettepe Yemekhane
//
//  Created by Mert Simsek on 23.11.2013.
//  Copyright (c) 2013 4pps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface _PPSGununYemegiViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *gununYemegi;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *kalori;

- (NSString*) parseYemekString: (NSString*) unParsedString;

@end
