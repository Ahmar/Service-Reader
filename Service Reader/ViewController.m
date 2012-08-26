//
//  ViewController.m
//  Service Reader
//
//  Created by Divan Visagie on 2012/08/25.
//  Copyright (c) 2012 Divan Visagie. All rights reserved.
//

#import "ViewController.h"
#import "JSONDictionaryExtensions.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize output;
@synthesize value1TextField;
@synthesize value2TextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setOutput:nil];
    [self setValue1TextField:nil];
    [self setValue2TextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)getDown:(id)sender { //perform get request
    ServiceConnector *serviceConnector = [[ServiceConnector alloc] init];
    serviceConnector.delegate = self;
    [serviceConnector getTest];
}

- (IBAction)postDown:(id)sender { //perform post request
    ServiceConnector *serviceConnector = [[ServiceConnector alloc] init];
    serviceConnector.delegate = self;
    [serviceConnector postTest];
}


#pragma mark - ServiceConnectorDelegate -

-(void)requestReturnedData:(NSData *)data{ //activated when data is returned
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithJSONData:data];
    output.text = dictionary.JSONString; // set the textview to the raw string value of the data recieved
    
    value1TextField.text = [NSString stringWithFormat:@"%d",[[dictionary objectForKey:@"value1"] intValue]];
    value2TextField.text = [dictionary objectForKey:@"value2"];
    NSLog(@"%@",dictionary);
}

@end
