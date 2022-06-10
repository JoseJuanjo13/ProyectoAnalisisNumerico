clear, clc
syms x
% ENTRADA DE DATOS
funcion=input('Ingrese la funcion f(x)=','s');
x0=input('Ingrese valor inicial x0 ');
h=0.1;
h_2= h.^2;
func = inline(funcion);

% Calculos
f0=func(x0);      
f1=func(x0+h);   
f2=func(x0+(2*h));
f3=func(x0+(3*h));
f4=func(x0+(4*h));
f_1=func(x0-h);
f_2=func(x0-(2*h));
f_3=func(x0-(3*h));
f_4=func(x0-(4*h));


% 1 DERIVADA
Derivada_01_atras=((3*f0-4*f_1+f_2)/(2*h));
Derivada_01_centrada=((-f2+8*f1-8*f_1+f_2)/(12*h));
Derivada_01_adelante=((-f2+4*f1-3*f0)/(2*h));

% 2 DERIVADA

Derivada_02_atras=((2*f0-5*f_1+4*f_2-f_3)/h_2);
Derivada_02_centrada=((-f2+16*f1-30*f0+16*f_1-f_2)/12*h_2);
Derivada_02_adelante=((-f3+4*f2-5*f1+2*f0)/h_2);

% 3 DERIVADA
Derivada_03_atras=((5*f0-18*f_1+24*f_2-14*f_3+3*f_4)/(2*h.^3));
Derivada_03_centrada=((-f3+8*f2-13*f1+13*f_1-8*f_2+f_3)/(8*h.^3));
Derivada_03_adelante=((-3*f4+14*f3-24*f2+18*f1-5*f0)/(2*h.^3));

fprintf('Primera');

fprintf('\t %.6f', Derivada_01_atras);
fprintf('\t %.6f', Derivada_01_centrada);
fprintf('\t %.6f', Derivada_01_adelante);

sprintf('\nSegunda');

fprintf('\t %.6f', Derivada_02_atras);
fprintf('\t %.6f', Derivada_02_centrada);
fprintf('\t %.6f', Derivada_02_adelante);

sprintf('\nTercera');

fprintf('\t %.6f', Derivada_03_atras);
fprintf('\t %.6f', Derivada_03_centrada);
fprintf('\t %.6f', Derivada_03_adelante);

disp(h_2);