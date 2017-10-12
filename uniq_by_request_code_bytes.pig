A = load 'access.log' using PigStorage('"') as (f0,f1,f2);
B = FOREACH A GENERATE f1, FLATTEN(STRSPLIT(f2, ' ')) as (f3,f4,f5, f6);
C = distinct B;
dump C;
