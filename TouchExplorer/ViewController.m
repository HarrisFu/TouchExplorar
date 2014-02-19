//
//  ViewController.m
//  TouchExplorer
//
//  Created by 傅小柳 on 2014/2/18.
//  Copyright (c) 2014年 Harris. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *tapsLabel;
@property (weak, nonatomic) IBOutlet UILabel *touchesLabel;

- (void)updateLabelFromTouches:(NSSet *)touches;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    _messageLabel = nil;
    _tapsLabel = nil;
    _touchesLabel = nil;
}

#pragma mark - Added methods
- (void)updateLabelFromTouches:(NSSet *)touches {
    
    NSUInteger numTaps = [[touches anyObject] tapCount];
    NSString *tapsMessage = [[NSString alloc] initWithFormat:@"%d taps detected", numTaps];
    _tapsLabel.text = tapsMessage;
    
    NSUInteger numTouches = [touches count];
    NSString *touchMsg = [[NSString  alloc] initWithFormat:@"%d touches detected", numTouches];
    _touchesLabel.text = touchMsg;
}

#pragma mark - Touch event

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    _messageLabel.text = @"Touches began";
    [self updateLabelFromTouches:touches];
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    _messageLabel.text = @"Touches Cancelled";
    [self updateLabelFromTouches:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    _messageLabel.text = @"Touched Ended";
    [self updateLabelFromTouches:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    _messageLabel.text = @"Drag Detected";
    [self updateLabelFromTouches:touches];
}

@end
