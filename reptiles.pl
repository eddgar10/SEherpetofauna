main:-
        new(D,dialog('SISTEMA EXPERTO REPTILES ')),
        send(D,size,size(560,400)),
        send(D,colour,colour(red)),
        send(D, append, new(Menu, menu_bar)),
        send(Menu, append, new(Iniciar, popup(iniciar))),
        send(Menu, append, new(Ayuda, popup(ayuda))),
        send_list(Iniciar, append,
                         [ menu_item(iniciar, message(@prolog,pp))
                         ]),
        send_list(Ayuda, append,
                         [ menu_item(autores, message(@display, inform, 'BUAP-IA primavera 2018'))
                         ]),
        mostrar('./SEherpetofauna/rep.jpg',D,Menu),send(D,open,point(200,200)).

mostrar(V,D,M):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D1,below(M)).
%%%FIN DE VENTANA PRINCIPAL%%%

%%%INICIO FUNCION PARA ELEGIR LAGARTO O SERPIENTE%%%
pp:-new(D,dialog('PREGUNTAS')),
        new(Pre1,menu('�TIENE EXTREMIDADES ?')),
       send_list(Pre1,append,[si , no]),

          send(D,append,Pre1),

      new(B,button(siguiente,and(message(@prolog,principal,Pre1?selection),message(D,destroy)))),
      send(D,append,B),
      send(D,default_button,siguiente),
        send(D,open,point(350,350)).
%%%FIN FUNCION PARA ELEGIR LAGARTO O SERPIENTE%%%

%%%INICIO FUNCION PARA EXTREMIDADES = SI MANDA A LLAMAR A lag un submenu con preguntas de lagartos%%%
%PARA LAGARTOS
principal(P1):-
espregunta('TIENE EXTREMIDADDES ?',P1),P1='si',
lag.
%%%FIN FUNCION PARA EXTREMIDADES = SI MANDA A LLAMAR A lag un submenu con preguntas de lagartos%%%

%%%INICIO FUNCION PARA EXTREMIDADES = NO MANDA A LLAMAR A ser un submenu con preguntas de serpientes%%%
principal(P1):-
espregunta('TIENE EXTREMIDADES ?',P1),P1='no',
ser.
%%%FIN FUNCION PARA EXTREMIDADES = NO MANDA A LLAMAR A ser un submenu con preguntas de serpientes%%%
