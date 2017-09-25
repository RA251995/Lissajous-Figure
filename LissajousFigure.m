A=1; B=1; a=7; b=22; phi=0;
t = 0:(pi/1000):2*pi;
x = A*sin(a*t);
y = B*sin(b*t+phi);
comet(x,y);
clear
