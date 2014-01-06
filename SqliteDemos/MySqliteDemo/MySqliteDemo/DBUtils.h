//
//  DBUtils.h
//  MySqliteDemo
//
//  Created by su xinde on 14-1-6.
//  Copyright (c) 2014年 su xinde. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#define kFilename  @"testdb.sql"
@class sqlTestList;

@interface DBUtils : NSObject {
	sqlite3 *_database;
    
}

@property (nonatomic) sqlite3 *_database;
-(BOOL) createTestList:(sqlite3 *)db;//创建数据库
-(BOOL) insertTestList:(sqlTestList *)insertList;//插入数据
-(BOOL) updateTestList:(sqlTestList *)updateList;//更新数据
-(NSMutableArray*)getTestList;//获取全部数据
- (BOOL) deleteTestList:(sqlTestList *)deletList;//删除数据：
- (NSMutableArray*)searchTestList:(int)searchID;//查询数据库，searchID为要查询数据的ID，返回数据为查询到的数据
@end

@interface sqlTestList : NSObject
{
	int sqlID;
	NSString *sqlText;
}

@property (nonatomic) int sqlID;
@property (nonatomic, retain) NSString *sqlText;

@end

