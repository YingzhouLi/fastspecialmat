function y = FastToeplitzSymVec(c,x)
% FASTTOEPLITZSYMVEC  Fast application of symmetric Toeplitz matrix.
%   y = FASTTOEPLITZSYMVEC(c,x) applies symmetric Toeplitz matrix generated
%   by c been the first column to vectors x. y returns the matrix vector
%   product y = Tx, where T is a symmetric Toeplitz matrix generated by c,
%   the corresponding symmetric Toeplitz matrix is defined as
%       -                                  -
%       |  c1    c2    c3  ...  cn-1   cn  |
%       |  c2    c1    c2  ...  cn-2  cn-1 |
%   T = |  c3    c2    c1  ...  cn-3  cn-2 | .
%       | ...   ...   ...  ...  ...   ...  |
%       | cn-1  cn-2  cn-3 ...   c1    c2  |
%       |  cn   cn-1  cn-2 ...   c2    c1  |
%       -                                  -
%   For a complex vector c, the upper triangular matrix is generated by the
%   conjugate of c.
%
%   See also FASTCIRCULANTVEC, FASTTOEPLITZVEC.

%   Copyright (c) 2015 Yingzhou Li, Stanford University

n = size(c,1);
cext = [conj(flipud(c(2:n)));c];
xext = [x;zeros(n-1,1)];
yext = ifft(fft(cext).*fft(xext));
y = yext(n:end);

end