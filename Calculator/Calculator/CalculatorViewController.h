//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Marcel Verhagen on 29-06-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

- (IBAction)openrationPressed:(id)sender;
- (IBAction)enterPressed;

@end
