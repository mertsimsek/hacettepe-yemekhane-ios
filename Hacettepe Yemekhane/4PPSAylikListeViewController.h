//
//  4PPSAylikListeViewController.h
//  Hacettepe Yemekhane
//
//  Created by Mert Şimşek on 05/12/13.
//  Copyright (c) 2013 4pps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface _PPSAylikListeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *aylikText;

- (NSString*) parseYemekString: (NSString*) unParsedString;

@end
