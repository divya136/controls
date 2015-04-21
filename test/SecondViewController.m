//
//  SecondViewController.m
//  test
//
//  Created by gunasundari on 20/04/15.
//  Copyright (c) 2015 XERAGO. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize nameTextfield,remarksTextview,sendButton,scrollView,deptField,locationField,reasonField,dateField,button1,button2;
- (void)viewDidLoad {
    [super viewDidLoad];
    nameTextfield.delegate=self;
    dateField.delegate=self;
    dateField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    remarksTextview.delegate=self;
    
    
    self.navigationItem.hidesBackButton = YES;
    

        // Set the scroll view's content size to be our view's size
    self.scrollView.contentSize = self.view.frame.size;
    remarksTextview.layer.cornerRadius = 5.0f;
    remarksTextview.layer.masksToBounds = NO;
    remarksTextview.layer.borderWidth = 0.5f;
    remarksTextview.layer.shadowColor = [UIColor grayColor].CGColor;
    //remarksTextview.layer.shadowOpacity = 0.4;
    remarksTextview.layer.shadowRadius = 5.0f;
    
    arrState= [NSArray    arrayWithObjects:@"Select", @"Technology",@"HTML",@"Javascript",@"Testing",@"Analytics",@"Design",@"Analyst",@"SEO", nil];
    arrState2= [NSArray    arrayWithObjects:@"Select", @"Chennai",@"Banglore",@"Mumbai",@"Delhi", nil];
    arrState3= [NSArray    arrayWithObjects:@"Select", @"Fever",@"Personal work",@"Stomach pain", nil];

    pktStatePicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    pktStatePicker  .delegate = self;
    
    pktStatePicker  .dataSource = self;
    
    [ pktStatePicker  setShowsSelectionIndicator:YES];
    
    deptField.inputView =  pktStatePicker  ;
    pktStatePicker.tag=1;
    
    pktStatePicker2 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    pktStatePicker2  .delegate = self;
    
    pktStatePicker2  .dataSource = self;
    
    [ pktStatePicker2  setShowsSelectionIndicator:YES];
    
    locationField.inputView =  pktStatePicker2  ;
    pktStatePicker2.tag=2;
    
    pktStatePicker3 = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    pktStatePicker3  .delegate = self;
    
    pktStatePicker3  .dataSource = self;
    
    [ pktStatePicker3  setShowsSelectionIndicator:YES];
    
    reasonField.inputView =  pktStatePicker3  ;
    pktStatePicker3.tag=3;
    // Create done button in UIPickerView
    
    
    
    UIToolbar*  mypickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    
    mypickerToolbar.barStyle = UIBarStyleBlackOpaque;
    
    [mypickerToolbar sizeToFit];
    
    
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [barItems addObject:flexSpace];
    
    
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    
    [barItems addObject:doneBtn];
    
    
    
    [mypickerToolbar setItems:barItems animated:YES];
    
    
    
    deptField.inputAccessoryView = mypickerToolbar;
    locationField.inputAccessoryView = mypickerToolbar;
    reasonField.inputAccessoryView = mypickerToolbar;
    
    //locationField.inputAccessoryView = mypickerToolbar;

    // Do any additional setup after loading the view.
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(
                                                   NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    _databasePath = [[NSString alloc]
                     initWithString: [docsDir stringByAppendingPathComponent:
                                      @"contacts.db"]];
    NSLog(@"dbpapth:%@",_databasePath);
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: _databasePath ] == NO)
    {
        const char *dbpath = [_databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, DEPARTMENT TEXT, LOCATION TEXT, REASON TEXT, DATE DATETIME, LATE TEXT, REMARKS TEXT)";
            
            if (sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
               // _status.text = @"Failed to create table";
            }
            sqlite3_close(_contactDB);
        } else {
            //_status.text = @"Failed to open/create database";
        }
    }
}

-(void)pickerDoneClicked

{
    NSLog(@"Done Clicked");
    if ([deptField isFirstResponder])
        [deptField resignFirstResponder];
    else if([locationField isFirstResponder])
        [locationField resignFirstResponder];
    else
        [reasonField resignFirstResponder];

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    
    return 1;
    
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    
    if (pickerView.tag == 1)
        return arrState.count;
    else if(pickerView.tag == 2)
        return arrState2.count;
    else
        return arrState3.count;

}



- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    if (pickerView.tag == 1)
        return [arrState objectAtIndex:row];
    else if(pickerView.tag == 2)
        return [arrState2 objectAtIndex:row];
    else
        return [arrState3 objectAtIndex:row];

    
}



- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    if (pickerView.tag == 1)
        deptField.text = (NSString *)[arrState objectAtIndex:row];
    else if(pickerView.tag == 2)
        locationField.text = (NSString *)[arrState2 objectAtIndex:row];
    else
        reasonField.text = (NSString *)[arrState3 objectAtIndex:row];


}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"%@", @"Registering for keyboard events...");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
        if ([text isEqualToString:@"\n"])
    [textView resignFirstResponder];
    return YES;
    
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"%@", @"Unregistering for keyboard events...");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) keyboardDidShow:(NSNotification *)notif {
    NSLog(@"%@", @"Received UIKeyboardDidShowNotification");
    
//    if (keyboardVisible_) {
//        NSLog(@"%@", @"Keyboard is already visible.  Ignoring notifications.");
//        return;
//    }
//    
//    // The keyboard wasn't visible before
//    NSLog(@"Resizing smaller for keyboard");
//    
//    // Get the origin of the keyboard when it finishes animating
//    NSDictionary *info = [notif userInfo];
//    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
//    
//    // Get the top of the keyboard in view's coordinate system.
//    // We need to set the bottom of the scrollview to line up with it
//    CGRect keyboardRect = [aValue CGRectValue];
//    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
//    CGFloat keyboardTop = keyboardRect.origin.y;
//    
//    // Resize the scroll view to make room for the keyboard
//    CGRect viewFrame = self.view.bounds;
//    viewFrame.size.height = keyboardTop - self.view.bounds.origin.y;
//    
//    self.scrollView.frame = viewFrame;
//    keyboardVisible_ = YES;
}

- (void) keyboardDidHide:(NSNotification *)notif {
    NSLog(@"%@", @"Received UIKeyboardDidHideNotification");
    
    if (!keyboardVisible_) {
        NSLog(@"%@", @"Keyboard already hidden.  Ignoring notification.");
        return;
    }
    
    // The keyboard was visible
    NSLog(@"%@", @"Resizing bigger with no keyboard");
    
    // Resize the scroll view back to the full size of our view
    self.scrollView.frame = self.view.bounds;
    keyboardVisible_ = NO;
}


-(IBAction) radioButtonClicked:(UIButton *) sender{
    
    
    [button1 setImage:[UIImage imageNamed:@"radio-on.png"] forState:UIControlStateNormal];
    radio = @"1 hr";
[button2 setImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
}

- (IBAction)radioButtonClicked2:(id)sender {
    [button2 setImage:[UIImage imageNamed:@"radio-on.png"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"radio-off.png"] forState:UIControlStateNormal];
    radio = @"2 hr";


}

- (IBAction)barButtonAction:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) alertStatus:(NSString *)msg :(NSString *) title
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

- (IBAction)sendbuttonAction:(id)sender {
    sqlite3_stmt    *statement;
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        //NSString *myString = [NSString stringWithFormat:@"%@",dateField.text];
        //int value = [myString intValue];
        NSString *insertSQL = [NSString stringWithFormat:
                               @"INSERT INTO CONTACTS (name, department, location,reason, date, late, remarks) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", '2007-01-01 10:00:00', \"%@\", \"%@\")",
                               nameTextfield.text, deptField.text, locationField.text,reasonField.text,radio, remarksTextview.text];
        NSLog(@"SQL:%@",insertSQL);
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_contactDB, insert_stmt,
                           -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            [self alertStatus:@"sucess" :@"data saved!"];


        } else {
            [self alertStatus:@"Failed." :@"storage Failed!"];

        }
        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
    
    if ([MFMailComposeViewController canSendMail])
    {
        // device is configured to send mail
        
        MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
           NSArray *toRecipients = [NSArray arrayWithObjects:@"gunasundari@xerago.com",nil];
           [controller setToRecipients:toRecipients];
        //[controller setToRecipients:[NSArray arrayWithObject:@"gunasundari@xerago.com"]];
        [controller setSubject:@"iPhone Mail"];
      //  NSString *emailBody = @"<p>name:</p>";
        NSString *emailBody = [NSString stringWithFormat:@"In %@ from %@ department in %@.i have %@ so i will be late by %@ on %@. remarks:%@", nameTextfield.text, deptField.text,locationField.text,reasonField.text, radio, dateField.text, remarksTextview.text];
        [controller setMessageBody:emailBody isHTML:YES];
        [self presentViewController:controller animated:YES completion:nil];
    }
    else
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"Device is not configured to send mail!"
                                                       delegate:nil cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
    }

    
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
