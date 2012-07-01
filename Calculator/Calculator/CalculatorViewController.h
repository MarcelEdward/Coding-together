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
@property (weak, nonatomic) IBOutlet UILabel *showEverything;

- (IBAction)openrationPressed:(id)sender;
- (IBAction)enterPressed;
- (IBAction)clearPressed:(id)sender;
- (IBAction)plusOrMin:(id)sender;

@end
