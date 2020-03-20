%ADMM算法
%main 主函数
%定义全局变量
%分辨率 N^{-1}
%最大迭代次数
max=200;
N=16;
gamma=0.1;
t=0:N-1;
f=0.25;
SNR=10;
sigma2=1/SNR;
eta=sqrt((N+2*sqrt(N))*sigma2);
%终止条件
eps=10^-6;
%初始条件 u0=0 向量 注意是复数变量
u=zeros(N,1);
%1i代表复数
xs=exp(2*pi*1i*f*t);
%加入高斯白噪声 SNR是信噪比
%awgn 是通讯工具箱里的函数
y=awgn(xs,SNR);
Z0=gamma.*eye(N);
T=topeplitz(u,u');
x=u;
for i=1:max
    Q1=[eta.*eye(N),x-y;(x-y)',eta];
    Q2=[T,x;x',trace(t)/N];
    B1=zeros(N+1,N+1);
    B2=zeros(N+1,N+1);
    %ADMM迭代求解
    [u,x,P1,P2,B1,B2]=admm(N,y,u,x,P1,P2,B1,B2,eta);
    %问题19的解析解
    Z=problem19(N,x);
   
end
