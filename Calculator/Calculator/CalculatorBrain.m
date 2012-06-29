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

- (void)pushOperand: (double)operand;
{
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
    }

    if ([operation isEqualToString:@"-"]) {
        result = [self popOperand] - [self popOperand];
    }
    
    if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    }
    
    if ([operation isEqualToString:@"/"]) {
        result = [self popOperand] / [self popOperand];
    }
    
    [self pushOperand:result];
    
    return result;
}

@end
