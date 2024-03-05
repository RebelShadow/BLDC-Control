uss = 35;
u0 = 30;

t1 = 1.051;
t3 = 1.076;

yt1 = 393;
yss = 391;
y0 = 335;

K = (yss-y0) / (uss-u0);

M = (yt1 - yss) / (yss - y0);
d = (log(1/M)) / (sqrt(pi^2 + log(M)^2));
T0  = t3 - t1;
T0 = T0*4;

wn = (2*pi) / (T0*sqrt(1-d^2));

num = K*wn^2;
den = [1 2*d*wn wn^2];

H = tf(num, den)

% %% First order
% yss = 1.7733e-14;
% y0 = 1.27e-14;
% uss = 35;
% u0 = 30;
% 
% K = (yss-y0)/(uss-u0)
% y = y0 + 0.9*(yss-y0)
% T = 1.018 - 1;
% num=[K];
% den=[T 1];
% H = tf(num, den)
% 

%% Regulator

Hf = H;

Ho = tf(1, [0.05 1])
Hr = Ho/(Hf-Ho*Hf)
Hr = Hr * tf(1, [0.01 1]) % asta doar pt second order
[num2, den2] = tfdata(Hr, 'v');