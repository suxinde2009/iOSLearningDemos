//
//  SQLiteDatabase.h
//
//  Created by  on 12-1-11.
//  Copyright (c) 2012 HJC. All rights reserved.
//  E-mail: hjcapple@gmail.com
//

#ifndef _SQLITEDATABASE_H_
#define _SQLITEDATABASE_H_


#include <string>
#include <vector>
#include <map>
#include "SQLiteResultSet.h"
#include "SQLiteValue.h"


class SQLiteDatabase
{
public:
    SQLiteDatabase();
    ~SQLiteDatabase();
    
    static bool isThreadSafe();
    
    bool open(const char* dbPath);
    bool close();
    
    bool cacheSQL(const char* sql);
    bool uncacheSQL(const char* sql);
    
    bool exec(const char* sql);
    bool exec(const char* sql, const SQLiteValue& v0);
    bool exec(const char* sql, const SQLiteValue& v0, const SQLiteValue& v1);
    bool exec(const char* sql, const SQLiteValue* values, int length); 
    
    SQLiteResultSet* query(const char* sql);
    SQLiteResultSet* query(const char* sql, const SQLiteValue& v0);
    SQLiteResultSet* query(const char* sql, const SQLiteValue& v0, const SQLiteValue& v1);
    SQLiteResultSet* query(const char* sql, const SQLiteValue* values, int length);
        
    bool isTableExists(const char* name) const;
    
 
private:
    SQLiteDatabase(const SQLiteDatabase& rhs);
    SQLiteDatabase& operator = (const SQLiteDatabase& rhs);
    
    bool databaseExists() const;
    void closeOpenedResultSets();
    void uncacheCachesResultSets();
    void resultSetDidfinalize(SQLiteResultSet* resultSet);
    int  numberOfRetries() const;
    void waitForRetry();
    
    SQLiteResultSet* findClosedCache(const char* sql);
    sqlite3_stmt* stmtPrepare(const char* sql);
    
    void bindValue(const SQLiteValue& value, int idx, sqlite3_stmt* stmt);
    void bindValues(const SQLiteValue* values, int length, sqlite3_stmt* stmt);
    
    
private:
    friend class SQLiteResultSet;    
    sqlite3*                                _db;
    std::string                             _dbPath;
    int                                     _numberOfRetries;
    std::vector<SQLiteResultSet*>           _openResultSets;
    std::map<std::string, SQLiteResultSet*> _cacheResultSets;
    SQLiteResultSet                         _reuseResultSet;
};


inline bool SQLiteDatabase::isThreadSafe()
{
    return sqlite3_threadsafe();
}


inline bool SQLiteDatabase::databaseExists() const 
{   
    return _db != NULL;    
}


inline int SQLiteDatabase::numberOfRetries() const     
{ 
    return _numberOfRetries;  
}


inline void SQLiteDatabase::waitForRetry()              
{ 
    usleep(20);               
}


#endif
