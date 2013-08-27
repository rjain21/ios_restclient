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
#import "AsyncRESTClient.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSString* userToken, *projectID;
    id<RESTClient> restClient;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    userToken = @"sssssss";
    projectID = @"897504";
    restClient = [AsyncRESTClient new];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)GetAuthToken {
    //curl -u $USERNAME:$PASSWORD -X GET https://www.pivotaltracker.com/services/v3/tokens/active/
    
    NSData *authData = [@"su@rjain.net:xxxxxxxxxx" dataUsingEncoding:NSUTF8StringEncoding];
    NSString* authString = [authData base64EncodedString];
    NSLog(@"%@", authString);
    
    NSDictionary* headers = @{@"Authorization": [NSString stringWithFormat:@"Basic %@", authString]};
    
    NSString* theURl = @"https://www.pivotaltracker.com/services/v3/tokens/active";
    NSURL* apiURL = [NSURL URLWithString:theURl];
    
    NSURLRequest* theRequest = [NSURLRequest httpGetRequestWithURL:apiURL headerFields:headers];
    [self executeRequest:theRequest];
}


- (void) getMeResults{
    NSDictionary *headers = @{@"X-TrackerToken": userToken};
    NSURLRequest *theRequest = [NSURLRequest httpGetRequestWithURL:[NSURL URLWithString:@"https://www.pivotaltracker.com/services/v5/projects"] headerFields:headers];
    
    [self executeRequest:theRequest];
}

- (void) executeRequest:(NSURLRequest*) theRequest{
    
    
    [restClient executeRequest:theRequest
                       onError:^(NSError* error){
                           NSLog(@"---ERROR-----Error Code: %d. Error String : %@", error.code, error.description);
                       }
                  onCompletion:^(NSInteger httpStatusCode, NSString *httpErrorString, NSString *responseData, NSDictionary* responseHeaders){
                      NSLog(@"---Success-----HTTPSTatusCode : %d. Error String : %@", httpStatusCode,httpErrorString);
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
    
    NSURL *urlToAPI = [NSURL URLWithString:@"https://www.pivotaltracker.com/services/v5/projects/899768"];
    
    NSString* theBody =@"{\"name\":\"Name Updated to New Name\"}";
    
    NSURLRequest *theRequest = [NSURLRequest httpPutRequestWithURL:urlToAPI headerFields:headers body:theBody mimeType:MimeTypeJSON];
    [self executeRequest:theRequest];
    
}



- (void) deleteProject{
    NSDictionary *headers = @{@"X-TrackerToken": userToken};
    
    NSURL *urlToAPI = [NSURL URLWithString:@"https://www.pivotaltracker.com/services/v5/projects/897504"];
    
    NSURLRequest *theRequest = [NSURLRequest httpDeleteRequestWithURL:urlToAPI headerFields:headers];
    [self executeRequest:theRequest];
    
}

- (void) getAllStories{
    NSDictionary *headers = @{@"X-TrackerToken": userToken};
    
    NSURL *urlToAPI = [NSURL URLWithString:@"https://www.pivotaltracker.com/services/v5/projects/897504/stories"];
    
    NSURLRequest *theRequest = [NSURLRequest httpGetRequestWithURL:urlToAPI headerFields:headers];
    [self executeRequest:theRequest];
}


- (void) getAllProjects{
    NSDictionary *headers = @{@"X-TrackerToken": userToken};
    
    NSURL *urlToAPI = [NSURL URLWithString:@"https://www.pivotaltracker.com/services/v5/projects"];
    
    NSURLRequest *theRequest = [NSURLRequest httpGetRequestWithURL:urlToAPI headerFields:headers];
    [self executeRequest:theRequest];
}


- (IBAction)buttonClick:(id)sender {
    
    [self getAllStories];
    [self getAllStories];
    [self getAllStories];[self getAllStories];[self getAllStories];[self getAllStories];[self getAllStories];
}

@end
