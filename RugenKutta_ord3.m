clear all; close all; clc
format long;

m=input('Enter the 1st order ODE or slope function:','s');

f=inline(m,'x','y');

x=input('Select the initial x value:');
y=input('Select the initial y value:');
h=input('Select the increment value:');
val=input('The specified x value is:');

itr=(val-x)/h;
n=0;

fprintf('\n');
%This is for labels
q='itrn';
w='x value';
b='current y';
t='solved y';
o='slope value';
k='      ';
a=[q,k,w,k,b,k,t,k,o];
disp(a);

for i=1:itr+1
    l=x;
    p=y;
    x=x+(0.50*h);
    k1=f(l,p);
    y=p+(0.50*k1*h);
    k2=f(x,y);
    y=p-(k1*h)+(2*k2*h);
    x=l+h;
    k3=f(x,y);
    fr=(k1/6)+(4*k2/6)+(k3/6);
    y=p+(h*fr);
    %fprintf('%2.0f %13.4f %13.4f %13.4f %17.4f\n',n,l,p,y,fr);
    M(i,:)=[n  l  p  y  fr];
    n=n+1;
end

disp(M);