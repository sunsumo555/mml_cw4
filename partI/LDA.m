% to be completed
function W = LDA(x,y)
  
  x = x';
  N = size(x)(2);
  X = x*(eye(N) - 1/N * ones(N,1) * ones(N,1)');
  
  M = zeros(size(y)(1));
  index = 1;
  for i = 1:max(y)
    n_class = size(y(y == i))(1);
    E = ones(n_class) / n_class;
    
    M(index:index+n_class-1,index:index+n_class-1) = E;
    index = index + n_class;
  end
  
  Sw = X * (eye(size(x)(2)) - M) * X';
  [u,l] = eig(Sw);
  Xb = u' * X * M;
  Q = PCA(Xb, max(y)-1);
  W = U*Q;