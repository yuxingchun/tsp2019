function D=getD(m,N)
n=0:2*N-1;
if m>=0
    D=diag(cos((2*pi*m*n)/(2*N)));
else
    D=diag(sin((2*pi*m*n)/(2*N)));
end
end