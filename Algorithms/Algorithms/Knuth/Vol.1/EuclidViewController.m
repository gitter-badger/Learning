//
//  EuclidViewController.m
//  Algorithms
//
//  Created by Andrey on 22/03/14.
//  Copyright (c) 2014 Plush Cube. All rights reserved.
//

#import "EuclidViewController.h"

#import <PromiseKit/PromiseKit.h>

@interface EuclidViewController ()

@property (nonatomic, weak) IBOutlet UITextField *firstField;
@property (nonatomic, weak) IBOutlet UITextField *secondField;
@property (nonatomic, weak) IBOutlet UILabel *resultsLabel;

@property (nonatomic, assign) NSUInteger firstNumber;
@property (nonatomic, assign) NSUInteger secondNumber;
@property (nonatomic, assign) NSUInteger dividerNumber;

- (IBAction)generatePressed:(id)sender;
- (IBAction)calculatePressed:(id)sender;

- (NSUInteger)searchCommonDivideBetween:(NSUInteger)first andSecond:(NSUInteger)second;
- (void)tap:(UIGestureRecognizer *)gesture;

@end

@implementation EuclidViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Euclid Algorithm (1.1E)";

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)generatePressed:(id)sender
{
    self.firstNumber = random() % 100000;
    self.secondNumber = random() % 100000;
    self.firstField.text = [NSString stringWithFormat:@"%u", self.firstNumber];
    self.secondField.text = [NSString stringWithFormat:@"%u", self.secondNumber];
}

- (IBAction)calculatePressed:(id)sender
{
    self.firstNumber = self.firstField.text.integerValue;
    self.secondNumber = self.secondField.text.integerValue;

	dispatch_promise(^{
		return [self searchCommonDivideBetween:self.firstNumber andSecond:self.secondNumber];
	}).then(^(NSNumber *divider){
		self.dividerNumber = divider.unsignedIntegerValue;
		self.resultsLabel.text = [NSString stringWithFormat:@"Divider: %u", self.dividerNumber];
	});
}

- (NSUInteger)searchCommonDivideBetween:(NSUInteger)first andSecond:(NSUInteger)second
{
    if (first == 0 || second == 0) {
        return 0;
    }

    NSUInteger redundant = first % second;
    if (redundant == 0) {
        return second;
    }
    return [self searchCommonDivideBetween:second andSecond:redundant];
}

- (void)tap:(UIGestureRecognizer *)gesture
{
    [self.view endEditing:YES];
}

@end
