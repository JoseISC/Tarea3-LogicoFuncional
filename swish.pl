% alimentos.pl

% --- Entradas ---
entrada(paella).
entrada(gazpacho).
entrada(pasta).
entrada(ensalada_cesar).
entrada(sopa_verduras).

% --- Platos Principales ---
principal(filete_cerdo).
principal(pollo_asado).
principal(bisteck_pobre).
principal(trucha).
principal(bacalao).
principal(salmon_plancha).
principal(lasagna).

% --- Postres ---
postre(flan).
postre(naranja).
postre(nueces).
postre(yogurt).
postre(helado).

% --- Calorías ---
calorias(paella,200).
calorias(gazpacho,150).
calorias(pasta,300).
calorias(ensalada_cesar,180).
calorias(sopa_verduras,120).
calorias(filete_cerdo,400).
calorias(pollo_asado,280).
calorias(bisteck_pobre,500).
calorias(trucha,160).
calorias(bacalao,300).
calorias(salmon_plancha,350).
calorias(lasagna,450).
calorias(flan,200).
calorias(naranja,50).
calorias(nueces,500).
calorias(yogurt,100).
calorias(helado,250).

% =========================================
% Reglas y funcionalidades
% =========================================

% Suma las calorías de un menú
sumar_calorias(E,P,D,Total) :-
    calorias(E,CE),
    calorias(P,CP),
    calorias(D,CD),
    Total is CE + CP + CD.

% Muestra una combinación formateada
mostrar_combinacion(E,P,D,Total) :-
    format('* Entrada: ~w (~w kcal)~n',  [E,CE]), calorias(E,CE),
    format('  Principal: ~w (~w kcal)~n',[P,CP]), calorias(P,CP),
    format('  Postre: ~w (~w kcal)~n',   [D,CD]), calorias(D,CD),
    Total is CE+CP+CD,
    format('  TOTAL: ~w calorías~n~n',   [Total]).

% Opción 1: cálculo de calorías de un menú específico
opcion_calculo_menu :-
    repeat,
      write('Ingrese Entrada: '),   read(E),
      ( entrada(E) -> true
      ; writeln('¡Entrada inválida, intente de nuevo.'), fail
      ),
      write('Ingrese Principal: '), read(P),
      ( principal(P) -> true
      ; writeln('¡Principal inválido, intente de nuevo.'), fail
      ),
      write('Ingrese Postre: '),    read(D),
      ( postre(D) -> true
      ; writeln('¡Postre inválido, intente de nuevo.'), fail
      ),
      !,
    sumar_calorias(E,P,D,T),
    format('El total de calorías es: ~w kcal.~n~n', [T]).

% Opción 2: listar combinaciones por debajo de un límite
opcion_listar_bajas :-
    write('Ingrese límite máximo de calorías: '), read(Lim),
    nl, writeln('--- COMBINACIONES DISPONIBLES ---'), nl,
    ( 
      entrada(E), principal(P), postre(D),
      sumar_calorias(E,P,D,T), T =< Lim,
      mostrar_combinacion(E,P,D,T),
      fail
    ; true
    ).

% Menú principal
main :-
  repeat,
    writeln('BIENVENIDO A "MI MEJOR COMIDA"'),
    writeln('1. Calcular calorías de un menú específico'),
    writeln('2. Mostrar combinaciones bajas en calorías'),
    writeln('3. Salir'),
    write('Seleccione una opción (1-3): '), read(O), nl,
    ( O =:= 1 -> opcion_calculo_menu
    ; O =:= 2 -> opcion_listar_bajas
    ; O =:= 3 -> writeln('¡Hasta luego!'), !
    ; writeln('Opción inválida, intente de nuevo.'), fail
    ),
  nl, fail.
