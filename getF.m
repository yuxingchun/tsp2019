function F =getF(N)
a=0:N-1;
A=a'*a;
F=exp(-2*pi*1i*A/N)/sqrt(N);
end