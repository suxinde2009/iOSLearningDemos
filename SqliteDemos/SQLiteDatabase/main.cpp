//
//  main.cpp
//  sqlite_base
//
//  Created by HJC on 12-2-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//  E-mail: hjcapple@gmail.com
//

#include <iostream>
#include "SQLiteDatabase.h"



int main (int argc, const char * argv[])
{
    SQLiteDatabase db;
    if (!db.open("/tmp/test.db"))
    {
        fprintf(stderr, "Can't open databse\n");
        exit(1);
    }
    
    if (db.isThreadSafe())
    {
        printf("thread safe\n");
    }
    
    if (db.isTableExists("Meta"))
    {
        db.exec("drop table Meta");
    }
    
    db.exec("create table Meta (key text primaray key, value text)");
    const char* insertSQL = "insert into Meta (key, value) values (?, ?)";
    
    const char* keys[] = { "version", "name", "os" };
    const char* values[] = { "1.0", "HJC", "Mac"   };
    
    db.cacheSQL(insertSQL);
    for (int i = 0; i < sizeof(keys)/sizeof(keys[0]); i++)
    {
        db.exec(insertSQL, SQLText(keys[i]), SQLText(values[i]));
    }
    db.uncacheSQL(insertSQL);
    
    
    SQLiteResultSet* rs = db.query("select * from Meta");
    printf("\n\n");
    if (rs)
    {
        while (rs->next())
        {
            printf("(key,value) = (%s, %s)\n", rs->columnText(0), rs->columnText(1));
        }
        rs->close();
    }
    
    rs = db.query("select * from Meta where key=?", SQLText(keys[0]));
    printf("\n\n");
    if (rs)
    {
        while (rs->next())
        {
            printf("(key,value) = (%s, %s)\n", rs->columnText(0), rs->columnText(1));
        }
        rs->close();
    }
    return 0;
}

