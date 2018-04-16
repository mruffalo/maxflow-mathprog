set V;
set E within V cross V;
param C {(u,v) in E} >= 0;
param s in V;
param t in V;

var X {(u,v) in E} >= 0, <= C[u,v];

maximize flow: sum {(u,t) in E} X[u,t];
subject to balance {v in (V diff {s, t})}:
  sum {(u,v) in E} X[u,v] = sum {(v,w) in E} X[v,w];

solve;
printf {(u,v) in E : X[u,v] > 0}: "%s %s %f", u,v,X[u,v];
end;
