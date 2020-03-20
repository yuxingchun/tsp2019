function [Qrm,Qim]=Qrim(m,N)
Qrm=[eij(N+1,N+1)+eij(N+1,m),-eij(N+1,N+1)+eij(N+1,m)];
Qim=[eij(N+1,N+1)+1i*eij(N+1,m),-eij(N+1,N+1)+1i*eij(N+1,m)];
end