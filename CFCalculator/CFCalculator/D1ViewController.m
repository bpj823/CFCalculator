//
//  D1ViewController.m
//  CFCalculator
//
//  Created by Brad on 9/9/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "D1ViewController.h"
#import "CFCalcBrain.h"


@interface D1ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *calcLabel;
@property (strong,nonatomic) CFCalcBrain *calcBrain;
@property (strong, nonatomic) IBOutlet UIView *landscapeView;
@property (strong, nonatomic) IBOutlet UIView *portraitView;
@property (strong, nonatomic) IBOutlet UIView *landtest;


@end

@implementation D1ViewController

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
} //tells our view controller that it supports all orientations

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
//when the device is going to rotate to a new orientation this method is called
{
    if (toInterfaceOrientation == UIDeviceOrientationLandscapeLeft)
    {
    }
}


-(NSUInteger)supportedInterfaceOrientations
{
    
    return UIInterfaceOrientationMaskAll;
} //tells our view controller that it supports all orientations

- (CFCalcBrain *)calcBrain //getter for our model
{
    if (!_calcBrain)
    {
        _calcBrain = [[CFCalcBrain alloc]init];
        
    }
    return _calcBrain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    if (self.calcBrain.inMiddleOfOperation)
    {
        self.calcLabel.text = @" ";
        
    }
    
    NSString *digit = [sender currentTitle];
    NSLog(@"%@", digit);
    self.calcLabel.text = [self.calcLabel.text stringByAppendingString:digit];
    self.calcBrain.inMiddleOfOperation = NO;
    
    
}

-(IBAction)operationPressed:(UIButton *)sender
{
    if ([self.calcBrain.enteredNumbers count] == 0)
        //if no numbers have been entered yet we the number to our array and tell our bool property that we are in the middle of an operation
    {
        if (![self.calcLabel.text isEqual:@" "])
        {
        [self.calcBrain.enteredNumbers addObject:self.calcLabel.text];
            self.calcBrain.inMiddleOfOperation = YES;
        }
        self.calcBrain.currentOperation = sender.currentTitle;
        return;
    }
    
    if ([self.calcBrain.enteredNumbers count] == 1 )
        //if there is one number in our array than we store the operation in our model's currentOperation property. We then add the number just last entered to our array, check to make sure we now have 2 numbers in the array, and then do the calculation
    {
        self.calcBrain.currentOperation = sender.currentTitle;
        
        [self.calcBrain.enteredNumbers addObject:self.calcLabel.text];
        
        
        self.calcBrain.inMiddleOfOperation = YES;
    }
    if ([self.calcBrain.enteredNumbers count] == 2)
    {
        self.calcLabel.text = [NSString stringWithFormat:@"%ld", (long)[self.calcBrain calculate:self.calcBrain.enteredNumbers]];
    }
    

    return;
    
}
-(IBAction)equalPressed
{
    if ([self.calcBrain.enteredNumbers count] == 1)
    {
        [self.calcBrain.enteredNumbers addObject:self.calcLabel.text];
        
        self.calcLabel.text = [NSString stringWithFormat:@"%ld", (long)[self.calcBrain calculate:self.calcBrain.enteredNumbers]];
    }
}

-(IBAction)sciencePressed:(UIButton *)sender
{
    if ([self.calcBrain.enteredNumbers count] == 0)
    {
        [self.calcBrain.enteredNumbers addObject:self.calcLabel.text];
        
        self.calcBrain.currentOperation = sender.currentTitle;
        
     self.calcLabel.text = [NSString stringWithFormat:@"%@", [self.calcBrain activateScience:[[self.calcBrain.enteredNumbers lastObject] intValue]]];
   
     
    }
}
- (IBAction)clearPressed {
    
    [self.calcBrain.enteredNumbers removeAllObjects];
    self.calcBrain.currentOperation = nil;
    self.calcLabel.text = @" ";
    self.calcBrain.inMiddleOfOperation = NO;
} //clears our model out and our UI


@end
