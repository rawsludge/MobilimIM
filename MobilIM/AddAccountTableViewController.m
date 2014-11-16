//
//  AddAccountTableViewController.m
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 09/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#import "AddAccountTableViewController.h"

@interface AddAccountTableViewController ()

@end

@implementation AddAccountTableViewController

@synthesize addAccount;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if( addAccount != nil) {
        _userName.text = addAccount.userName;
        _password.text = addAccount.password;
        _nickName.text = addAccount.nickName;
        _enabled.on = addAccount.enabled;
    }
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

- (IBAction)save:(UIBarButtonItem *)sender
{
    addAccount.userName = _userName.text;
    addAccount.password = _password.text;
    addAccount.nickName = _nickName.text;
    addAccount.enabled = _enabled.on ;
    [super saveAndDismiss];
}

- (IBAction)cancel:(UIBarButtonItem *)sender
{
    [super cancelAndDismiss];
}
@end
