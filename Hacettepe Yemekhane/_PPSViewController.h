//
//  _PPSViewController.h
//  Hacettepe Yemekhane
//
//  Created by Mert Simsek on 14.11.2013.
//  Copyright (c) 2013 4pps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface _PPSViewController : UIViewController {
    IBOutlet UIBarButtonItem *infoButton;
}

@property (nonatomic, retain) UIBarButtonItem *infoButton;

-(IBAction)theAction;

@end
