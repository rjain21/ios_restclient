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
#import "NSData+Base64.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSString* userToken, *projectID;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    userToken = @"69c02841091cf0d56eab64b50f4d7533";
    projectID = @"897504";
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)GetAuthToken {
    //curl -u $USERNAME:$PASSWORD -X GET https://www.pivotaltracker.com/services/v3/tokens/active/
    
    NSData *authData = [@"su@rjain.net:xPe1Zd90" dataUsingEncoding:NSUTF8StringEncoding];
    NSString* authString = [authData base64EncodedString];
    NSLog(@"%@", authString);
    
    NSDictionary* headers = @{@"Authorization": [NSString stringWithFormat:@"Basic %@", authString]};
    
    NSString* theURl = @"https://www.pivotaltracker.com/services/v3/tokens/active/blah";
    NSURL* apiURL = [NSURL URLWithString:theURl];
    
    NSURLRequest* theRequest = [NSURLRequest httpGetRequestWithURL:apiURL headerFields:headers];
    id<RESTClient> restClient = [SyncRESTClient new];
    
    [restClient executeRequest:theRequest
                       onError:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData, NSDictionary* responseHeaders){
                           NSLog(@"Here");
                       }
                  onCompletion:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData, NSDictionary* responseHeaders){
                      NSLog(@"%@", responseData);
                      
                  }];
}


- (void) getMeResults{
    NSDictionary *headers = @{@"X-TrackerToken": userToken};
    NSURLRequest *theRequest = [NSURLRequest httpGetRequestWithURL:[NSURL URLWithString:@"https://www.pivotaltracker.com/services/v5/projects"] headerFields:headers];
    
    id<RESTClient> restClient = [SyncRESTClient new];
    
    [restClient executeRequest:theRequest
                       onError:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData, NSDictionary* responseHeaders){
                           NSLog(@"Here");
                       }
                  onCompletion:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData, NSDictionary* responseHeaders){
                      NSLog(@"%@", responseData);
                      
                  }];
}

- (void) executeRequest:(NSURLRequest*) theRequest{
    id<RESTClient> restClient = [SyncRESTClient new];
    
    [restClient executeRequest:theRequest
                       onError:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData, NSDictionary* responseHeaders){
                           NSLog(@"Here");
                       }
                  onCompletion:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData, NSDictionary* responseHeaders){
                      NSLog(@"%@", responseData);
                      
                  }];
}

- (void) createNewProject{
    NSDictionary *headers = @{@"X-TrackerToken": userToken};
    
    NSURL *urlToAPI = [NSURL URLWithString:@"https://www.pivotaltracker.com/services/v5/projects"];
    
    NSString* theBody =@"{\"name\":\"Rajesh Jain Test\"}";
    
    NSURLRequest *theRequest = [NSURLRequest httpPostRequestWithURL:urlToAPI headerFields:headers body:theBody mimeType:MimeTypeJSON];
    [self executeRequest:theRequest];
    
}

- (void) changeNameOfProject{
    NSDictionary *headers = @{@"X-TrackerToken": userToken};
    
    NSURL *urlToAPI = [NSURL URLWithString:@"https://www.pivotaltracker.com/services/v5/projects/897528"];
    
    NSString* theBody =@"{\"name\":\"Name Updated\"}";
    
    NSURLRequest *theRequest = [NSURLRequest httpPutRequestWithURL:urlToAPI headerFields:headers body:theBody mimeType:MimeTypeJSON];
    [self executeRequest:theRequest];
    
}



- (void) deleteProject{
    NSDictionary *headers = @{@"X-TrackerToken": userToken};
    
    NSURL *urlToAPI = [NSURL URLWithString:@"https://www.pivotaltracker.com/services/v5/projects"];
    
    NSString* theBody =@"{\"name\":\"Rajesh Jain Test\"}";
    
    NSURLRequest *theRequest = [NSURLRequest httpPostRequestWithURL:urlToAPI headerFields:headers body:theBody mimeType:MimeTypeJSON];
    [self executeRequest:theRequest];
    
}


- (IBAction)buttonClick:(id)sender {
    
    [self changeNameOfProject];    
}

@end
