% PROGRAMA "METODO DE NEWTON-RAPHSON"
% CREADO POR CID RIOS GERARDO ALEXIS
% LIMPIAR VARIABLES Y PANTALLA
clear, clc
% SE DECLARA VARIABLE SIMBOLICA
syms x
% ENTRADA DE DATOS
h = input('Ingrese F(x) ');
f = inline(h);
% PRIMERA DERIVADA DE LA FUNCIÓN
derivada = diff(h);
dh = inline(derivada);
% IMPRESION DE FUNCION Y DE LA DERIVADA
fprintf(' ')
funcion = vpa(h,6);
der = vpa(derivada, 6);
fprintf('\n\n Función \n\n')
pretty(funcion)
fprintf('\n\n Derivada \n\n')
pretty(der)
% SEGUNDA ENTRADA DE DATOS
xi = input('Ingrese valor inicial: ');
tol = input('ingrese tolerancia: ');
% SE INICIA PRIMER ITERACION FUERA DEL CICLO PARA CALCULAR EL ERROR
pa = f(xi);
pd = dh(xi);
pc = xi-(pa/pd);
error = abs(pc-xi);
n = 0;
fprintf("\n\t I\t\t Xi\t\t f(Xi)\t f'(Xi)\t Xi+1\t\t Error\n")
fprintf('\t %d\t %.6f\t %+.6f\t %.6f\t %+.6f\t %.6f\t\n', n, xi, pa, pd, pc, error);
% SE INICIAN LAS ITERACIONES HASTA LLEGAR AL ERROR
% EN CADA ITERACIÓN SE VA GENERANDO LA TABLA Y SE VA IMPRIMIENDO
while ( error > tol )
 xi = pc;
 pa = f(xi);
 pd = dh(xi);
 pc = xi-(pa/pd);
 error = abs(pc-xi);
 n = n+1;
 if n == 50
 break
 end
 fprintf('\t %d\t %.6f\t %+.6f\t %.6f\t %+.6f\t %.6f\t\n', n, xi, pa, pd, pc, error);
end
% SE IMPRIME LA TOLERANCIA Y SOLUCIÓN
solucion = pc;
if n ~= 50
 fprintf('\n raiz encontrada con un tolerancia de %f:\t%f\n', tol, solucion)
elseif n == 50
 fprintf('\n Solucion no encontrada, revise funcion y valor inicial\n')
end