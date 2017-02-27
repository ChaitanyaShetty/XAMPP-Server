//
//  ViewController.h
//  XAMPP
//
//  Created by chaitanya on 11/10/16.
//  Copyright © 2016 chaitanya. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kPostURL @"http://localhost/testDb1.php"
#define kName @"name"
#define kMessage @"message"
#define kId @"id"


@interface ViewController : UIViewController{
    NSURLConnection *postConnection;
}

@property (strong, nonatomic) IBOutlet UITextField *idText;
@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextView *messageText;
- (IBAction)SubmitButton:(id)sender;
- (IBAction)database:(id)sender;
-(void)postMessage:(NSString *) message withName:(NSString *) name withId:(NSString *) userid;
@end

