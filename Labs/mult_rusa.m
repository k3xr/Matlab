function P=mult_rusa(a,b) % Template de la funcion 
   % Recibe dos enteros a y b y devuelve su producto en P
   P=0;
   while(a~=0)
       if(mod(a,b)==1)
            P=P+a;
       end
       a = a*2;
       b = floor(b/2);
   end
   return
       
   