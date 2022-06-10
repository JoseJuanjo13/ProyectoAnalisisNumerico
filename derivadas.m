function [valorReal,valorCalculado,error] = derivadas(orden,incremento,vInicial,funcion,dec)
syms x
f=funcion;
x0=vInicial;
h=incremento;


%% Calculos
f0=f(x0);       f0=round(f0,dec);
f1=f(x0+h);     f1=round(f1,dec);
f2=f(x0+2*h);   f2=round(f2,dec);
f3=f(x0+3*h);   f3=round(f3,dec);
f4=f(x0+4*h);   f4=round(f4,dec);
f_1=f(x0-h);    f_1=round(f_1,dec);
f_2=f(x0-2*h);  f_2=round(f_2,dec);
f_3=f(x0-3*h);  f_3=round(f_3,dec);
f_4=f(x0-4*h);  f_4=round(f_4,dec);

%% Derivadas Numericas

% Primera derivada
Derivada_01_atras=double(((3*f0)-(4*f_1)+(f_2))/(2*h));
Derivada_01_atras=round(Derivada_01_atras,dec);

Derivada_01_centrada=double((-(f2)+(8*f1)-(8*f_1)+(f_2))/(12*h));
Derivada_01_centrada=round(Derivada_01_centrada,dec);

Derivada_01_adelante=double((-(f2)+(4*f1)-(3*f0))/(2*h));
Derivada_01_adelante=round(Derivada_01_adelante,dec);

% Segunda derivada
Derivada_02_atras=double(((2*f0)-(5*f_1)+(4*f_2)-(f_3))/(h^2));
Derivada_02_atras=round(Derivada_02_atras,dec);

Derivada_02_centrada=double((-(f2)+(16*f1)-(30*f0)+(16*f_1)-(f_2))/(12*h^2));
Derivada_02_centrada=round(Derivada_02_centrada,dec);

Derivada_02_adelante=double((-(f3)+(4*f2)-(5*f1)+(2*f0))/(h^2));
Derivada_02_adelante=round(Derivada_02_adelante,dec);

% Tercera derivada
Derivada_03_atras=(((5*f0)-(18*f_1)+(24*f_2)-(14*f_3)+(3*f_4))/(2*h^3));
Derivada_03_atras=round(Derivada_03_atras,dec);

Derivada_03_centrada=((-(f3)+(8*f2)-(13*f1)+(13*f_1)-(8*f_2)+(f_3))/(8*h^3));
Derivada_03_centrada=round(Derivada_03_centrada,dec);

Derivada_03_adelante=double((-(3*f4)+(14*f3)-(24*f2)+(18*f1)-(5*f0))/(2*h^3));
Derivada_03_adelante=round(Derivada_03_adelante,dec);

switch orden
    case 1
      valorCalculado(1,1)="ATRAS= "+string(Derivada_01_atras);
      valorCalculado(2,1)="CENTRADA= "+string(Derivada_01_centrada);
      valorCalculado(3,1)="ADELANTE= "+string(Derivada_01_adelante);
      
      Derivada=diff(f,x,1);
      valorReal=double(subs(Derivada,x0));
      valorReal=round(valorReal,dec); 

      error(1,1)="ATRAS= "+abs((valorReal-Derivada_01_atras)/(valorReal))*100+"%";
      error(1,2)="CENTRADA= "+abs((valorReal-Derivada_01_centrada)/(valorReal))*100+"%";
      error(1,3)="ADELANTE= "+abs((valorReal-Derivada_01_adelante)/(valorReal))*100+"%";

    case 2
      valorCalculado(1,1)="ATRAS= "+string(Derivada_02_atras);
      valorCalculado(2,1)="CENTRADA= "+string(Derivada_02_centrada);
      valorCalculado(3,1)="ADELANTE= "+string(Derivada_02_adelante);
      
      Derivada2=diff(f,x,2);
      valorReal=double(subs(Derivada2,x0));
      valorReal=round(valorReal,dec);

      error(1,1)="ATRAS= "+abs((valorReal-Derivada_02_atras)/(valorReal))*100+"%";
      error(1,2)="CENTRADA= "+abs((valorReal-Derivada_02_centrada)/(valorReal))*100+"%";
      error(1,3)="ADELANTE= "+abs((valorReal-Derivada_02_adelante)/(valorReal))*100+"%";
    case 3
      valorCalculado(1,1)="ATRAS= "+string(Derivada_03_atras);
      valorCalculado(2,1)="CENTRADA= "+string(Derivada_03_centrada);
      valorCalculado(3,1)="ADELANTE= "+string(Derivada_03_adelante);
      
      Derivada3=diff(f,x,3);
      valorReal=double(subs(Derivada3,x0));
      valorReal=round(valorReal,dec);

      error(1,1)="ATRAS= "+abs((valorReal-Derivada_03_atras)/(valorReal))*100+"%";
      error(1,2)="CENTRADA= "+abs((valorReal-Derivada_03_centrada)/(valorReal))*100+"%";
      error(1,3)="ADELANTE= "+abs((valorReal-Derivada_03_adelante)/(valorReal))*100+"%";
end



end