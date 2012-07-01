//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Marcel Verhagen on 29-06-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain() 
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *) operandStack
{
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void)clearEverything
{
    [self.operandStack removeAllObjects];
}

- (void)pushOperand: (double)operand;
{
    NSLog(@"number %g",operand);
    NSNumber *openrandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:openrandObject];
}

- (double) popOperand
{
    NSNumber *openrandObject = [self.operandStack lastObject];
    if (openrandObject) [self.operandStack removeLastObject];
    return [openrandObject doubleValue];
}

- (double)performOperation:(NSString *)operation
{
    double result = 0;
    
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([operation isEqualToString:@"-"]) {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    } else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"/"]) {
        double divisor = [self popOperand];
        if (divisor) result = [self popOperand] / divisor;
        else return 0;
    } else if ([operation isEqualToString:@"sin"]) {
        // convert to degrees
        result = sin([self popOperand] * (180 / M_PI));
    } else if ([operation isEqualToString:@"cos"]) {
        result = cos([self popOperand] * (180 / M_PI));
    } else if ([operation isEqualToString:@"√"]) {
        result = sqrt([self popOperand]);
    } else if ([operation isEqualToString:@"π"]) {
        result = M_PI;
    } else if ([operation isEqualToString:@"x²"]) {
        result = pow([self popOperand],2);
    }
    
    [self pushOperand:result];
    
    return result;
}

@end
