//
//  ViewController.m
//  RESTClientExample
//
//  Created by RAJESH JAIN on 8/8/13.
//  Copyright (c) 2013 RAJESH JAIN. All rights reserved.
//

#import "ViewController.h"
#import "RESTClient.h"
#import "SyncRESTClient.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    id<RESTClient> restClient = [SyncRESTClient new];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
