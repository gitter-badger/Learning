//
//  BinaryPeriodViewController.m
//  Algorithms
//
//  Created by Andrey on 23/03/14.
//  Copyright (c) 2014 Plush Cube. All rights reserved.
//

#import "BinaryPeriodViewController.h"

char *int2bin(NSUInteger a, char *buffer, char buf_size) {
    buffer += (buf_size - 1);
    for (char i = buf_size - 1; i >= 0; i--) {
        *buffer-- = (a & 1) + '0';
        a >>= 1;
    }
    return buffer;
}

@interface BinaryPeriodViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *inputField;
@property (nonatomic, weak) IBOutlet UILabel *binaryLabel;
@property (nonatomic, weak) IBOutlet UILabel *resultLabel;

- (IBAction)calculate:(id)sender;

- (char)binlen:(NSUInteger)number;
- (NSString *)binaryStringFromNumber:(NSUInteger)number;
- (NSInteger)findBinaryPeriodOfNumber:(NSUInteger)number;

@end

@implementation BinaryPeriodViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Binary Period";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSUInteger value = text.integerValue;
    if (value == 0 && text.length > 1) {
        return NO;
    }
    self.binaryLabel.text = [NSString stringWithFormat:@"%@b", [self binaryStringFromNumber:value]];
    return YES;
}

- (IBAction)calculate:(id)sender
{
    NSUInteger value = self.inputField.text.integerValue;
    NSInteger period = [self findBinaryPeriodOfNumber:value];
    if (period < 0) {
        self.resultLabel.text = @"This number is not binary periodic.";
    } else {
        self.resultLabel.text = [NSString stringWithFormat:@"Period: %d", period];
    }
}

- (char)binlen:(NSUInteger)number
{
    char count = 0;
    while (number > 0) {
        count++;
        number >>= 1;
    }
    return count;
}

- (NSString *)binaryStringFromNumber:(NSUInteger)number
{
    char len = [self binlen:number];
    char buffer[len + 1];
    buffer[len] = '\0';
    int2bin(number, buffer, len);
    NSString *string = [NSString stringWithCString:buffer encoding:NSASCIIStringEncoding];
    return string;
}

- (NSInteger)findBinaryPeriodOfNumber:(NSUInteger)number
{
    NSString *string = [self binaryStringFromNumber:number];
    char len = string.length;
    NSRange range = NSMakeRange(1, len / 2 - 1);
    NSString *substring = [string substringWithRange:range];
    string = [string stringByAppendingString:string];
    char start = range.location + range.length;
    range = [string rangeOfString:substring options:0 range:NSMakeRange(start, string.length - start)];
    if (range.location != NSNotFound && range.location <= (len / 2 + 1)) {
        return (range.location - 1);
    } else {
        return -1;
    }
}

@end
