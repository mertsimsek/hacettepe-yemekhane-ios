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

@synthesize infoButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.infoButton.target = self;
    self.infoButton.action = @selector(theAction);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)theAction {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hacettepe Yemekhane"
                                                    message:@"Kullanmakta olduğunuz Hacettepe Yemekhane uygulaması Brain Is Free ekibi tarafından, gönüllü olarak geliştirilmiştir. Soru ve önerileriniz için finelycodesblog@gmail.com adresine mail atabilirsiniz"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
