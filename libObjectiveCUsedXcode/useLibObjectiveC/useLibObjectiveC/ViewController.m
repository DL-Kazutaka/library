//
//  ViewController.m
//  useLibObjectiveC
//
//  Created by DLGames on 13/08/13.
//  Copyright (c) 2013年 DLGames. All rights reserved.
//

#import "ViewController.h"
#import "Samplelib.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Samplelib* obj = [[Samplelib alloc]init];
    self.label.text = [obj helloWorld3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
