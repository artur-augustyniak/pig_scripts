DEFINE ApacheCommonLogLoader org.apache.pig.piggybank.storage.apachelog.CommonLogLoader();
log = LOAD 's_access.log' USING ApacheCommonLogLoader AS (addr: chararray, logname: chararray, user: chararray, time: chararray, method: chararray, uri: chararray, proto: chararray, status: int, bytes: int);

requests = FOREACH log GENERATE addr, method, uri;

hosts_per_request = GROUP requests BY uri;

list = FOREACH hosts_per_request GENERATE group, FLATTEN(requests.method), FLATTEN(requests.addr);

res = distinct list;

DUMP res;