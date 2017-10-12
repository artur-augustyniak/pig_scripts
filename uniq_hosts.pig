REGISTER hdfs://roberto:8020/user/aaugustyniak/elasticsearch-hadoop-2.3.2.jar;
A = load 's_access.log' using PigStorage('-') as (f0,f1,f2,f3,f4);
B = foreach A generate f0 as host:chararray;
C = distinct B;
-- dump C;
-- STORE C INTO 'access-log/hosts' USING org.elasticsearch.hadoop.pig.EsStorage('es.nodes=timmy', 'es.resource=access_log/uq_hosts');
STORE C INTO 'access-log/hosts' USING org.elasticsearch.hadoop.pig.EsStorage('es.nodes=timmy');
