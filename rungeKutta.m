%{
How to use the program:
Suppose the 1st order ODE to be evaluated is:
y'=(xy)^2 -(y/x)
with an initial value of y(1)=1 and increment 0.1. Find the y value at 1.5
or up to 5 iterations
Enter the 1st order ODE or slope function: ((x*y)^2)-(y/x)
Select the initial x value:1
Select the initial y value:1
Select the increment value:0.1
Select what order of Runge-Krutta to use (1 is min. and 5 is max.):4
*This is arbitrary. 1st order (1) is Euler's method. There are 3 choices
for 2nd order (2): Heun's method (1); Midpoint method (2); Ralston's method
(3). 3rd order (3) is the commonly used. 4th order (4) is the classical
RK4. 5th order (5) is Butcher's method.*
If specified x value of 1.5:
Please choose what termination criteria you desire.
Press "1" for a specified x value and "2" for nth iteration:1
The specified x value is:1.5
If 5 iterations:
Please choose what termination criteria you desire.
Press "1" for a specified x value and "2" for nth iteration:2
The desired nth iteration (iterations will start from n=0) is:5
%}
%This is for inputs
clc;
syms x;
syms y;
m=input('Enter the 1st order ODE or slope function:');
s=inline(m);
d=str2func(['@(x,y)' s]);
f=str2func(['@(x,y)' vectorize(s)]);
x=input('Select the initial x value:');
y=input('Select the initial y value:');
h=input('Select the increment value:');
order=0;
order2=0;
n=0;
term=0;
while order==0
order=input('\nSelect what order of Runge-Krutta to use (1 is min. and 5 is max.):');
if order<1||order>5
    fprintf('Wrong input! The value must be between 1 and 5 only.\n');
    order=0;
end
end
if order==2
while order2==0
order2=input('Choose "1" for Heun method, "2" for Midpoint method, and "3" for Ralston method:');
if order2<1||order2>3
    fprintf('Wrong input! The value must be between 1 and 3 only.\n\n');
    order2=0;
end
end
end
%Lets the user choose which termination criterion it desires, whether be it a specified x value or nth iteration
while (term<1)||(term>2)
    term=input('\nPlease choose what termination criteria you desire.\nPress "1" for a specified x value and "2" for nth iteration:');
    if term==1
        val=input('The specified x value is:');
        itr=(val-x)/h;
        break;
    end
    if term==2
        itr=input('The desired nth iteration (iterations will start from n=0) is:');
        break;
    end
    fprintf('Wrong input! Please try again.\n\n');   
end
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
%This is the 1st order loop program
if order==1
for i=1:itr+1
    l=x;
    p=y;
    k1=f(x,y);
    y=p+(h*k1);
    x=x+h;
    fprintf('%2.0f %13.4f %13.4f %13.4f %17.4f\n',n,l,p,y,k1);
    n=n+1;
end
end
%This is the 2nd order Heun loop program
if order2==1
for i=1:itr+1
    l=x;
    p=y;
    x=x+h;
    y=y+(k1*h);
    k1=f(l,p);
    k2=f(x,y);
    fr=(0.5*k1)+(0.5*k2);
    y=p+(h*fr);
    fprintf('%2.0f %13.4f %13.4f %13.4f %17.4f\n',n,l,p,y,fr);
    n=n+1;
end
end
%This is the 2nd order Midpoint loop program
if order2==2
for i=1:itr+1
    l=x;
    p=y;
    x=x+(0.5*h);
    k1=f(l,p);
    y=y+(0.5*k1*h);
    k2=f(x,y);
    y=p+(h*k2);
    x=l+h;
    fprintf('%2.0f %13.4f %13.4f %13.4f %17.4f\n',n,l,p,y,k2);
    n=n+1;
end
end
%This is the 2nd order Ralston's loop program
if order2==3
for i=1:itr+1
    l=x;
    p=y;
    x=x+(0.75*h);
    k1=f(l,p);
    y=y+(0.75*k1*h);
    k2=f(x,y);
    fr=(k1/3)+(2*k2/3);
    y=p+(h*fr);
    x=l+h;
    fprintf('%2.0f %13.4f %13.4f %13.4f %17.4f\n',n,l,p,y,fr);
    n=n+1;
end
end
%This is the (classical) 3rd order  loop program
if order==3
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
    fprintf('%2.0f %13.4f %13.4f %13.4f %17.4f\n',n,l,p,y,fr);
    n=n+1;
end
end
%This is the (classical) 4th order loop program
if order==4
for i=1:itr+1
    l=x;
    p=y;
    x=x+(0.50*h);
    k1=f(l,p);
    y=p+(0.50*k1*h);
    k2=f(x,y);
    y=p+(0.5*k2*h);
    k3=f(x,y);
    y=p+(k3*h);
    x=l+h;
    k4=f(x,y);
    fr=(k1/6)+(k2/3)+(k3/3)+(k4/6);
    y=p+(h*fr);
    
    fprintf('%2.0f %13.4f %13.4f %13.4f %17.4f\n',n,l,p,y,fr);
    n=n+1;
end
end
%This is the Butcher's 5th order loop program
if order==5
for i=1:itr+1
    l=x;
    p=y;
    k1=f(l,p);
    
    x=l+(0.25*h);
    y=p+(0.25*k1*h);
    k2=f(x,y);
    
    y=p+(((k1/8)+(k2/8))*h);
    k3=f(x,y);
    
    x=l+(0.5*h);
    y=p+(((-k2/2)+k3)*h);
    k4=f(x,y);
    
    x=l+(0.75*h);
    y=p+(((3*k1/16)+(9*k4/16))*h);
    k5=f(x,y);
    
    x=l+h;
    y=p+(((-3*k1/7)+(2*k2/7)+(12*k3/7)-(12*k4/7)+(8*k5/7))*h);
    k6=f(x,y);
    
    fr=(7*k1/90)+(32*k3/90)+(12*k4/90)+(32*k5/90)+(7*k6/90);
    y=p+(h*fr);
    
    fprintf('%2.0f %13.4f %13.4f %13.4f %17.4f\n',n,l,p,y,fr);
    n=n+1;
end
end
%Interpretation of results
if term==1
fprintf('\nThe specified x value of %f is now reached at %.0fth iteration, with a y value of %.4f\n',val,n-1,p);
end
if term==2
fprintf('\nThe desired %.0fth iteration is now reached at an x value of %f, with a y value of %.4f\n',itr,l,p);
end