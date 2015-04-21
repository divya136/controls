//
//  ViewController.h
//  test
//
//  Created by gunasundari on 20/04/15.
//  Copyright (c) 2015 XERAGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
- (IBAction)submitButtonAction:(id)sender;

@end

