//
//  ViewController.h
//  Service Reader
//
//  Created by Divan Visagie on 2012/08/25.
//

#import <UIKit/UIKit.h>
#import "ServiceConnector.h"

@interface ViewController : UIViewController <ServiceConnectorDelegate>
@property (weak, nonatomic) IBOutlet UITextView *output;

@property (weak, nonatomic) IBOutlet UITextField *value1TextField;
@property (weak, nonatomic) IBOutlet UITextField *value2TextField;


- (IBAction)getDown:(id)sender;
- (IBAction)postDown:(id)sender;

@end
