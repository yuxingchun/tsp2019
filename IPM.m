N=16;%函数的输入，要删除
max=200;
gamma=0.1;
SNR=10;
sigma2=1/SNR;
eta=sqrt((N+2*sqrt(N))*sigma2);
%终止条件
eps=10^-6;
Z=gamma.*eye(N);
xs=sourcesignal(N);
y=awgn(xs,SNR);
%pro4 等价条件1
T=zeros(N,N); %输入 要删除
n=0:2*N-1;
F=getF(2*N);
L=[eye(N),zeros(N,N)];
D=diag(exp((1i*2*pi*n)/(2*N)));
W=(L*F)./(sqrt(N));
Qu=blkdiag(W,1);
Au=[];
for i=-(N-1):N-1
Au=[Au,diag(lamum(i,N))];
end
%u=rand(2*N-1,1);%测试用 要删除
% Au1=Qu*diag(Au*u)*Qu';
%pro 5 等价条件2
x=rand(N,1)+rand(N,1)*1i; %测试用 要删除
[Ar,Ai]=Ari(N);
[Qr,Qi]=Qri(N);
% Ar1=Qr*diag(Ar*real(x))*Qr';
% Ai1=Qi*diag(Ai*imag(x))*Qi';
%上面两个约束条件合成为一个约束条件
% w=[u;real(x);imag(x)];
C1=[-1*eta*eye(N),y;y',-1*eta];
C=blkdiag(C1,eye(N+1,N+1));
Q=[Qu,Qr,Qi];
A1=blkdiag(zeros(2*N+1,2*N-1),Ar,Ai);
A2=blkdiag(Au,Ar,Ai);
S=blkdiag(Q,Q);
A=[A1',A2'];
A=A';
%Tm=W*Dm*W';
a=geta(N,Z,W);
a1=[a,zeros(1,2*N)];
%改造一下aw 扩增成a1 后面2N项等于0 不会影响目标函数值
%使用cvx 求解
cvx_begin 
variable w(4*N-1) complex
min -1.*a1*w;
%约束条件用==
S*diag(A*w)*S'-C==semidefinite(2*(N+1),2*(N+1)); 
cvx_end
x=w(2*N:3*N-1)+1i*w(3*N:4*N-1);
% cvx_begin sdp
% variable u(2*N-1) complex
% w=[u,real(x),imag(x)];
% S*diag(A*w)*S'-C==semidefinite(2*(N+1),2*(N+1));
% cvx_end
%问题19的解析解
Z=problem19(N,x);

