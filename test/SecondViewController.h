//
//  SecondViewController.h
//  test
//
//  Created by gunasundari on 20/04/15.
//  Copyright (c) 2015 XERAGO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
@interface SecondViewController : UIViewController<MFMailComposeViewControllerDelegate,UIAlertViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
BOOL keyboardVisible_;
    BOOL isClicked_;

    NSArray *arrState;
    NSArray *arrState2;
    NSArray *arrState3;
    NSString *radio;
    UIPickerView *pktStatePicker ;
    UIPickerView *pktStatePicker2 ;
    UIPickerView *pktStatePicker3 ;


}
@property (weak, nonatomic) IBOutlet UIButton *barButton;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *deptField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextField *reasonField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;
@property (weak, nonatomic) IBOutlet UITextView *remarksTextview;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
- (IBAction)sendbuttonAction:(id)sender;
- (void) keyboardDidShow:(NSNotification *)notif;
- (void) keyboardDidHide:(NSNotification *)notif;
- (IBAction)radioButtonClicked:(id)sender;
- (IBAction)radioButtonClicked2:(id)sender;
- (IBAction)barButtonAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end
