%%%%%%%%%%%%%%%SORU-1%%%%%%%%%%%%
%A)sawtooth
fs = 100000 %fs=100khz
t = 0:1/fs:1.5;
x1= sawtooth(2*pi*100*t); %f=100Hz
subplot(2,1,1)
plot(t,x1)
axis([0 0.2 -1.2 1.2])
%%
%B)square periodic wave
clc 
clear all
close all
fs = 1000000 %fs=1 MHz
f = 20 
t = 0:1/fs:1.5;
x2 = square(2*pi*f*t); %f=20 
plot(t,x2)
axis([0 0.2 -1.2 1.2])
%%
%C)Triangular Aperiodic Pulse
clc 
clear all
close all
fs = 100000 %fs=100khz
t = -1:1/fs:1;
x1 = tripuls(t,100e-3);
subplot(2,1,1)  %geniþlik 100 ms
plot(t,x1)
axis([-0.1 0.1 -0.2 1.2])
%%
%D)Rectangular Aperiodic Pulse
clc
clear all
close all
fs = 10000;
t = -1:1/fs:1;
x2 = rectpuls(t,50e-3);
subplot(2,1,1)
plot(t,x2)
%%
%E)Gaussian RF pulse
clc
clear all
close all
tc = gauspuls('cutoff',50e3,0.5,[],-60); 
t1 = -tc : 1e-6 : tc; 
y1 = gauspuls(t1,50e3,0.6);
plot(t1*1e3,y1)
title('Gauspulse')
%%
%F)Rectangular Train
clc 
clear all
close all
fs = 200E9;                 
D = [2.5 10 17.5]' * 1e-9;     
t = 0 : 1/fs : 2500/fs;        
w = 1e-9;                      
karedalga= pulstran(t,D,@rectpuls,w);
subplot(2,1,1)
plot(t*1e9,karedalga);
xlabel('Time (ns)')
ylabel('Amplitude')
title('Rectangular Train')
%%
%G)Gaussian Train 
clc
clear all
close all

T = 0 : 1/50e3 : 50e-3;
D = [0 : 1/1e3 : 50e-3 ; 0.6.^(0:50)]';
Y = pulstran(T,D,@gauspuls,50E3,.5);
plot(T*1e3,Y)
xlabel('Time (ms)')
ylabel('Amplitude')
title('Gaussian Pulse Train')
%%
%%%%%SORU-2%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
close all
N=10
n = 0:1:N-1
length(n)
%%%% unit step
Ramp=ones(1,N)
length(Ramp)
subplot(3,1,1)
stem(n,Ramp,'filled','r')
title('unit step')

%%% unit impulse
N=10
n=-N:1:N
length(n)
a1=zeros(1,N)
a2=ones(1,1)
new=[a1,a2,a1]
length(new)
subplot(3,1,2)
stem(n,new,'filled','g')
title('unit impulse')
%%% unit ramp

n=0:1:9
Ramp=ones(0:n)
subplot(3,1,3)
stem(n),(sgn),'filled','r'
x=[zeros(-5,0),Ramp,zeros(-5,n)]
stem(n,Ramp)
title('Ramp impulse')
%%%%%%%%%%SORU-3%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
close all
fs=1000
f=20
t=0:1/fs:0.1
x=cos(2*pi*f*t)
subplot(2,1,1)
plot(t,x,'LineWidth',2)
y=sin(2*pi*f*t)
subplot(2,1,2)
plot(t,y,'LineWidth',2)
grid on

clc 
clear all 
close all
n= -20:1:20
y1=sin(2*pi*n/36)
stem(n,y1)
x1=cos(2*pi*n/36),
stem(n,x1)
%%%%%%%%%%%SORU-4%%%%%%%%%%%%%%%%%%%
clc
clear all
close all

t= -10:1:10
g_even=(g(t)+g(-t))/2
g_odd=(g(t)-g(-t))/2
plot(t,g_odd)
plot(t,g_even)
%%%%%%%%%%%%%%SORU-5%%%%%%%%%%%%%%%%%%%%%%5
clc
clear all
close all 

n=-100:100
a=(0.9.^abs(n)).^sin(2*pi*n/4)
sum(abs(a.^2))
%%%%%%%%%%%%%%%%SORU-6%%%%%%%%%%%%%%%%%%%%%%
clc 
clear all
close all
f=1000
fs=100000
T=0:1/fs:5
x1=cos(2*pi*f*T)
plot(T,x1)
subplot(3,1,1)
y1=sin(2*pi*f*T)
plot(T,y1)
subplot(3,1,2)
f=1000
fs1=20000
fs2=50000
Ta=0:1/fs1:5
y3=sin(2*pi*f*Ta)
plot(Ta,y3)
subplot(3,1,3)
x4=cos(2*pi*f*Ta)
plot(Ta,x4)
subplot(3,2,1)
Tb=0:1/fs2:5
y5=sin(2*pi*f*Tb)
plot(Tb,y5)
subplot(3,2,2)
x6=cos(2*pi*f*Tb)
plot(Tb,x6)
subplot(3,2,3)
%%%%%%%%%%%%%%%%%%%%%%%SORU-7%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc 
clear all
close all
n=2:10
x=4+cos(2*pi*n/24);
xa=downsample(x,2,0);
x1=downsample(x,2,1);
ya=downsample(xa,2,0);
y1=downsample(x1,2,1);
subplot(3,1,1)
stem(x,'Marker','none')
ylim([0.5 3.5])
title('original signal')
subplot(3,1,2)
stem(ya,'Marker','none')
ylim([0.5 3.5])
ylabel('phase 0')
subplot(3,1,3)
stem(y1,'Marker','none')
ylim([0.5 3.5])
ylabel('phase 1')