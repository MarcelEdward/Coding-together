//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Marcel Verhagen on 29-06-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize showEverything = _showEverything;
@synthesize is = _is;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize  brain = _brain;

-(CalculatorBrain *)brain
{
    if(!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
   /*
    // the pi should go here cause it is a number, but the function specs say otherwise
    if ([digit isEqualToString:@"π"]) {
        [self enterPressed];
        [self.brain pushOperand:M_PI];
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = NO;
    } else
    */
    // check if the input is a ., and check if there is already a . in the number. In that case do nothing
    NSRange range = [self.display.text rangeOfString:@"."];
    if (([digit isEqualToString:@"."])&&(range.location != NSNotFound)) {
        return;
    }
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    self.showEverything.text = [NSString stringWithFormat:@"%@%@",self.showEverything.text, digit];
    self.is.text = @"";
}

- (IBAction)openrationPressed:(UIButton*)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
    self.showEverything.text = [NSString stringWithFormat:@"%@ %@ ",self.showEverything.text, operation];
    // do not show = if the operation π is pressed
    if (![operation isEqualToString:@"π"]) self.is.text = @"=";
    
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.showEverything.text = [NSString stringWithFormat:@"%@ ",self.showEverything.text];
}

- (IBAction)clearPressed:(id)sender {
    self.showEverything.text = @"";
    [self.brain clearEverything];
    self.display.text = @"";
}

- (IBAction)plusOrMin:(id)sender {
    double result = [self.display.text doubleValue] * -1;
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)backspace:(id)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text substringToIndex:[self.display.text length] - 1];
        self.showEverything.text = [self.showEverything.text substringToIndex:[self.showEverything.text length] - 1];
    }
}

//xcode added this function by itself
- (void)viewDidUnload {
    [self setShowEverything:nil];
    [self setIs:nil];
    [super viewDidUnload];
}
@end
