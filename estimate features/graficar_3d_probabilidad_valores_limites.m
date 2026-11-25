clc;
clear all;
close all;
% 1. Definir los valores del eje X
t = linspace(0, 10*pi, 500);

% 2. Definir las funciones para los ejes Y y Z
x = sin(t);
y = cos(t);
z = t;

% 3. Crear la gráfica en 3D
figure;
plot3(x, y, z, 'LineWidth', 2, 'Color', 'b');

% 4. Agregar etiquetas y formato a los ejes
xlabel('Eje X');
ylabel('Eje Y');
zlabel('Eje Z');
title('Gráfica tridimensional en MATLAB');
grid on;
view(3); % Activar la vista 3D estándar

%%_____________________________________________
% 1. Definir los datos (Cada columna es una serie, en este caso 3 series)
% Filas: Categorías (ej. Enero, Febrero, Marzo, Abril)
% Columnas: Series (ej. Producto A, Producto B, Producto C)
datos = [
0.015,0.000,0.065;
0.031,0.000,0.022;
0.044,0.000,0.011;
0.040,0.000,0.022;
0.020,0.000,0.029;
0.028,0.000,0.012;
0.025,0.006,0.019;
0.040,0.003,0.016;
0.028,0.009,0.017;
0.033,0.008,0.020;
0.026,0.008,0.022;
0.028,0.009,0.005;
0.021,0.014,0.014;
0.019,0.017,0.016;
0.020,0.019,0.028;
0.022,0.025,0.023;
0.020,0.017,0.014;
0.026,0.034,0.029;
0.042,0.025,0.031;
0.028,0.017,0.025;
0.038,0.026,0.020;
0.041,0.029,0.033;
0.039,0.033,0.034;
0.041,0.036,0.022;
0.030,0.029,0.028;
0.033,0.031,0.023;
0.034,0.031,0.028;
0.028,0.053,0.025;
0.029,0.040,0.033;
0.021,0.048,0.028;
0.016,0.037,0.028;
0.015,0.059,0.040;
0.012,0.047,0.026;
0.005,0.037,0.031;
0.010,0.050,0.031;
0.007,0.048,0.028;
0.013,0.039,0.023;
0.003,0.025,0.023;
0.005,0.023,0.019;
0.007,0.017,0.009;
0.005,0.011,0.003;
0.002,0.012,0.005;
0.002,0.017,0.008;
0.002,0.005,0.003;
0.005,0.002,0.002;
0.001,0.000,0.003;
0.001,0.002,0.002;
0.000,0.002,0.000;
0.002,0.000,0.003;
0.000,0.000,0.000;
0.000,0.000,0.002;
0.000,0.002,0.000;
0.000,0.000,0.000

];



% 2. Crear el gráfico de barras en 3D
fig2 = figure('WindowState', 'maximized');
hbar = bar3(datos);

% 3. Personalizar los colores de cada serie para diferenciarlas mejor
% MATLAB por defecto colorea por filas, este bucle cambia el color por series (columnas)
for k = 1:length(hbar)
    hbar(k).CData = k * ones(size(hbar(k).CData)); % Asigna un ID de color único a cada serie
end
blue = [0.00 0.27 0.68];
orange = [0.90 0.50 0.10];
red = [0.65 0.00 0.00];
mis_colores=[0.90 0.50 0.10; 0.00 0.27 0.68;  0.65 0.00 0.00];
%colormap(jet); % Cambia la paleta de colores (puedes usar 'parula', 'vga', 'hot', etc.)
colormap(mis_colores);

% Modificamos la propiedad 'Width' para todas las series de barras
%for i = 1:numel(hbar)
%    hbar(i) = 1.0; 
%end

% 4. Configurar etiquetas y títulos
title('Percentage of frequency of low energy values by window - 3 Classes'); 
%porcentaje de la  frecuencia de valores de relacion energia por bandas 
xlabel('Classes'); %columnas de la tabla
ylabel('Ratio magnitude');  %magnitud de la relation entre bajas frecuencias / altas frecuencias
%y label son las filas de la tabla
zlabel('Relative Frequency (%)');


etiquetas_largas = {'0.1', '', '', '','0.5', '', '', ... 
    '', '0.9', '', '','', '1.3', '', '', '', '1.7', ... 
    '', '', '', '2.1','', '', '', '2.5', '', '', ... 
    '', '2.9', '', '','', '3.3', '', '', '', '3.7', ... 
    '', '', '', '4.1','', '', '', '4.5', '', '','', ... 
    '4.9','', '', '5.2'};
% Configurar los nombres de los ejes si es necesario
set(gca, 'XTickLabel', {'L', 'H', 'M'});
ax = gca;
ax.YTick = 1:numel(etiquetas_largas);
ax.YTickLabel = etiquetas_largas;

legend({'Low-flow river(LF)', 'High-flow rate (HF)', 'Moving Stone (MS)'},'Location', 'north' );

% 5. Activar la cuadrícula y ajustar la vista 3D por defecto
grid on;
view(3); % Vista tridimensional estándar
view(-66, 26); 

fig2.PaperPositionMode = 'auto'; 
print(fig2, 'grafico_alta_calidad_2019.tif', '-dtiff', '-r300');