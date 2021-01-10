function y = Softmax(x)
%   x=100*x;
  ex = exp(x);
  y  = ex / sum(ex);
%   y1 = softmax.apply(x);
end