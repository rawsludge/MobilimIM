//
//  DataManager.m
//  MobilIM
//
//  Created by Ahmet ÖZTÜRK on 17/11/14.
//  Copyright (c) 2014 Ahmet ÖZTÜRK. All rights reserved.
//

#import "DataManager.h"

@interface DataManager()
-(NSURL *)applicationDocumentsDirectory;
@end


@implementation DataManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;


+(id)SharedInstance
{
    static DataManager *dataManager = nil;
    @synchronized(self) {
        if (dataManager == nil) {
            dataManager = [[DataManager alloc]init];
        }
    }
    return dataManager;
}

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

-(void)saveContext
{
    NSError *error;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if( managedObjectContext != nil) {
        if( [managedObjectContext hasChanges] &&  ![managedObjectContext save:&error] ){
            DDLogError(@"Unresolved error %@, %@", error, [error userInfo]);
        }
    }
}

-(NSManagedObjectContext *)managedObjectContext
{
    if(_managedObjectContext != nil)
        return _managedObjectContext;
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if( coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc]init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

-(NSManagedObjectModel *)managedObjectModel
{
    if( _managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    NSURL *modelUrl = [[NSBundle mainBundle]URLForResource:@"CoreData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelUrl];
    return _managedObjectModel;
}

-(NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if( _persistentStoreCoordinator != nil ) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"AppData.sqlite"];
    
    NSError *error = nil;
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self managedObjectModel]];
    if( ![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        DDLogError(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return  _persistentStoreCoordinator;
}

 -(NSArray *)accounts
 {
 NSFetchRequest *fetchedRequest = [[NSFetchRequest alloc]init];
 NSManagedObjectContext *context = [self managedObjectContext];
 
 NSEntityDescription *entity = [NSEntityDescription entityForName:@"Account" inManagedObjectContext:context];
 [fetchedRequest setEntity:entity];
 
 NSError *error = nil;
 return [self.managedObjectContext executeFetchRequest:fetchedRequest error:&error];;
 }
 

@end
