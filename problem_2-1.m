syms n

z = 0 : 1 : 100;
y = 0 : 1 : 100;

for i = 0 : 100
  N  = 11;
  n0 = 5;
  f1 = (n - n0) * (1 / N);
  V  = subs(f1, n, n0 : i);
  S_sum = sum(V);
  f2 = (N - 1) / N;
  V2 = subs(f2, n, (-N + 1) : i);
  S_sum2 = sum(V2);
  
  if i < n0
    y(i + 1) = 0;
  elseif i >= (n0 + N - 1)     
    y(i + 1) = (N - 1) / N;
  elseif i >= n0
    y(i + 1) = (i - n0) * (1 / N);
  end

end    

plot(z,y);
