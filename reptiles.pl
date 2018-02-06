esrespuesta('si').
esrespuesta('no').

%MENU PRINCIPAL
espregunta('TIENE CAPARAZON ?',X):-esrespuesta(X).
espregunta('TIENE LA PIEL EXPUESTA ?',X):-esrespuesta(X).


main:-
        new(D,dialog('SISTEMA EXPERTO HERPETOFAUNA VALLE DE MEXICO')),
        send(D,size,size(560,400)),
        send(D,colour,colour(red)),
        send(D, append, new(Menu, menu_bar)),     
        send(Menu, append, new(Iniciar, popup(iniciar))),
        send(Menu, append, new(Ayuda, popup(ayuda))),
        send_list(Iniciar, append,
                         [ menu_item(iniciar, message(@prolog,pp))
                         ]),
        send_list(Ayuda, append,
                         [ menu_item(autor, message(@display, inform, 'inteligencia artificial primavera 2018 BUAP'))
                         ]),
        mostrar('C:/SEherpetofauna/rep.jpg',D,Menu),send(D,open,point(200,200)).



mostrar(V,D,M):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D1,below(M)).

%VENTANA DIALOGO PARA DEFINIR CAMINA/ARRASTRA MANDA A LLAMAR A "PRINCIPAL" DONDE DEFINE QUE FUNCION SERA LLAMADA
pp:-new(D,dialog('PREGUNTAS')),
        new(Pre1,menu('TIENE CAPARAZON?')),
       send_list(Pre1,append,[si , no]),
        new(Pre2,menu('TIENE LA PIEL EXPUESTA ?')),
        send_list(Pre2,append,[si,no]),
      
          send(D,append(Pre1)),
       send(D,append,Pre2),
            
      new(B,button(siguiente,and(message(@prolog,principal,Pre1?selection,Pre2?selection),message(D,destroy)))),
      send(D,append,B),
      send(D,default_button,siguiente),
        send(D,open,point(350,350)).



%CASO PARA TORTUGAS
principal(P1,P2):-
espregunta('TIENE CAPARAZON ?',P1),P1='si',
espregunta('TIENE LA PIEL EXPUESTA ?',P2),P2='no',
pt.

%CASO PARA LAGARTOS
principal(P1,P2):-
espregunta('TIENE CAPARAZON?',P1),P1='no',
espregunta('TIENE LA PIEL EXPUESTA ?',P2),P2='si',
pl.

%CASO PARA 2 SELECCIONES SI O 2 SELECCIONES NO
principal(_,_):-new(D,dialog('ERROR')), %DEFAULT CUANDO LAS 2 ELECCIONES SON SI O NO
new(L,label(l,'ELIJA SOLO UNA OPCION',font('times','roman',16))),
send(D,append,L),
send(D,open,point(350,350)).


%PANTALLA PREGUNTAS PARA TORTUGAS
pt:-new(D,dialog('LAGARTOS')),
        new(Pre1,menu('es de tamaño grande?')),
       send_list(Pre1,append,[si , no]),
        new(Pre2,menu('tiene mas de 1 color?                 ')),
        send_list(Pre2,append,[si,no]),
        new(Pre3,menu('tiene caparazon?            ')),
        send_list(Pre3,append,[si,no]),
        new(Pre4,menu('tiene colmillos visibles?')),
        send_list(Pre4,append,[si,no]),
        new(Pre5,menu('camina rapido?               ')),
       send_list(Pre5,append,[si,no]),
        new(Pre6,menu('esta sobre un arbol?         ')),
       send_list(Pre6,append,[si , no]),
        new(Pre7,menu('se muestra agresivo?          ')),
        send_list(Pre7,append,[si,no]),
        
       send(D,append(Pre1)),
       send(D,append,Pre2),
       send(D,append,Pre3),
       send(D,append,Pre4),
       send(D,append,Pre5),
       send(D,append(Pre6)),
       send(D,append,Pre7),
           
       new(B1,button(atras,and(message(@prolog,pp),message(D,destroy)))),
      new(B,button(siguiente,message(@prolog,larvas,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection,Pre5?selection,Pre6?selection,Pre7?selection))),
      send(D,append,B1),
      send(D,append,B),
        send(D,open,point(300,300)).


%PANTALLA PREGUNTAS PARA LAGARTOS
pl:-new(D,dialog('SERPIENTES')),
        new(Pre1,menu('1 es de tamaño grande?')),
       send_list(Pre1,append,[si , no]),
        new(Pre2,menu('1 tiene mas de 1 color?                 ')),
        send_list(Pre2,append,[si,no]),
        new(Pre3,menu('1 tiene caparazon?            ')),
        send_list(Pre3,append,[si,no]),
        new(Pre4,menu('1 tiene colmillos visibles?')),
        send_list(Pre4,append,[si,no]),
        new(Pre5,menu('1 camina rapido?               ')),
       send_list(Pre5,append,[si,no]),
        new(Pre6,menu('1 esta sobre un arbol?         ')),
       send_list(Pre6,append,[si , no]),
        new(Pre7,menu('1 se muestra agresivo?          ')),
        send_list(Pre7,append,[si,no]),
        
       send(D,append(Pre1)),
       send(D,append,Pre2),
       send(D,append,Pre3),
       send(D,append,Pre4),
       send(D,append,Pre5),
       send(D,append(Pre6)),
       send(D,append,Pre7),
           
       new(B1,button(atras,and(message(@prolog,pp),message(D,destroy)))),
      new(B,button(siguiente,message(@prolog,larvas,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection,Pre5?selection,Pre6?selection,Pre7?selection))),
      send(D,append,B1),
      send(D,append,B),
        send(D,open,point(300,300)).








