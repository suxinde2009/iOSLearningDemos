//
//  ViewController.h
//  SQLiteDemo
//
//  Created by su xinde on 12-5-31.
//  Copyright (c) 2012年 su xinde. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController
{
    sqlite3 *contactDB;
    
    UITextField *name;
    UITextField *address;
    UITextField *phone;
    
    UILabel *status;    
    
    NSString *databasePath;
}

@property (retain,nonatomic)IBOutlet UITextField *name;
@property (retain,nonatomic)IBOutlet UITextField *address;
@property (retain,nonatomic)IBOutlet UITextField *phone;
@property (retain,nonatomic)IBOutlet UILabel *status;



@end
