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
#import "NSString+RESTClient.h"
#import "NSURLRequest+RESTClient.h"
@interface ViewController ()

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
}
- (IBAction)buttonClick:(id)sender {
    NSURLRequest *getRequest = [NSURLRequest httpGetRequestWithURL:[NSURL URLWithString:@"http://www.apple.com"]];
    id<RESTClient> restClient = [SyncRESTClient new];
    
    [restClient executeRequest:getRequest
                       onError:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData, NSDictionary* responseHeaders){
                           NSLog(@"Here");
                       }
                  onCompletion:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData, NSDictionary* responseHeaders){
                      NSLog(@"%@", responseData);
                  }];

}

@end
