//
//  CFCalcBrain.m
//  CFCalculator
//
//  Created by Brad on 9/9/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "CFCalcBrain.h"

@implementation CFCalcBrain

-(NSInteger)calculate:(NSMutableArray *)numbers //our core logic that calculates two numbers with our selected operator
{
    NSInteger firstNumber = [[numbers lastObject] intValue];
    [numbers removeLastObject];
    
    NSInteger secondNumber = [[numbers lastObject] intValue];
    [numbers removeLastObject];
    
    if ([self.currentOperation  isEqual: @"*"])
    {
            NSInteger result = firstNumber * secondNumber;
        [self.enteredNumbers addObject:[NSString stringWithFormat:@"%d",result]];
         
        return result;
    }
    
    if ([self.currentOperation isEqual: @"+"])
    {
        NSInteger result = firstNumber +secondNumber;
        [self.enteredNumbers addObject:[NSString stringWithFormat:@"%d",result]];
        
        return result;
        
    }
    
    if ([self.currentOperation isEqual: @"-"])
    {
        NSInteger result = secondNumber - firstNumber;
        [self.enteredNumbers addObject:[NSString stringWithFormat:@"%d",result]];
        
        return result;
        
    }
    
    if ([self.currentOperation isEqual: @"%"])
    {
        NSInteger result = firstNumber %secondNumber;
        [self.enteredNumbers addObject:[NSString stringWithFormat:@"%d",result]];
        
        return result;
        
    }
    
    
    return 0;
}

-(NSMutableArray *)enteredNumbers //getter for our numbers array
{
    if (!_enteredNumbers)
    { _enteredNumbers = [[NSMutableArray alloc]init]; }
    
    return _enteredNumbers;
}

-(NSNumber *)activateScience:(NSInteger)number
{
    if ([self.currentOperation isEqual:@"sin"])
    {
        return [NSNumber numberWithDouble:sin(number)];
    }
    if ([self.currentOperation isEqual:@"cos"])
    {
        return [NSNumber numberWithDouble:cos(number)];
    }
    if ([self.currentOperation isEqual:@"tan"])
    {
        return [NSNumber numberWithDouble:tan(number)];
    }
    
    return 0;
}
@end
