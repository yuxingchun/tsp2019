
# tsp2019
### 这是论文 复现 的代码
#### 求解下面的两个问题


![avatar](C:\Users\yuxingchun\Desktop\毕业设计.png)

- 问题18

问题18 有两种方法求解 ADMM 和改进IPM算法

ADMM算法现在 只写了一个框架 求解无约束优化问题的方法还没有想好


改进IPM算法大致完成了 还有一些点要改进  在cvx下，运行IPM.m即可

- 问题19

cvx求解 需要循环求解，因此需要改变最大迭代次数 设置最大迭代次数为1
%论坛上找到的方法
%对于sdp 设置下面 ‘maxit’意为最大迭代次数 1代表1次
cvx_solver_settings('maxit',1);

问题19有解析解，因此，求解十分容易，通过problem19.m 函数求解

现在代码写的还是太乱，后面要改进一下，避免出现这么多函数。

###所用杨老师代码
使用了杨老师toeplitz矩阵的范德蒙德矩阵分解函数，VanDec.m 这里要修改最后的 phase（不存在这个函数）换成angle

### 所用环境 
操作系统 Ubuntu 18.04

Matlab 2019b

cvx 2.2

Intel i7-8750@2.0GHz+64GB

