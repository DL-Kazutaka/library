//
//  ViewController.m
//  useLibC
//
//  Created by DLGames on 13/08/13.
//  Copyright (c) 2013年 DLGames. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    char* cp = helloWorld3();
    NSString* str = [NSString stringWithCString: cp encoding:NSUTF8StringEncoding];
    self.label.text = str;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
