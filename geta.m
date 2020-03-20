function a=geta(N,Z,W)
a=zeros(1,2*N-1);
for i=1:2*N-1
    m=i-N;
    Tm=W*getD(m,N)*W';
    Am=blkdiag(Tm,krDe(m,0));
    am=trace(blkdiag(Z,0)*Am);
    a(i)=am;
end
end