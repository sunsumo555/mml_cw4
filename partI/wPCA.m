% to be completed
function U = PCA(x,d)
  
  x=x';
  N = size(x)(2);
  X = x*(eye(N) - 1/N * ones(N,1) * ones(N,1)');
  
  S = X'*X;
  [v,l] = eig(S);
  u = X * v * l^-0.5;
  u_d = v(:,1:d);
  U = u_d * l^-0.5;