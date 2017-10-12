A = load 'access.log' using PigStorage('"') as (f0,f1,f2);
B = foreach A generate f1;
C = distinct B;
dump C;

