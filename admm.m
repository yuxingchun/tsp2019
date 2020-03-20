function [u,x,P1,P2,B1,B2]=admm(N,y,u,x,P1,P2,B1,B2,eta)
rho=0;
Q1=[eta.*eye(N),x-y;(x-y)',eta];
T=Toeplitz(u,u');
Q2=[T,x;x',trace(t)/N];
u=admm_u(x,P1,P2,B1,B2,rho);
x=admm_x(u,P1,P2,B1,B2,rho);
P1=admm_P1(u,x,P2,B1,B2,rho);
P2=admm_P2(u,x,P1,B1,B2,rho);
B1=B1+rho.*(P1-Q1);
B2=B2+rho.*(P2-Q2);
end