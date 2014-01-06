//
//  SQLiteResultSet.cpp
//
//  Created by  on 12-1-11.
//  Copyright (c) 2012 HJC. All rights reserved.
//  E-mail: hjcapple@gmail.com
//

#include "SQLiteResultSet.h"
#include "SQLiteDatabase.h"



SQLiteResultSet::SQLiteResultSet()
{
    _db = NULL;
    _pStmt = NULL;
    _cached = false;
}


void SQLiteResultSet::close()
{
    _closeNeedNoticeDb(true);
}


void SQLiteResultSet::_closeNeedNoticeDb(bool flag)
{
    if (_pStmt && _db)
    {
        SQLiteDatabase* db = _db;
        _db = NULL;
        
        sqlite3_reset(_pStmt);
        if (!_cached)
        {
            sqlite3_finalize(_pStmt);
            _pStmt = NULL;
        }
        if (flag)
        {
            db->resultSetDidfinalize(this);
        }
    }
}


bool SQLiteResultSet::next()
{
    bool needRetry = true;
    int numberOfRetries = _db->numberOfRetries();
    int rc = SQLITE_OK; 
    
    for (int idx = 0; needRetry && idx <= numberOfRetries; idx++)
    {
        needRetry = false;
        rc = sqlite3_step(_pStmt);
        if (rc == SQLITE_BUSY || rc == SQLITE_LOCKED)
        {
            needRetry = true;
            if (SQLITE_LOCKED == rc)
            {
                rc = sqlite3_reset(_pStmt);
            }
            _db->waitForRetry();
        }
    }
    
    return (rc == SQLITE_ROW);
}


