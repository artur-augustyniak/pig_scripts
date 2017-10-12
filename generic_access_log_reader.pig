DEFINE ApacheCommonLogLoader org.apache.pig.piggybank.storage.apachelog.CommonLogLoader();

logs = LOAD 's_access.log' USING ApacheCommonLogLoader AS (addr: chararray, logname: chararray, user: chararray, time: chararray, method: chararray, uri: chararray, proto: chararray, status: int, bytes: int);

addrs = GROUP logs BY addr;

counts = FOREACH addrs GENERATE flatten($0), COUNT($1) as count;

DUMP counts;
