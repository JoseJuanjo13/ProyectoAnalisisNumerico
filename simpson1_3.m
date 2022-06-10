%regla de simpson 1/3
clear all; close all; clc
format long;
syms x;

fun=input('Ingresa la función f(x): ','s');

f=inline(fun);

n=1;

while mod(n,2)~=0
    n=input('Ingrese el número de subintervalos: ');
    if mod(n,2)~=0
        disp('El número de subintervalos debe ser par, pulse una tecla para continuar')
        pause
    end
end
a=input('Ingrese el límite inferior de la integral: ');
b=input('Ingrese el límite superior de la integral: ');
h=(b-a)/n;
sumai=0;
sumap=0;
for i=1:2:n-1
    sumai=sumai+feval(f,h*i+a);
end
for i=2:2:n-2
    sumap=sumap+feval(f,h*i+a);
end
resultado=(h/3)*(feval(f,a)+4*sumai+2*sumap+feval(f,b));

funcion=str2func("@(x)"+ fun);
valorReal=integral(funcion,a,b);

error= (((valorReal-resultado)/valorReal)*100);

disp(['El resultado de la integral es ' num2str(resultado)])
disp(['El resultado de la integral es real ' num2str(valorReal)])
disp(['El porcentaje de error ' num2str(error) ' %'])

