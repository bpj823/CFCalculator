//
//  CFCalcBrain.h
//  CFCalculator
//
//  Created by Brad on 9/9/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFCalcBrain : NSObject

@property (strong,nonatomic) NSMutableArray *enteredNumbers;
@property (strong,nonatomic) NSString *currentOperation;
@property (nonatomic) BOOL inMiddleOfOperation;

-(NSInteger)calculate:(NSMutableArray *)numbers;
-(NSNumber *)activateScience:(NSInteger)number;





@end
