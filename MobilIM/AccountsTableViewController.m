//
//  AccountTableViewController.m
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 09/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#import "AccountsTableViewController.h"
#import "AppDelegate.h"
#import "AddAccountTableViewController.h"
#import "Account.h"


@interface AccountsTableViewController ()

//@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation AccountsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error = nil;
    if( ![[self fetchedResultsController]performFetch:&error]){
        NSLog(@"Error ! %@", error);
        abort();
    }
}
/*
-(NSManagedObjectContext *)managedObjectContext
{
    return [(AppDelegate*)[[UIApplication sharedApplication] delegate]managedObjectContext];
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections]count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections]objectAtIndex:section];
    return  [sectionInfo numberOfObjects];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    Account *account = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = account.userName;
    cell.detailTextLabel.text = account.nickName;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [super managedObjectContext];
        Account *account = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [context deleteObject:account];
        NSError *error;
        if( ![context save:&error]) {
            NSLog(@"Error! %@", error);
        }
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [[segue identifier]isEqualToString:@"addAccount"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        AddAccountTableViewController *addAccountViewController = (AddAccountTableViewController*)navigationController.topViewController;
        Account *addAcount = [NSEntityDescription insertNewObjectForEntityForName:@"Account" inManagedObjectContext:[self managedObjectContext]];;
        addAccountViewController.addAccount = addAcount;
    }
    if( [[segue identifier]isEqualToString:@"showAccount"]){
        
        NSIndexPath *selectedRowIndexPath = [self.tableView indexPathForSelectedRow];
        Account *account = [self.fetchedResultsController objectAtIndexPath:selectedRowIndexPath];
        UINavigationController *navigationController = segue.destinationViewController;
        AddAccountTableViewController *addAccountViewController = (AddAccountTableViewController*)navigationController.topViewController;
        addAccountViewController.addAccount = account;        
    }
         
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -fetched result controller section

-(NSFetchedResultsController *)fetchedResultsController
{
    if( _fetchedResultsController != nil)
        return _fetchedResultsController;
    
    NSFetchRequest *fetchedRequest = [[NSFetchRequest alloc]init];
    NSManagedObjectContext *context = [super managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Account" inManagedObjectContext:context];
    [fetchedRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"userName" ascending:TRUE];
    NSArray *sortDescriptors = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    fetchedRequest.sortDescriptors = sortDescriptors;
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchedRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:nil];
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}

#pragma mark -fetched result controller delegate
-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate:
        {
            Account *account = [self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = account.userName;
            cell.detailTextLabel.text = account.nickName;
            break;
        }
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

@end
