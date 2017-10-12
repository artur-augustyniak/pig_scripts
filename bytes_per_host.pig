A = load './s_access.log' using PigStorage(' ');
B = FOREACH A GENERATE $0,$9;
C = GROUP B BY $0;
D = FOREACH C GENERATE group as host, SUM(B.$1);
E = distinct D;
rmf bp_hosts;
STORE E INTO 'bp_hosts' USING PigStorage(','); 
-- dump E;
