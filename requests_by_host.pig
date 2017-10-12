DEFINE ApacheCommonLogLoader org.apache.pig.piggybank.storage.apachelog.CommonLogLoader();
log = LOAD 's_access.log' USING ApacheCommonLogLoader AS (addr: chararray, logname: chararray, user: chararray, time: chararray, method: chararray, uri: chararray, proto: chararray, status: int, bytes: int);

requests = FOREACH log GENERATE addr, method, uri;

requests_per_host = GROUP requests BY addr;

list = FOREACH requests_per_host GENERATE group, FLATTEN(requests.method), FLATTEN(requests.uri);

res = distinct list;

DUMP res;
