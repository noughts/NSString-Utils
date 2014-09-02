//
//  ViewController.m
//  NSString+UtilsDemo
//
//  Created by noughts on 2014/09/02.
//  Copyright (c) 2014年 noughts. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Utils.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NSString* temp = @"こんにちは。私は人間です。";
	NSLog( @"%@", [temp yomigana] );
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
