% A_cpu = rand(1000, 1000); % Un arreglo normal en la CPU
% A_gpu = gpuArray(A_cpu); % Mueve el arreglo a la GPU
% 
% B_gpu = A_gpu * A_gpu; % Multiplicación de matrices en la GPU
% 
% B_cpu = gather(B_gpu); % Trae el resultado de vuelta a la CPU

close all; % cierra figuras
clear all; %Limpia el espacio de trabajo
clc; % limpia 
disp('Cargando sonido piedras:');
graficos_tipo_impac=0; % 1 = si grafica   y    0 = no grafica

piedra1=[0.39862,0.09518,0.18758;
    0.39943,0.24460,0.31630;
    0.31877,0.38235,0.44024;
    0.55076,0.70411,0.64120;
    0.83322,0.90388,0.54440;
    0.34495,0.91678,0.79506;
    0.56616,0.42138,0.41058;
    0.29635,0.1504,0.21674;
    0.32523,0.12998,0.12591;
    0.01769,0.02921,0.00022];

piedra2=[0.03600,0.02734,0.01879;
    0.04272,0.03934,0.01735;
    0.05006,0.04007,0.03421;
    0.07427,0.11853,0.02957;
    0.13744,0.25963,0.02686;
    0.17005,0.15888,0.07359;
    0.20480,0.24971,0.19633;
    0.33723,1,0.26048;
    0.26929,0.59912,0.08904;
    0.04389,0.07104,0.00814];

piedra3=[0.22950,0.28263,0.17371;
    0.24984,0.28235,0.25714;
    0.25097,0.25114,0.20277;
    0.39312,0.31424,0.27421;
    0.30291,0.75906,0.70135;
    0.56787,0.53018,1;
    0.72469,0.85525,0.63639;
    0.09046,0.30806,0.33665;
    0.04613,0.06465,0.05576;
    0.00278,0.00779,0.00852];

piedra3=[0.21289,0.21755,0.25611;
    0.19508,0.19984,0.12499;
    0.23896,0.22618,0.20897;
    0.18781,0.24307,0.29343;
    0.27268,0.53057,0.34001;
    0.46624,0.56622,0.83713
    0.40757,0.86886,0.76828;
    0.06197,0.08201,0.09670;
    0.01820,0.07178,0.03668;
    0.00560,0.05678,0.00367];

piedra4=[0.32891,0.19896,0.30892;
    0.35991,0.36641,0.30493;
    0.34303,0.27102,0.23183;
    0.32918,0.23389,0.41780;
    0.37818,0.48139,0.38269;
    0.30183,0.81875,0.28152;
    0.35905,0.79765,0.24859;
    0.52583,0.26067,0.29457;
    0.35108,0.37972,0.16470;
    0.10404,0.05718,0.05700];

piedra5=[0.157685,0.15348,0.14403;
0.15856,0.20611,0.12768;
0.17289,0.28986,0.25317;
0.30512,0.55574,0.25790;
0.39563,0.43395,0.49608;
0.52540,0.62789,0.52443;
0.34961,0.23171,0.26851;
0.14366,0.25509,0.07869;
0.04738,0.24674,0.10305;
0.00752,0.02380,0.05581];

piedra6=[0.10952,0.13744,0.20197;
0.19477,0.24019,0.26779;
0.38624,0.37382,0.24672;
0.36358,0.46546,0.57364;
0.62317,0.47910,0.49770;
0.37304,0.42880,0.22150;
0.78673,0.17576,0.41650;
0.46609,0.20056,0.20472;
0.39938,0.07938,0.12308;
0.00704,0.01193,0.00870];


piedra7=[0.04157,0.04316,0.06232;
0.02221,0.06569,0.08729;
0.03821,0.06607,0.07686;
0.07946,0.12679,0.06638;
0.05230,0.10680,0.08666;
0.08177,0.19813,0.16252;
0.10940,0.39139,0.19944;
0.07740,0.28375,0.38465;
0.10179,0.35396,1;
0.02398,0.25747,0.25372];

% el siguiente funciona mejor
piedra7=[0.03352,0.04157,0.04316;
0.02730,0.02221,0.06569;
0.02701,0.03821,0.06607;
0.02708,0.07946,0.12679;
0.02504,0.05230,0.10680;
0.02191,0.08177,0.19813;
0.02747,0.10940,0.39139;
0.02169,0.07740,0.28375;
0.00996,0.10179,0.35396;
0.00220,0.02398,0.25747];

piedra8=[0.04642,0.11140,0.07529;
    0.13975,0.20389,0.06929;
    0.32706,0.40137,0.16619;
    0.22847,0.26140,0.20455;
    0.24241,0.18714,0.13249;
    0.29969,0.16244,0.19252;
    0.32628,0.21069,0.34576;
    0.69052,0.47666,0.16086;
    0.60702,0.26633,0.16720;
    0.03441,0.01227,0.01241];

piedra9=[0.14153,0.06633,0.07461;
    0.24188,0.22666,0.095102;
    0.83779,0.23595,0.297138;
    0.37498,0.24530,0.432860;
    0.28680,0.14783,0.17133;
    0.19712,0.22930,0.09928;
    0.16211,0.13232,0.20315;
    0.13357,0.100104,0.85830;
    0.36427,0.11775,0.50446;
    0.01462,0.00591,0.01430];

disp('Configuración para el proceso de grabado');

disp('----------MENU DE OPCIONES---------');
disp('(1). Rio nivel normal, balbuceante');
disp('(2). Rio caudaloso');
disp('(3). Rio con desplazamiento de piedras');

disp('(4). Pruebas validar algoritmo');
disp('(5). Para extraer segmento sonido piedras');
mensaje='Digite una opcion:';
opcion_usuario=input(mensaje);
tic
titulo_fft1=' Rio nivel normal, balbuceante';
titulo_fft2=' Rio caudaloso';
titulo_fft3=' Rio con desplazamiento de piedras';

folderPath = 'd:\doctorado\art_udistrital_2026'; % Reemplaza con la ruta correcta
if (opcion_usuario==1)
    folderPath = 'd:\doctorado\art_udistrital_2026\normal_aumentado';
    folderPathr = 'd:\doctorado\art_udistrital_2026\resultados\caracte_normal';
    folderPathr2 = 'd:\doctorado\art_udistrital_2026\resultados\carcte_normal\clase_n';
    clase='normal';clasen='0';
end
if (opcion_usuario==2)
    folderPath = 'd:\doctorado\art_udistrital_2026\caudaloso_aumentado';
    folderPathr = 'd:\doctorado\art_udistrital_2026\resultados\caracte_caudaloso';
    folderPathr2 = 'd:\doctorado\art_udistrital_2026\resultados\caracte_caudaloso\clase_c';
    clase='caudaloso';clasen='1';
end

if (opcion_usuario==3)
    folderPath = 'd:\doctorado\art_udistrital_2026\impacto_aumentado';
    folderPathr = 'd:\doctorado\art_udistrital_2026\resultados\caracte_impacto';
    folderPathr2 = 'd:\doctorado\art_udistrital_2026\resultados\caracte_impacto\clase_i';
    clase='piedras';clasen='2';
end

if (opcion_usuario==4)
    folderPath = 'd:\doctorado\art_udistrital_2026\pruebas';
    folderPathr = 'd:\doctorado\art_udistrital_2026\resultados\pruebas';
    folderPathr2 = 'd:\doctorado\art_udistrital_2026\resultados\pruebas\clase_p';
    clase='prueba';clasen='4';
end
if (opcion_usuario==5)
    folderPath = 'd:\doctorado\semestre_8\analisis_sonido\para_recorte';
    folderPathr = 'd:\doctorado\semestre_8\analisis_sonido\resultados\para_recorte';
    folderPathr2 = 'd:\doctorado\semestre_8\analisis_sonido\resultados\para_recorte';
    clase='prueba';clasen='5';
end
fileList = dir(folderPath);
% Filtrar solo los archivos (excluir directorios "." y "..")
fileNames = {fileList( ~[fileList.isdir] ).name};

% Mostrar los nombres de los archivos
disp(fileNames);
titulo_general='Sonidos rio normal';

[fila_archivos, total_archivos]=size(fileNames);
% lo siguiente para evitar qe se realice más de 15 veces
%total_archivos=2;
consolidado=zeros(total_archivos,37);
 
limitey=0.4;

rec0a700(total_archivos ,15)=zeros; % para guardar las sumas de los contenedoresde 0 a 700

for zz=1:1:total_archivos  %luego hasta total archivos
   
%normalmnete de 0 a 2.1, solo el diapason da 4
%un rayo cercano llega a 16 y el trueno a 6; un perro cerca 18
% un perro  ladra distancia y fuerte es 6
sonido1=strcat(folderPath,'\');
sonido1=strcat(sonido1,string(fileNames(1,zz)));

[X0,Fs1] = audioread(sonido1);  
%player = audioplayer(X0,Fs1);
% play(player);

%Representación de las muestras de audio.
%plot(X0); 
X00=normalize(X0); %genera errores en las magnitudes, pasa de -0.15 y +0.15
% lo normaliza a -15 y +15, por lo anterior se cambia de función a:
%X00=rescale(X0, -1, 1);
%X00=soundsc(X0);

titulo_fft1="fft de un audio capturado por micrófono";
segmentos=0;
% como wav es de 44100, se trabaja por ventanas de 200ms
% 44100/5=8820
x1_segmentos=zeros(8820,15); % 15 segmentos
for i=1:1:15 %desde uno, con incrementos de uno; hasta 12
    inicio=i-1;
    ini=inicio*8820;
    fin=ini+8820;
    x1_segmentos(:,i)=X00(ini+1:fin,1);
end

    NFFT1 = 2^nextpow2(8820);
    %permite aproximar a un valor que es potencia de 2
    L1=8820;
    
    imagen1r=strcat(folderPathr,'\'); % saca la ruta
    aux_s=string(fileNames(1,zz)); % obtinene el nombre
    encuentra_punto=strfind(aux_s,'.');% encuentra un punto en la cadena
    recorte=extractBetween(aux_s,1,encuentra_punto);%recorta hasta el punto
    aux_s2=strcat(imagen1r,recorte);%suma la ruta y el nombre del archivo
    aux_s2=strcat(aux_s2,'avi');% a la ruta y nombre le suma la extension
    aux_s3=char(aux_s2);
   
    
%     outputVideo = VideoWriter(aux_s3);    % Create VideoWriter object
%     outputVideo.FrameRate = 5;                                    % Set frame rate for corresponding pause duration
%     open(outputVideo)
    fre15(15,316)=zeros;
    
    a_rolloff(1,15)=zeros;
    a_rolloff_energia(1,15)=zeros;
    a_cpc(1,15)=zeros;
    a_centroide(1,15)=zeros;
    a_magnitudt(1,15)=zeros;
    a_entropia_tem(1,15)=zeros;
    a_entropia_esp(1,15)=zeros;
    a_max_cont70(1,15)=zeros;
    a_max_cont140(1,15)=zeros;
    a_max_cont210(1,15)=zeros;
    a_max_cont280(1,15)=zeros;
    a_max_cont350(1,15)=zeros;
    a_max_cont420(1,15)=zeros;
    a_max_cont490(1,15)=zeros;
    a_ber_esp(1,15)=zeros;
    
    
    
for jj=1:1:15  %desde 1, con incrementos de 1,hasta 15 ventanas
        X1=x1_segmentos(:,jj);
        Y1 = fft(X1, NFFT1)/L1;
     
        periodo=1/Fs1;%tiempo entre cada muestra
        tiempo_seg=(length(X1)-1)/Fs1; %calcula el tiempo a partir de la 
        %frecuencia de muestreo y el número de muestras
        t1=0:periodo:tiempo_seg;
       

        
        f1 = Fs1/2*linspace(0,1,NFFT1/2+1);
        %f1 contiene las frecuencias 
        cant_muestras_de2a_la_n=NFFT1/2+1;
        magnitud_fft=2*abs(Y1(1:cant_muestras_de2a_la_n));
        % lo anterior para tomar solo la mitad del espectro, no se considera
        % frecuencias negativas
        % se aplica (abs) para pasar la magnitud compleja de la FFT
        %a una double
        
        %% paso 1, calcular la potencia de cada frecuencia
        %recuerde que: f1 son las frecuencias, magnitud_fft
        potencia=magnitud_fft.^2;

        %% paso 2: se determina un umbral cuando se considera que no existe 
        %novedad, a manera de ejemplo calculamos el promedio de la potencia
        media_potencia=mean(potencia);

        %%paso 3: se dividen en contenedores, esta vez contenedores 
        %cada 70 Hz
        len5=length(f1); % con wav 44100*tiempo_en_seg
        %f1 tiene 1x8193, en la posicion 8193 el valor que
        %contiene es 22050 Hz, ese valor se asigna a frec_maxima
        frec_maxima=f1(1,len5); %len5=8193

        contenedores_por_grupohz=floor(frec_maxima/70);
        %=floor(22050/70)=floor(315)=315
        % cada contenedor abarca 70 Hz
        % floor redondea hacia el infinito negativo, es decir que lo pasa de 
        %315,x a 315

        %la posicion 2 de frecuencia contiene el factor de incremento de frecuencia
        %f1(1,2), la primera posicion f1(1,1)=0;
        frec_por_elemento_de_f1=f1(1,2);
        grupos_f1_para_70hz=70/frec_por_elemento_de_f1;
        grupos_f1_para_70hz=floor(grupos_f1_para_70hz);
        indice=0;

        %desde 1, con incrementos de grupos_f1_para_70hz, 
        %hasta longitud de potencia
        %for p=1:26:8193
        for p=1:grupos_f1_para_70hz:length(potencia)
            indice=indice+1;% calcula el numero de segmentos
        end 

        %ahora se debe sumar las potencias cadagrupos_f1_para_70hz
        % elementos; es decir cada 26 muestras
        que_no_desborde=length(potencia)-grupos_f1_para_70hz;
        % 8193 - 26= 8167
        i=0;
        for p=1:grupos_f1_para_70hz:que_no_desborde 
            suma_double=sum(potencia(p:p+grupos_f1_para_70hz),'double');
             i=i+1;
            fre15(jj,i)=suma_double;
            %suma_periodo = sprintf('suma periodo sub %d = %0.4f\r\n',i,suma_double);
           %display(suma_periodo);
        end
        
        %% lo siguiente para verificar el espectro por contenedores

%         figure(3);
%         set(gcf, 'WindowState', 'maximized');
%         bar(fre15(jj,1:71));
        % Establecer el límite superior del eje Y en 0.0020
        ylim([0, limitey]);%normalmnete de 0 a 2.1, solo el diapason da 4
        %un rayo cercano llega a 16 y el trueno a 6; un perro cerca 18
        % un perro  ladra distancia y fuerte es 6
%         xlabel('Contenedores en Hz (x10), ZCR/2.5');
%         ylabel('Sumatoria Potencia');
%         title('Potencia por contenedores desde 0 Hz a 5000 Hz');
%         xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 ...
%             20 21 22 23 24 25 26 27 28 29 30 ...
%             31 32 33 34 35 36 37 38 39 40 ...
%             41 42 43 44 45 46 47 48 49 50 ...
%             51 52 53 54 55 56 57 58 59 60 ...
%             61 62 63 64 65 66 67 68 69 70 71]);
%         xticklabels({'7','-','21','-','35','-','49','-','63','-', ...
%             '77','-','91','-','105','-','119','-','133','-','147', ...
%             '-','161','-','175','-','189','-','203','-'...
%             '217','-','231','-','245','-','259','-','273','-','287','-','301', ...
%             '-','315', '-','329','-','343','-','357','-','371','-','385', ...
%             '-','399','-','413','-','427','-','441','-','455','-', ...
%             '469','-','483','-','497'});
        
        
        %% ahora se calcula rolloff
        frec_por_elemento_de_f1=f1(1,2);
        posiciones_a_sumar=floor(5000/frec_por_elemento_de_f1);
        indice=0; 
        for p=1:posiciones_a_sumar
            suma_double=suma_double+potencia(p,1);
             indice=indice+1;% calcula el numero de segmentos
        end 
        aux=suma_double*0.95;
        es=suma_double/indice;
        disp('La sumatoria de la energia desde 0Hz hasta 4970 Hz es:');
        disp(es);
        ep=es*0.95;
        disp('El 95% de la energía corresponde a:');
        disp(ep);

        %ahora se debe verificar desde un Hz hasta encontrar el 95% de la energía
        posicion=0; suma_verificar=0;

        for p=1:posiciones_a_sumar
            suma_verificar=suma_verificar+potencia(p,1);
            %indice es el numero de elementos del vector
            %que se requieren hasta llegar a los 10000Hz
            posicion=posicion+1;
            if (suma_verificar>aux)
                a_rolloff_energia(1,jj)=suma_verificar; 
                % para guardar la energía al 95%
                break;
            end    
        end 
        disp('Posicion en la cual se supera el 95% de energia:');
        disp(posicion);
        frecuencia_limite=posicion*frec_por_elemento_de_f1;
        frecuencia_limite=floor(frecuencia_limite);
        disp('Frecuencia de corte en Hz:');
        disp(frecuencia_limite);
        a_rolloff(1,jj)=frecuencia_limite;   
        % Agregar una línea vertical en x = contenedor_rollof con estilo de
        % línea punteada y color rojo
        contenedor_rollof=floor(frecuencia_limite/70);
        %xline(contenedor_rollof, '--r', 'RollOff 95%');
        %% se calcula cruces por cero
        acum=0;
        L1 = length(X1);% se calcula la longitud de X1
        for (i=2:1:L1)
            %valor absoluto sign(x(n))-sign(x(n-1))
            aux=sign(X1(i))-sign(X1(i-1));
            abs_aux=abs(aux);
            un_medio_de_abs_aux=0.5*abs_aux;
            acum=acum+un_medio_de_abs_aux;
        end
        ZCR=acum*(Fs1/L1);
        ZCR=floor(ZCR);
        disp('Cruces por cero en un segundo de lectura:');
        disp(ZCR);
        a_cpc(1,jj)=ZCR;
        % Agregar una línea vertical en x = contenedor_rollof con estilo de
        % línea punteada y color rojo
        contenedor_ZCR=floor(ZCR/(70*2.5));
        % se multiplica por 3 al dividir, ya que los cruces por cero son
        % superiores a 5000
        %xline(contenedor_ZCR, '--g', 'RPC/2.5');

        %% calculando el centroide

        %Se procesan solo X1 con 8820 exactamente
        centroid = spectralCentroid(X1,Fs1);
        promedio_centroide=mean(centroid);
        a_centroide(1,jj)=promedio_centroide;
        disp('El centroide es:'); disp(promedio_centroide);
        contenedor_centroide=floor(promedio_centroide/70);
        %xline(contenedor_centroide, '--b', 'Centroide                  .');

        %% calculando la magnitud
        acum=0;
        L1 = length(X1);% se calcula la longitud de X1
        for (i=1:1:L1)
            aux=abs(X1(i));
            acum=acum+aux;
        end
        magnitud=acum/L1; %sobre el total de las muestras
        disp('La magnitud es:'); disp(magnitud);
        %yline(magnitud, '--m', 'Magnitud');
        a_magnitudt(1,jj)=magnitud;

        %% calculando la entropia temporal
        maxima=max(X1);
        minima=min(X1);
        diferencia=maxima-minima;
        rango_entropia=diferencia/10;
        rango_ent=minima:rango_entropia:maxima;
        valor_acum=zeros(1,10);
        for (i=1:1:L1)
             for (z=1:1:10)
                 mini=rango_ent(1,z);
                 maxi=rango_ent(1,z+1);
                 if ((X1(i,1)>=mini)&&(X1(i,1)<maxi))
                     valor_acum(1,z)=valor_acum(z)+1;
                 end    
             end
        end
        % ahora se calcula la probabilidad  
        %  8819--------->1
        %  valor_acum---->proba_ent_tem
        proba_ent_tem=zeros(1,10);
        for (z=1:1:10)
            proba_ent_tem(1,z)=valor_acum(1,z)/8819;
        end
        sumatoria=0;
        for (i=1:1:10)
            valor_dif0=proba_ent_tem(1,i);
            if (valor_dif0~=0)
                aux=proba_ent_tem(i).*log2(proba_ent_tem(i));
                sumatoria=sumatoria+aux;
            end     
        end
        entropia_temp=-sumatoria;
        disp('Valor de la entropia temporal es:');
        disp(entropia_temp);
        %yline(entropia_temp/20, '--c', 'Entropia temp/20');
        a_entropia_tem(1,jj)=entropia_temp;
        %% calculando la entropia espectral hasta 5000 Hz
        % las siguientes 7 líneas se repiten desde rolloff
        frec_por_elemento_de_f1=f1(1,2);
        posiciones_a_sumar=floor(5000/frec_por_elemento_de_f1);
        indice=0; 
        for p=1:posiciones_a_sumar
            suma_double=suma_double+potencia(p,1);
             indice=indice+1;% calcula el numero de segmentos
        end 
        % lo siguiente desde: 
        % https://dsp.stackexchange.com/questions/23689/what-is-spectral-entropy
        %1. calcular el espectro de la señal
        %2. Calcular la densidad espectral de potencia, como el cuadrado 
        % y normalizado con el número de contenedores = potencia
        %3. Normalizar la DSP, para ello se divide cada elemento de la potencia entre la
        % sumatoria de la dsp a la frecuencia limite, en este caso hasta los
        % 5000 Hz, en este caso potencia_entropia
        poten_entropia_esp=potencia / suma_double;
        %4. Calcular la entropia
        sumatoria_ent_esp=0;
        for (i=1:1:posiciones_a_sumar)
            valor_dif0=poten_entropia_esp(i,1);
            if (valor_dif0~=0)
                aux=poten_entropia_esp(i,1).*log2(poten_entropia_esp(i,1));
                sumatoria_ent_esp=sumatoria_ent_esp+aux;
            end     
        end
        entropia_espec=-sumatoria_ent_esp;
        disp('Valor de la entropia espectral:');
        disp(entropia_espec);
        %yline(entropia_espec/20, '--k', 'Entropia espect/ 20');
        a_entropia_esp(1,jj)=entropia_espec;
        %% calculando BER:  
        % Razon entre energías de frecuencias bajas vs frecuencias altas
        % Las frecuecias bajas para el oido humano es inferior a 280 Hz,
        % los instrumentos en estas frecuencias: bombo, fagot, trombón,
        % trueno, voz humana profunda. Esto es un sonido grave.
        
        % Las frecuenias intermedias se encuentran entre 251 a 5000 Hz
        
        % Los sonidos agudos so superiores a 5000 Hz
        
        % por lo anterior se trabaja con la sumatoria de los 4 primeros contenedores,
        % dividido entre los contenedores desde el 5 al 71
        suma_4cont=0;
        for p=1:4
            suma_4cont=suma_4cont+fre15(jj,p);
        end 
        suma_67cont=0;
        for p=5:71
            suma_67cont=suma_67cont+fre15(jj,p);
        end 
        ber_frec=suma_4cont/suma_67cont;
        disp('Valor de la BER (razón entre bajas_frec/altas_frec) :');
        disp(ber_frec);
        %yline(ber_frec/5, '--g', 'BER HZ/ 5');
        a_ber_esp(1,jj)= ber_frec;
        
        text(70, 0.39, string(jj), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'black');
        %% ahora se construye el fotograma
        %drawnow
        %fig=figure(3);
        %img = getframe(fig);                  % Obtain figure as movie frame
        %writeVideo(outputVideo, img);   % Write image to video
    end
    %close(outputVideo)                  % Close video file
    
%% para guardar video sin audio    
    imagen1r=strcat(folderPathr,'\'); % saca la ruta
    aux_s=string(fileNames(1,zz)); % obtinene el nombre
    encuentra_punto=strfind(aux_s,'.');% encuentra un punto
    recorte=extractBetween(aux_s,1,encuentra_punto);%recorta hasta el punto
    aux_s2=strcat(imagen1r,recorte);%suma la ruta y el nombre del archivo
    aux_s2=strcat(aux_s2,'wav');% a la ruta y nombre le suma la extension
    
    % ----------- importante lo siguiente guarda el audio------------------
    %audiowrite(aux_s2, X0(1:44100*3,1),Fs1); 
    
 %% calculando los valores para la matriz de consolidados   
    max_ener_banda=max(fre15);
    a_max_cont70(1,jj)=max_ener_banda(1,1);
    a_max_cont140(1,jj)=max_ener_banda(1,2);
    a_max_cont210(1,jj)=max_ener_banda(1,3);
    a_max_cont280(1,jj)=max_ener_banda(1,4);
    a_max_cont350(1,jj)=max_ener_banda(1,5);
    a_max_cont420(1,jj)=max_ener_banda(1,6);
    a_max_cont490(1,jj)=max_ener_banda(1,7);

    consolidado(zz,1)=aux_s;
    consolidado(zz,1)=max(a_max_cont70);
    consolidado(zz,2)=max(a_max_cont140);
    consolidado(zz,3)=max(a_max_cont210);
    consolidado(zz,4)=max(a_max_cont280);
    consolidado(zz,5)=max(a_max_cont350);
    consolidado(zz,6)=max(a_max_cont420);
    consolidado(zz,7)=max(a_max_cont490);
    consolidado(zz,8)=min(a_rolloff);
    consolidado(zz,9)=max(a_rolloff);
    consolidado(zz,10)=min(a_centroide);
    consolidado(zz,11)=max(a_centroide);
    consolidado(zz,12)=min(a_cpc);
    consolidado(zz,13)=max(a_cpc);
    consolidado(zz,14)=min(a_magnitudt);
    consolidado(zz,15)=max(a_magnitudt);
    consolidado(zz,16)=min(a_entropia_tem);
    consolidado(zz,17)=max(a_entropia_tem);
    consolidado(zz,18)=min(a_entropia_esp);
    consolidado(zz,19)=max(a_entropia_esp);
    consolidado(zz,20)=max(a_ber_esp);
        
    %% ahora se detecta la piedras en la muestra, 
    
    % para ello se debe recorrer desde 0 Hz hasta 5000 Hz
    % se debe primero dibujar un espectro por contenedores
    % en este caso una imagen de 71 pixeles en Y, 15 pixeles en X
    % se trabaja por ventanas de 200ms y se procesan 3 segundos
    % la matriz fre15(15,316), 15 por las ventanas y 316 para llegar 
    % hasta 21050 Hz
    matriz_para_imagen=zeros(15,71);
    matriz_para_imagen=fre15(:,1:71);
    
    figure(4);
    matriz_para_imagen2=zeros(15,70);
    matriz_para_imagen2=fre15(:,2:71);
    imagen_graficar2=flipud(matriz_para_imagen2');
    imagen_graficar2=rescale(imagen_graficar2, 0, 1);
    imagesc(imagen_graficar2);  %fliplr invierte los valores de la columna
    axis off;
    axis('tight');
    hAxes = gca; % Obtiene el objeto de eje actual
    hAxes.LooseInset = [0 0 0 0]; % Reduce el margen a cero
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);
    %set(gca,'LooseInset',get(gca,'TightInset'));   folderPathr2 
    imagen1r=strcat(folderPathr2,'\'); % saca la ruta
    aux_s=string(fileNames(1,zz)); % obtinene el nombre
    encuentra_punto=strfind(aux_s,'.');% encuentra un punto
    recorte=extractBetween(aux_s,1,encuentra_punto);%recorta hasta el punto
    aux_s2=strcat(imagen1r,recorte);%suma la ruta y el nombre del archivo
    aux_s2=strcat(aux_s2,'jpg');% a la ruta y nombre le suma la extension
    %saveas(gcf, aux_s2);% no se guarda imagen para que sea más rápido
      
    
    figure(5);
    set(gcf, 'WindowState', 'maximized');
    %imagen_graficar=fliplr(matriz_para_imagen');
    imagen_graficar=flipud(matriz_para_imagen');
    imagen_graficar1=rescale(imagen_graficar, 0, 1);
    
    imagesc(imagen_graficar1);  %fliplr invierte los valores de la columna
    yticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 ...
            20 21 22 23 24 25 26 27 28 29 30 ...
            31 32 33 34 35 36 37 38 39 40 ...
            41 42 43 44 45 46 47 48 49 50 ...
            51 52 53 54 55 56 57 58 59 60 ...
            61 62 63 64 65 66 67 68 69 70 71]);
    yticklabels({'497',' ','483',' ','469',' ','455',' ','441',' ', ... %10
             '427',' ','413',' ','399',' ','385',' ','371',' ','357',' ',... %22
             '343',' ','329',' ','315',' ','301',' ','287',' ','273',' ', ...%34
             '259',' ','245',' ','231',' ','217',' ','203',' ','189',' ','175',' ', ...%48
             '161',' ','147',' ','133',' ','119',' ','105',' ', ...  %58
             '91',' ','77',' ','63',' ','49',' ','35',' ','21',' ','7'});
    xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);
    xticklabels({'0.2','0.4','0.6','0.8','1.0','1.2','1.4','1.6','1.8', ...
            '2.0','2.1','2.2','2.4','2.8','3.0'});

    ylabel('Containers in Hz (x10)');
    xlabel('Time(s)');
    title('Audio spectrum from 0 to 5000 Hz');
    grid on;
       
    
    % una vez se grafica el espectro interesa detectar el golpe de las
    % piedras, para ello se tienen encuenta el rolloff y si la energía se
    % concentra en frecuencias inferiores a 660 Hz puede ser el impacto de
    % una piedra   a_rolloff tiene 1 fila por 15 columnas
    
    % debemos recorrer cada columna de la matriz de espectro y comparar 
    % con la columna del rolloff y si la energia hasta el contenedor 660 
    % es mayor al rolloff entonces es un golpe
    
    
    piedra_en_coni=zeros(1,15); 
    %porcentaje =sumatoria_9primeros_cont/sumatoria_62_ultimos_cont
    piedra_en_cons=zeros(1,15); 
    %porcentaje =sumatoria_ultimos_30_cont/sumatoria_41_primeros_cont
    piedra_estado=zeros(1,15);
    
    suma_de_energia= sum(imagen_graficar1, "all");
    suma_promedio=suma_de_energia/15;
    % lo siguiente indica los contenedores con energia promedio
    suma_promedio_90=suma_promedio*0.7;
    sumatoria_columnas=sum(imagen_graficar1, 1);
    porcen_indice_rol=zeros(1,15);
     cont_baja_frec=0;cont_media_frec=0;cont_alta_frec=0;cont_impac_frec=0;
     
     %% trabajo en ventanas
    nivel_de_bajo=zeros(1,15);
    suma_0_a_700hz=zeros(1,15); 
    for  hh=1:15  %haga lo siguiente en 15 ventanas
        suma_61cont=0; 
       
        for p=1:61
          suma_61cont=suma_61cont+abs(imagen_graficar1(p,hh));
          %suma frecuencia de 700 hz a 5000 Hz
        end 
        suma_10cont=0;
        %disp('___________inicio_______________');
        %disp('hasta 700 Hz:');
        for p=62:70 %LA POSICION TIENE RUIDO, NO CAPTURA MICROFONO
         suma_10cont=suma_10cont+abs(imagen_graficar1(p,hh));
         %suma frecuencias de 0 a 700 hz
         %disp(abs(imagen_graficar1(p,hh)));
        end
        
        % lo siguiente para estimar el valor de umbral en algoritmo 1
        rec0a700(zz,hh)=suma_10cont; % zz es numero de archivo y  hh es nuymero ventana
        
        
        ber_frec_con=suma_10cont/suma_61cont;
        % cuando se observa el impacto de una piedra se observa que el 
        % la energia se distribuye desde los 0 a los 2500 Hz y luego se
        % distribuye hasta los 5000 Hz
        piedra_en_coni(1,hh)=ber_frec_con;
    % ___________________________________________
        suma_40cont=0;
        for p=1:40
          suma_40cont=suma_40cont+abs(imagen_graficar1(p,hh));
          %suma as frecuencias de 5000 hz a 2800 hz
        end 
        suma_31cont=0;
        for p=41:70
         suma_31cont=suma_31cont+abs(imagen_graficar1(p,hh));
         % sum las frecuencias desde 2800 a 0 hz
        end 
        ber_frec_con_sup=suma_40cont/suma_31cont;
        piedra_en_cons(1,hh)=ber_frec_con_sup;
        % se debe determinar los estados a partir de la anergia en la parte
        % baja del especro y de la superior
         
        % debe exitir energia en la señal, ya que si existe silencio los
        % valores en bajas frecuencias es alto comparado con las altas
        % se deberia calcular el promedio de la energia de la muestra
        % luego evaluar si la columna(la ventana) es mayor al promedio
        % para ser considerada como que existe un golpe
        
        
        contenedor_rolloff=a_rolloff(1,hh)/70;
        fin_contenedor=ceil(contenedor_rolloff); %ceil redonbdea a entero más cercano, mayor o igual a el
        suma_hasta_rolloff=0;
        %disp('sumando el rolloff');
        for p=1:fin_contenedor
         suma_hasta_rolloff=suma_hasta_rolloff+abs(imagen_graficar1(72-p,hh));
         % sum alas frecuencias desde 2620 a 0 hz
         %disp(abs(imagen_graficar1(72-p,hh)));
        end
        %num_for = sprintf('%.1f', fin_contenedor);
        %text(hh, 29, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
        
        % ahora se incluye el RollOff, con un indice que es igual a
        % indice_rol=rolloff/ber_frec_con_sup
        indice_rol=suma_10cont/suma_hasta_rolloff;
        indice_rol=indice_rol*100;       
        num_for = sprintf('%.3f', suma_hasta_rolloff);
        text(hh, 23, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
        
        num_for = sprintf('%.3f', suma_10cont);
        suma_0_a_700hz(1,hh)=suma_10cont;
        text(hh, 27, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
        tipo_bajo='_';
        if (suma_10cont>=0)&& (suma_10cont<2.70)
            cont_baja_frec=cont_baja_frec+1;tipo_bajo='0';
        end
        if (suma_10cont>=2.00)&& (suma_10cont<4.500)
            cont_media_frec=cont_media_frec+1;tipo_bajo='1';
        end
         if (suma_10cont>=0.90)&& (suma_10cont<4.40)
            cont_alta_frec=cont_alta_frec+1;tipo_bajo='2';
         end
         if (suma_10cont>=4.500)
            cont_impac_frec=cont_impac_frec+1;tipo_bajo='3';
         end
        text(hh, 50, tipo_bajo, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
        nivel_de_bajo(1,hh)=str2double(tipo_bajo);
         
        porcen_indice_rol(1,hh)=indice_rol;
        num_for = sprintf('%.1f', indice_rol);
        text(hh, 35, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
        %suma_promedio para identificar señales que tienen un buen nivel de
        %volumen, por lo pronto mayor a 2.3  ; indice_rol indica que de n0 a 700 Hz debe ser mayor al 45% de la
        %anergia de total
        %la sumatoria_columnas(1,hh) debe ser mayor al promedio de la señal 
        
        if (sumatoria_columnas(1,hh)>suma_promedio_90)&&(sumatoria_columnas(1,hh)>=3)&&(indice_rol>=45) 
                piedra_estado(1,hh)=1;
        end
        
    end % ______________________fin de recorrer las 15 ventanas de tiempo______
    index_impacto=nivel_de_bajo.*piedra_estado;
    suma_index_impacto=sum(index_impacto);
    sumatoria_columnas2=rescale(sumatoria_columnas, 0, 1);
    desvia_estan_ener_vent=std(sumatoria_columnas2);
    desvia_estan_porcen_indice_rol=std(porcen_indice_rol);

    % --------------inicio de ahora contamos los flancos, cambios drásticos de bajas frecuencia
    contador_flancos=0; contador_flancos_desc=0;contador_flancos_asc=0;
    contador_flancos_asc2=0;contador_picos3=0;maximo_impacto=0;
    maximo_impacto2=0;maximo_impacto3=0;
    [valor_max, indice_max] = max(suma_0_a_700hz);
     desv_energ_0_a_700hz=std(suma_0_a_700hz);
    maximo_desv=0.75;
    maximo_desv=desv_energ_0_a_700hz*0.75;%desv_energ_0_a_700hz
    % lo siguiente para validar que exista una buena señal
    if valor_max > 1.800
        %para verificar un pico ascendente en tres celdas
        if (indice_max>=3)&&(indice_max<=15)
            a1=suma_0_a_700hz(1,indice_max-2);
            a2=suma_0_a_700hz(1,indice_max-1);
            a3=suma_0_a_700hz(1,indice_max);
            ax=[a1 a2 a3];
            desv_ax=std(ax);  %ax=[1.64 2.9 1.7]; std(ax)  = 0.7
            %ax=[1.74 2.09 3.16 3.16 1.91]; std(ax) =0.69 palos en rio
            %ax=[0.57 1.16 2.89 2.18 1.45]; std(ax) =0.90 piedras
            dif1=a2-a1;
            dif2=a3-a2;
            if (dif1>maximo_desv)&&(dif2>maximo_desv)
                if desv_ax>maximo_desv  % se validan que existan diferencias entre los numeros
                    if (a1<a2)
                        if (a2<a3)
                        %if (a3>a1)
                            contador_flancos=contador_flancos+1;
                        %end
                        end    
                    end    
                end        
            end % fin de  validar que la minima separacion sea 0.1 de energia    

        end    
        %fin para verificar un pico ascendente en tres celdas
    
        %para verificar un pico descendente en tres celdas
        if (indice_max>=1)&&(indice_max<=13)
            a1=suma_0_a_700hz(1,indice_max);
            a2=suma_0_a_700hz(1,indice_max+1);
            a3=suma_0_a_700hz(1,indice_max+2);
            ax=[a1 a2 a3];
            desv_ax=std(ax);  
            dif1=a1-a2;
            dif2=a2-a3;
            if (dif1>maximo_desv)&&(dif2>maximo_desv)
                 if desv_ax>maximo_desv  
                     if (a1>a2)
                        if (a2>a3)
                            %if (a3>a1)
                                contador_flancos_desc=contador_flancos_desc+1;
                            %end
                        end    
                     end
                end
            end %fin de la diferencia entre rangos

        end     %fin para verificar un pico descendente en tres celdas

        % para verificar un pico de 5 celdas
        if (indice_max>=3)&&(indice_max<=13)
            a1=suma_0_a_700hz(1,indice_max-2);
            a2=suma_0_a_700hz(1,indice_max-1);
            a3=suma_0_a_700hz(1,indice_max);
            a4=suma_0_a_700hz(1,indice_max+1);
            a5=suma_0_a_700hz(1,indice_max+2);
            ax=[a1 a2 a3 a4 a5];
            desv_ax=std(ax); 
            dif1=a2-a1;
            dif2=a3-a2;
            dif3=a3-a4;
            dif4=a4-a5;
            if (dif1>maximo_desv)&&(dif2>maximo_desv)&&(dif3>maximo_desv)&&(dif4>maximo_desv)
                  if desv_ax>maximo_desv  
                    if (a1<a2)
                        if (a2<a3)
                            if (a3>a4)
                                if (a4>a5)
                                contador_flancos_asc=contador_flancos_asc+1;
                                end
                            end
                        end    
                    end    
                 end
            end % fin de la diferencia entre valores
    end   % fin de la comparación de las 5 celdas 
    
      % para verificar un pico de 4 celdas
    % --------------fin de ahora 4 celdas ascendentes
     if (indice_max>=4)&&(indice_max<=15)
            disp('Entra a la condicion de 1 a 15');
            a1=suma_0_a_700hz(1,indice_max-3);
            a2=suma_0_a_700hz(1,indice_max-2);
            a3=suma_0_a_700hz(1,indice_max-1);
            a4=suma_0_a_700hz(1,indice_max);
            ax=[a1 a2 a3 a4];
            desv_ax=std(ax);
            dif1=a2-a1;
            dif2=a3-a2;
            dif3=a4-a3;
            if (dif1>maximo_desv)&&(dif2>maximo_desv)&&(dif3>maximo_desv)
                if desv_ax>maximo_desv  
                  if (a1<a2)
                    if (a2<a3)
                        if (a3<a4)
                            contador_flancos_asc2=contador_flancos_asc2+1;
                         end
                    end    
                end 
              end
            end %fin verificar distancias    


        end   % fin de la comparación de las 4 celdas 


    % comparar 3 celdas con un pico
      if (indice_max>=2)&&(indice_max<=14)
        a1=suma_0_a_700hz(1,indice_max-1);
        a2=suma_0_a_700hz(1,indice_max);
        a3=suma_0_a_700hz(1,indice_max+1);
        ax=[a1 a2 a3];
        desv_ax=std(ax); 
        dif1=a2-a1;
        dif2=a2-a3;
        if (dif1>maximo_desv)&&(dif2>maximo_desv)
            if desv_ax>maximo_desv  % se validan que existan diferencias entre los numeros
                if (a1<a2)
                    if (a2>a3)
                          contador_picos3=contador_picos3+1;
                    end    
                end    
            end        
        end %fin de validar que exista suficiente diferencia en los valores de picos
               
      end    %fin de % comparar 3 celdas con un pico

      % -------------------------ahora interesa identificar si el más bajo
      % rolloof coincide con la máxima energía en las frecuencias bajas
      %[valor_max, indice_max] = max(suma_0_a_700hz);
      [valor_min_rolloff,indice_min_rolloff]=sort(a_rolloff,'ascend');
      maximo_impacto=0;
      if (indice_max==indice_min_rolloff(1,1))
          maximo_impacto=1;
      end
      
       %_____________________________si no existe ese máximo impacto entre las posiciones 
       %del mininimo rolloff y la máxima energia en frecuencias bajas, se puede
       %el minimo rolloff con el maximo piedra_en_coni(1,hh)
       [valor_piedra_en_coni,indice_piedra_en_coni]=sort(piedra_en_coni,'descend');
       maximo_impacto2=0;
      if (indice_piedra_en_coni(1,1)==indice_min_rolloff(1,1))
          maximo_impacto2=1;
      end
       
    %_____________________________si no existe ese máximo impacto entre las posiciones 
       %maxima energiaindice_(suma 0 a 700)|(suma700-5000) y 
       %la máxima energia en frecuencias bajas,
      maximo_impacto3=0;
      if (indice_piedra_en_coni(1,1)==indice_max)
          maximo_impacto3=1;
      end
      
      %________________________ si el maximo queda en la posicion 1 0 15
      % se debe evaluar a la segunda mayor energía
      if (indice_max==1)||(indice_max==15)
          [valor_max_suma_0_a_700,indice_max_0_a_700]=sort(suma_0_a_700hz,'descend');
          posicion2=indice_max_0_a_700(1,2);
          % comparar 3 celdas con un pico
          if (posicion2>=2)&&(posicion2<=14)
            a1=suma_0_a_700hz(1,posicion2-1);
            a2=suma_0_a_700hz(1,posicion2);
            a3=suma_0_a_700hz(1,posicion2+1);
            ax=[a1 a2 a3];
            desv_ax=std(ax); 
            dif1=a2-a1;
            dif2=a2-a3;
            if (dif1>maximo_desv)&&(dif2>maximo_desv) % pilas olger verificar
                if desv_ax>maximo_desv  % se validan que existan diferencias entre los numeros
                    if (a1<a2)
                        if (a2>a3)
                              contador_picos3=contador_picos3+1;
                        end    
                    end    
                end        
            end %fin de validar que exista suficiente diferencia en los valores de picos
    
          end    %fin de posicion si está en 2 a 14
      end % fin si los valores máximo de energia se encuentra en posicion 1 o 15
      
      
    end % fin de que el máximo sea mayor a 2.0, para todas las validaciones
    
    valor_min_rolloff2=min(a_rolloff);
    valor_max_piedra_en_coni=max(piedra_en_coni);
    for  hh=1:15
        num_for = sprintf('%.2f', piedra_en_coni(1,hh));
        text(hh, 64, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
        num_for = sprintf('%.2f', sumatoria_columnas(1,hh));
        text(hh, 4, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
        num_for = sprintf('%.2f', piedra_en_cons(1,hh));
        text(hh, 8, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
        text(hh, 68, string(piedra_estado(1,hh)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
        text(hh, 17, string(a_rolloff(1,hh)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
        if valor_max==suma_0_a_700hz(1,hh)
            num_for = sprintf('%.3f', suma_0_a_700hz(1,hh));
            text(hh, 27, num_for, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'magenta');
        end
        if valor_min_rolloff2==a_rolloff(1,hh)
              num_for = sprintf('%.0f', a_rolloff(1,hh));
              text(hh, 17, num_for, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'magenta');
        end
        if valor_max_piedra_en_coni==piedra_en_coni(1,hh)
              num_for = sprintf('%.2f', piedra_en_coni(1,hh));
              text(hh, 64, num_for, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'magenta');
        end
    end
    num_for = sprintf('Average =%.2f', suma_promedio);
    text(5, 2, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    num_for = sprintf('Stan dev=%.2f', desvia_estan_ener_vent);
    text(8, 2, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    text(2, 2, 'Total energy per window:', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    text(4, 6, 'Index high-freq(summation 2800 to 5000)/low-freq(summation 0 to 2800):', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    text(4, 62, 'Index low-freq(summation 0 to 700)/high-freq(summation 700 to 5000):', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    text(2, 66, 'Rock crashes:', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    text(2, 15, 'RollOff 95%:', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    text(2, 21, 'A=Sum up to RollOff 95%:', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    text(2, 25, 'B=Summation 0 Hz to 700 Hz:', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    text(2, 33, 'B/A index in %:', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    text(2, 48, 'Bass level:', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    num_for = sprintf('Index impact=%.1f', suma_index_impacto);
    text(2, 54, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    
    num_for = sprintf('Stan dev B/A=%.2f', desv_energ_0_a_700hz);
    text(2, 29, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');

    num_for = sprintf('Stan dev=%.2f', desvia_estan_porcen_indice_rol);
    text(2, 37, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');
    
    num_for = sprintf('Flanks: 3cell asc=%.0f,  3cell des=%.0f, 5cell pico=%.0f, 4cell asc=%.0f, 3cell pico=%.0f, max impact=%0.f - %0.f - %0.f', ... 
        contador_flancos, contador_flancos_desc,contador_flancos_asc,contador_flancos_asc2, ...
        contador_picos3,maximo_impacto,maximo_impacto2,maximo_impacto3);
    %maximo impacto es cuando coincide el mínimo rollooff con la maxim
    %energia en las bajas frecuencias
    text(5, 39, string(num_for), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'white');

    yline(62, '--r', '700Hz');
    yline(32, '--r', '2800Hz');
    
    %% ahora a identificar impactos de piedras:
    if (desvia_estan_porcen_indice_rol>4)
        % lo anteriro permite verificar que exista variación en los bajos,
        % en las piedras se puede desde >3.5
        % con mayores de 4 solo 10 de 148 no cumplen
        
        %recordemos que ya codificamos lo siguiente:
        % 1. la sumatoria_columnas(1,hh) debe ser mayor al promedio de la señal 
        % 2. if (sumatoria_columnas(1,hh)>suma_promedio_90)&&(sumatoria_columnas(1,hh)>=3)&&(indice_rol>=45) 
        % 3.       piedra_estado(1,hh)=1;
        % 4. end
        % 5. nivel_de_bajo(1,hh)=str2double(tipo_bajo);  tipo de bajo va de
        %    0 a 4, depende la cantidad de energía en bajas frecuencias de 0 a
        %    700; lo anterior por cada ventana
        % 6. index_impacto=nivel_de_bajo.*piedra_estado; 0 a  4
        %     multiplicado piedra_estado que es 0 o 1 (1 si supera el promedio del 90% de la 
        %     energía de las 15 muestras y es mayor a 3)
        % 7. suma_index_impacto=sum(index_impacto);
        
       [valor_piedra_en_coni,indice_piedra_en_coni]=sort(piedra_en_coni,'descend');
       
       [valor_max, indice_max] = max(suma_0_a_700hz);
       %valor_max es el valor de la energia en bajas frecuencias
       
       %suma_index_impacto contiene la multiplicacion entre bass level y
       %rock crashes
       
       %piedra_en_coni es la relacion low-freq/high-freq, penulima fila del
       %grafico
       
       %valor_max>2.2 solo 3 de 148 no cumplen
       %suma_index_impacto>=2 solo 10 de 148 no cumplen
       if (piedra_en_coni(1,indice_max)>1)&&(valor_max>2.2)&&(suma_index_impacto>=2)
            text(2, 56, 'Possible stone impact', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'red');
            posible_piedra=1;
       else
           text(2, 56, 'No stone impact', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'red');
           posible_piedra=0;
       end
    else
        text(2, 56, 'No stone impact', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','Color', 'red');
        posible_piedra=0;
    end    
    
    % lo siguiente para guardar una imagen en el disco duro
    
    imagen1r=strcat(folderPathr,'\'); % saca la ruta
    aux_s=string(fileNames(1,zz)); % obtinene el nombre
    encuentra_punto=strfind(aux_s,'.');% encuentra un punto
    recorte=extractBetween(aux_s,1,encuentra_punto);%recorta hasta el punto
    aux_s2=strcat(imagen1r,recorte);%suma la ruta y el nombre del archivo
    aux_s2=strcat(aux_s2,'png');% a la ruta y nombre le suma la extension
    %saveas(gcf, aux_s2);% no se guarda imagen para que sea más rápido
    
    consolidado(zz,21)=sum(piedra_estado); % sumatoria de los estados de 0 y 1 
    consolidado(zz,22)=suma_promedio;
    % suma_promedio=suma_de_energia/15;   suma de la energia en cada
    % contenedor dividido entre 15
    consolidado(zz,23)=desvia_estan_porcen_indice_rol; %desv estandar de los B/A index
    %B/A index es la relación de la energia a un valor: 0 a 1.8 es 0, 1.8
    %a 2.2 es 1, ...
    consolidado(zz,24)=contador_flancos;    
    % B/A index  se compara cada posicion con el siguiente y el siguiente
    % para verificar cambios de espectro
    consolidado(zz,25)=contador_flancos_desc;  
    consolidado(zz,26)=contador_flancos_asc;
    consolidado(zz,27)=contador_flancos_asc2;
    consolidado(zz,28)=  contador_picos3;
    consolidado(zz,29)=  maximo_impacto;
    consolidado(zz,30)=  maximo_impacto2;
    consolidado(zz,31)=  maximo_impacto3;
      
    consolidado(zz,32)=cont_baja_frec;     
    consolidado(zz,33)=cont_media_frec;  
    consolidado(zz,34)=cont_alta_frec;  
    consolidado(zz,35)=cont_impac_frec;  
    consolidado(zz,36)=suma_index_impacto;
    consolidado(zz,37)=posible_piedra;
    %recuerde que:
    %index_impacto=nivel_de_bajo.*piedra_estado;
    %suma_index_impacto=sum(index_impacto);
    disp('termino procesar archivo:');disp(zz);
    disp('-----------------------------');
    
    %% verificar correlacion
    %se debe desplazar un segmento entre otro
    %1 2 3 4 5 6 7 8 9   123 234 345 456 567 678 789 
    %4 5 6    comparciones es igua: col_mat_sonido -col_mat_patron +1
     
    % ---------------inicio verificar si parece a piedra 1------------
    rho_array=zeros(1,13);
    imagen1r=strcat(folderPathr,'\'); % saca la ruta
    aux_s=string(fileNames(1,zz)); % obtinene el nombre
    encuentra_punto=strfind(aux_s,'.');% encuentra un punto
    recorte=extractBetween(aux_s,1,encuentra_punto-1);%recorta hasta el punto
    aux_s2=strcat(imagen1r,recorte);%suma la ruta y el nombre del archivo
    % la extensión se agrega en cada comparación
    
    %entradas:   piedrasx desde 1 a 8,  piedrax patron a comparar,
    % num_figura  numero de figura,  tipo para indicar el tipo de impacto   
    %salidas: cant_choquesx cantidad de choques,
    
    a_graficar=graficos_tipo_impac;
%     cant_choques1 = validar_impacto(piedra1,imagen_graficar1,'1',7,aux_s2,a_graficar);
%     cant_choques2 = validar_impacto(piedra2,imagen_graficar1,'2',8,aux_s2,a_graficar);
%    % cant_choques3 = validar_impacto(piedra3,imagen_graficar1,'3',9,aux_s2,a_graficar);
%     cant_choques4 = validar_impacto(piedra4,imagen_graficar1,'4',10,aux_s2,a_graficar);
%     cant_choques5 = validar_impacto(piedra5,imagen_graficar1,'5',11,aux_s2,a_graficar);
%     cant_choques6 = validar_impacto(piedra6,imagen_graficar1,'6',12,aux_s2,a_graficar);
%     cant_choques7 = validar_impacto(piedra7,imagen_graficar1,'7',13,aux_s2,a_graficar);
%     cant_choques8 = validar_impacto(piedra8,imagen_graficar1,'8',14,aux_s2,a_graficar);
%     cant_choques9 = validar_impacto(piedra9,imagen_graficar1,'9',15,aux_s2,a_graficar);

    % guardamos el numero de coincidencias pro tipo de impactos
%     consolidado(zz,36)=cant_choques1;
%     consolidado(zz,37)=cant_choques2;
%     %consolidado(zz,38)=cant_choques3;  % genera errores y ya no suma
%     consolidado(zz,38)=cant_choques4;
%     consolidado(zz,39)=cant_choques5;
%     consolidado(zz,40)=cant_choques6;
%     consolidado(zz,41)=cant_choques7;
%     consolidado(zz,42)=cant_choques8;
%     consolidado(zz,43)=cant_choques9;
%     consolidado(zz,44)=cant_choques1+cant_choques2+cant_choques4 ...
%          +cant_choques5+cant_choques6+cant_choques7+cant_choques8+cant_choques9;
%     % pause(0.1);
    
end
piedra_1=zeros(10,3); inicio_col=5;fin_col=7;aux=0; 
% lo anterior para p_represa_rio_encano_240616_si_avenida_135834_sonido_piedras[3]
% piedra en rio normal que se desplaza

piedra_1=zeros(10,3); inicio_col=9;fin_col=11;aux=0;
%lo anterior para  B_B3FM_video_240326_163546_siavenida_3
%impacto de la piedra en canal de pendiente fija en concreto

piedra_1=zeros(10,3); inicio_col=7;fin_col=9;aux=0;
%B_represa_rio_encano_240616_si_avenida_140413_sonido_piedras[22]

piedra_1=zeros(10,3); inicio_col=6;fin_col=8;aux=0;
%B_B5H_video_230726_piedras_siavenida_mono

piedra_1=zeros(10,3); inicio_col=8;fin_col=10;aux=0;
%B_represa_rio_encano_240616_si_avenida_140413_sonido_piedras[19]

piedra_1=zeros(10,3); inicio_col=8;fin_col=10;aux=0;
%p_represa_rio_encano_240616_si_avenida_140009_sonido_piedras[1]_gan_ale

piedra_1=zeros(10,3); inicio_col=12;fin_col=14;aux=0;
%B_B6F_video_230726_piedras_siavenida_mono

piedra_1=zeros(10,3); inicio_col=10;fin_col=12;aux=0;
% lo anterior verificar
%B_B1F_video_230726_piedras_siavenida_mono

piedra_1=zeros(10,3); inicio_col=11;fin_col=13;aux=0;
%B_B1G_video_230726_piedras_siavenida_mono


if (opcion_usuario==5)
    for hh=inicio_col:1:fin_col
        aux=aux+1;
        for p=61:1:70
           piedra_1(p-60,aux)=abs(imagen_graficar1(p,hh));
           % sum las frecuencias desde 2800 a 0 hz
        end 
    end
    figure(20);
    set(gcf, 'WindowState', 'maximized');
    grid on;
    imagesc(piedra_1); 
end
%% condensar resultados en archivo
    addpath('d:\doctorado\art_udistrital_2026\resultados','-end');
    formatOut = 'dd_mm_yyyy';
    fhoraa=datestr(now,formatOut);
    nombre_archivo=strcat(folderPathr,'\',clase,'_',fhoraa,'_v15.txt');
    fid=fopen(nombre_archivo,'w');%a+ adiciona y w sobreescribe
    %fprintf(fid,'Consolidado de resultados:\r\n'); 
    encabezado="max_c70"+ '\t'+"max_c140"+ '\t'+"max_c210"+'\t'+"max_c280"+ '\t'+"max_c350"+ '\t'+"max_c420"...
        + '\t'+"max_c490"+ '\t'+"min_rolloff"+ '\t'+"max_rolloff"+ '\t'+"min_cent"+ '\t'+"max_cent"...
        + '\t'+"min_cpc"+ '\t'+"max_cpc"+ '\t'+"min_magni"+ '\t'+"max_magni"+ '\t'+"min_entr_te"+ '\t'+"max_entr_te"...
        + '\t'+"min_ent_es"+ '\t'+"max_ent_es"+ '\t'+"ber_esp"...
        + '\t'+"sum_estados" + '\t' +"prom_15con"+ '\t'+ "des_est_pir"+ '\t'+"3cell_asc"+ '\t'+"3cell_des"...
    + '\t'+"5cell_pico"+ '\t'+"4cel_asc"+ '\t'+"3cell_pico"+ '\t'+"min_rolloff|max_ener_fb"...
+ '\t'+"max_ener_fb|max(0-700/700-5000)"+ '\t'+"min_rolloff|max(0-700/700-5000)"+ '\t'+"con_bajap_fb"...
+ '\t'+"con_medip_fb"+ '\t'+"con_altap_fb"+ '\t'+"con_maltap_fb"+ '\t'+"suma_index_impac"...
+ '\t'+"posible_piedra"+ '\t'+"Nombre_archivo";
    
    fprintf(fid,encabezado); 
    fprintf(fid,'\r\n'); 
    for zz=1:1:total_archivos  %luego hasta total archivos
    aux_s=string(fileNames(1,zz)); % obtiene el nombre  del archivo
    tabular='\t';
    cad_vac='';
    for columna_carac=1:1:37
        if (columna_carac<=7)
        aux_cad_con=sprintf('%0.4f',consolidado(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,'\t');
        end
        if ((columna_carac==8) || (columna_carac==9) || (columna_carac==12) || (columna_carac==13))
        aux_cad_con=string(consolidado(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,'\t');
        end
       if ((columna_carac==10) || (columna_carac==11))
        aux_cad_con=sprintf('%0.4f',consolidado(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,'\t');
       end
        if (columna_carac>=14)&&(columna_carac<=23)
        aux_cad_con=sprintf('%0.4f',consolidado(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,'\t');
        end
        if (columna_carac>=24)
        aux_cad_con=string(consolidado(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,'\t');
        end
    end
    cad_vac=strcat(cad_vac,aux_s);
    str_simula = sprintf('%s\r\n',cad_vac);
    fprintf(fid,str_simula); 
end
toc
str_tiempo = sprintf('tiempo_procesado=%d>\r\n',toc);
%fprintf(fid,str_tiempo);%para ahorrar tamaño en archivo
% Obtener la fecha y hora actual como un objeto datetime
fechaHora = datetime('now');
% Obtener la fecha y hora actual como un vector de caracteres en formato 'dd-mmm-yyyy HH:MM:SS'
fechaHoraStr = datestr(fechaHora, 'dd-mmm-yyyy HH:MM:SS');
%fprintf(fid,fechaHoraStr);  %para ahorrar tamaño en archivo
fclose(fid);

%% para saber si existe impacto se deberia verificar que el minimo rolloff
% corresponda con el mas alto porcentaje de energia en baja frecuencia.
% Los impactos se encuentran desde 2000 hz para abajo, siempre que tengan la
% máxima energia en los componentes de baja.


%% archivo para python
%% condensar resultados en archivo
    addpath('d:\doctorado\art_udistrital_2026\resultados','-end');
    formatOut = 'dd_mm_yyyy';
    fhoraa=datestr(now,formatOut);
    nombre_archivo=strcat(folderPathr,'\',clase,'_',fhoraa,'_v15.csv');
    fid=fopen(nombre_archivo,'w');%a+ adiciona y w sobreescribe
    %fprintf(fid,'Consolidado de resultados:\r\n'); 
    encabezado="max_c70"+ ','+"max_c140"+ ','+"max_c210"+','+"max_c280"+ ','+"max_c350"+ ','+"max_c420"...
        + ','+"max_c490"+ ','+"min_rolloff"+ ','+"max_rolloff"+ ','+"min_cent"+ ','+"max_cent"...
        + ','+"min_cpc"+ ','+"max_cpc"+ ','+"min_magni"+ ','+"max_magni"+ ','+"min_entr_te"+ ','+"max_entr_te"...
        + ','+"min_ent_es"+ ','+"max_ent_es"+ ','+"ber_esp"...
        + ','+"sum_estados" + ',' +"prom_15con"+ ','+ "des_est_pir"+ ','+"3cell_asc"+ ','+"3cell_des"...
    + ','+"5cell_pico"+ ','+"4cel_asc"+ ','+"3cell_pico"+ ','+"min_rolloff|max_ener_fb"...
+ ','+"max_ener_fb|max(0-700/700-5000)"+ ','+"min_rolloff|max(0-700/700-5000)"+ ','+"con_bajap_fb"...
+ ','+"con_medip_fb"+ ','+"con_altap_fb"+ ','+"con_maltap_fb"+ ','+"suma_index_impac"...
+ ','+"posible_piedra"+ ','+"Nombre_archivo";
    
    fprintf(fid,encabezado); 
    fprintf(fid,'\r\n'); 
    for zz=1:1:total_archivos  %luego hasta total archivos
    aux_s=string(fileNames(1,zz)); % obtiene el nombre  del archivo
    tabular='\t';
    cad_vac=strcat('_,',clasen,',');
    for columna_carac=1:1:37
        if (columna_carac<=7)
        aux_cad_con=sprintf('%0.4f',consolidado(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,',');
        end
        if ((columna_carac==8) || (columna_carac==9) || (columna_carac==12) || (columna_carac==13))
        aux_cad_con=string(consolidado(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,',');
        end
       if ((columna_carac==10) || (columna_carac==11))
        aux_cad_con=sprintf('%0.4f',consolidado(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,',');
       end
        if (columna_carac>=14)&&(columna_carac<=23)
        aux_cad_con=sprintf('%0.4f',consolidado(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,',');
        end
        if (columna_carac>=24)
        aux_cad_con=string(consolidado(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,',');
        end
    end
    
    cad_vac=strcat(cad_vac,aux_s);
    str_simula = sprintf('%s\r\n',cad_vac);
    fprintf(fid,str_simula); 
    end

    % archivo para python determinar umbral
    %% archivo para python
%% condensar resultados en archivo
    addpath('d:\doctorado\art_udistrital_2026\resultados','-end');
    formatOut = 'dd_mm_yyyy';
    fhoraa=datestr(now,formatOut);
    nombre_archivo=strcat(folderPathr,'\',clase,'_rec0a700_',fhoraa,'_v15.csv');
    fid=fopen(nombre_archivo,'w');%a+ adiciona y w sobreescribe
    %fprintf(fid,'Consolidado de resultados:\r\n'); 
    encabezado="No."+','+"clase"+ ','+"v01"+ ','+"v02"+','+"v03"+ ','+"v04"+ ','+"v05"...
        + ','+"v06"+ ','+"v07"+ ','+"v08"+ ','+"v09"+ ','+"v10"...
        + ','+"v11"+ ','+"v12"+ ','+"v13"+ ','+"v14"+ ','+"15"...
        + ','+"Nombre_archivo";
    
    fprintf(fid,encabezado); 
    fprintf(fid,'\r\n'); 
    for zz=1:1:total_archivos  %luego hasta total archivos
    aux_s=string(fileNames(1,zz)); % obtiene el nombre  del archivo
    tabular='\t';
    cad_vac=strcat('_,',clasen,',');
    for columna_carac=1:1:15
        
        aux_cad_con=sprintf('%0.4f',rec0a700(zz,columna_carac));
        cad_vac=strcat(cad_vac,aux_cad_con,',');
       
    end
    
    cad_vac=strcat(cad_vac,aux_s);
    str_simula = sprintf('%s\r\n',cad_vac);
    fprintf(fid,str_simula); 
    end

toc

fclose(fid);
