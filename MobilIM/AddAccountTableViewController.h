//
//  AddAccountTableViewController.h
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 09/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#import "BaseTableViewController.h"
#import "Account.h"


@interface AddAccountTableViewController : BaseTableViewController

@property (nonatomic, strong)Account *addAccount;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *nickName;
@property (strong, nonatomic) IBOutlet UISwitch *enabled;

- (IBAction)save:(UIBarButtonItem *)sender;
- (IBAction)cancel:(UIBarButtonItem *)sender;

@end
