clear all;
close all;
clc;

fun=input('Ingresa la función f(x): ','s');
a=input('Ingresa el limite inferior=');
b=input('Ingresa el limite superior=');
n=input('Ingrese numero de intervalos=');

f=inline(fun);

h=(b-a)/n;
s=0;

for i=1:n
    s=h/2*(f(a+(i-1)*h)+f(a+(i)*h))+s;
end

fprintf("Resultado= %10.15f", s)