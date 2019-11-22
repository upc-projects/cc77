:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_unix_daemon)).
:- use_module(library(http/http_parameters)).

:- initialization http_daemon.

:- multifile http:location/3.
:- dynamic   http:location/3.
http:location(images, root(images), []).
http:location(styles, root(styles), []).
http:location(scripts, root(scripts), []).

:- http_handler('/',  form_handler, [prefix]).
:- http_handler(images(.), http_reply_from_files('./images', []), [prefix]).
:- http_handler(styles(.), http_reply_from_files('./styles', []), [prefix]).
:- http_handler(scripts(.), http_reply_from_files('./scripts', []), [prefix]).

% Fresh form with all blank fields
form_handler(Request) :-
  memberchk(method(get), Request),
  \+memberchk(search(_), Request),
  term_string(Request, String),
  render_form('', '', '', '', '', '', '',String).  

% Submitted form that needs validity test
form_handler(Request) :-
  (memberchk(method(post), Request) ; memberchk(search(_), Request)),
  term_string(Request, String),
  http_parameters(Request,
    % minuscula parametro (Mayuscula valor)
    [mucosidad(Mucosidad, [default('')]),
     dolorcabeza(DolorCabeza, [default('')]),
     estornudos(Estornudos, [default('')]),
     garganta(Garganta, [default('')]),
     fiebre(Fiebre, [default('')]),
     resfriado(Resfriado, [default('')]),
     dolorcuerpo(DolorCuerpo, [default('')])
     ]),
     hypothesis(Disease, Mucosidad, DolorCabeza,Estornudos , Garganta, Fiebre, Resfriado, DolorCuerpo),
    %  undo.
    reply_html_page(
      [title('IA para Medicina'),
       link([rel('stylesheet'), href('https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css')])],
      [h2('Segun sintomas es probable que sufras de , ~w !'-[Disease]),
       p('Ten cuidado')]).
  % validate_form(Mucosidad, DolorCabeza, Estornudos, MonthError, DayError, Garganta, YearError),
  % ((MonthError = '', DayError = '', YearError = '') ->
  % hypothesis(Disease, Mucosidad, DolorCabeza, Estornudos, Garganta),
  %   reply_html_page(
  %     [title('IA para Medicina'),
  %      link([rel('stylesheet'), href('https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css')])],
  %     [h2('Segun sintomas es probable que sufras de , ~w !'-[Disease]),
  %      p('Ten cuidado')])
  % ;
  % render_form(Mucosidad, MonthError, DolorCabeza, DayError, Estornudos, YearError, Garganta, String)).

render_form(Mucosidad, DolorCabeza,Estornudos , Garganta, Fiebre, Resfriado, DolorCuerpo, RequestString) :-
  reply_html_page(
    [title('IA para Medicina'),
     link([rel('stylesheet'), href('https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css')])],
    [div([class('container')],
    [form([name('sintomas'), action=('/'), method('GET')],
      [h2('Cuales son tus sintomas?'),
      h3('Responde con si y no'),
       div([label([for('mucosidad')], 'Mucosidad:'),
            input([type('text'), id('mucosidad'), name('mucosidad'), value(Mucosidad)]),
            span([class('error'), id('error_month')], '')]),
       div([label([for('dolorcabeza')], 'DolorCabeza:'),
            input([type('text'), id('dolorcabeza'), name('dolorcabeza'), value(DolorCabeza)]),
            span([class('error'), id('error_day')], '')]),
       div([label([for('estornudos')], 'Estornudos:'),
            input([type('text'), id('estornudos'), name('estornudos'), value(Estornudos)]),
            span([class('error'), id('error_year')], '')]),
      div([label([for('garganta')], 'Garganta:'),
            input([type('text'), id('garganta'), name('garganta'), value(Garganta)]),
            span([class('error'), id('error_year')], '')]),
      div([label([for('fiebre')], 'Fiebre:'),
            input([type('text'), id('fiebre'), name('fiebre'), value(Fiebre)]),
            span([class('error'), id('error_year')], '')]),
      div([label([for('dolorcuerpo')], 'Dolor Cuerpo:'),
            input([type('text'), id('dolorcuerpo'), name('dolorcuerpo'), value(DolorCuerpo)]),
            span([class('error'), id('error_year')], '')]),
      div([label([for('resfriado')], 'Resfriado:'),
            input([type('text'), id('resfriado'), name('resfriado'), value(Resfriado)]),
            span([class('error'), id('error_year')], '')]),
       div([class="button"], button([type('submit')], 'Envia tus sintomas'))]),
     p('')])]).

% validate_form(Mucosidad, DayStr, YearStr, MonthError, DayError, YearError, Garganta) :-
%   (Mucosidad = '' -> MonthError = 'Missing mucosidad' ; 
%    (memberchk(Mucosidad, ['yes','no']) ->
%    MonthError = '' ; string_concat(Mucosidad, ' is not a valid mucosidad', MonthError))),
  
%   (DayStr = '' -> DayError = 'Missing dolorcabeza' ;
%       (memberchk(DayStr, ['yes','no']) ->
%       DayError = '' ; string_concat(DayStr, ' is not a valid mucosidad', DayError))),
  
%   (YearStr = '' -> YearError = 'Missing estornudos' ;
%       (memberchk(YearStr, ['yes','no']) ->
%       YearError = '' ; string_concat(YearStr, ' is not a valid mucosidad', YearError))).

/*Source code of expert system*/

  
  /*Hypothesis that should be tested*/
  hypothesis(cold, Mucosidad, DolorCabeza,Estornudos , Garganta, Fiebre, Resfriado, DolorCuerpo) :- cold(Mucosidad, DolorCabeza,Estornudos , Garganta, Fiebre, Resfriado, DolorCuerpo), !.
  hypothesis(flu, Mucosidad, DolorCabeza,Estornudos , Garganta, Fiebre, Resfriado, DolorCuerpo) :- flu(Mucosidad, DolorCabeza,Estornudos , Garganta, Fiebre, Resfriado, DolorCuerpo), !.
  % hypothesis(typhoid) :- typhoid, !.
  % hypothesis(measles) :- measles, !.
  % hypothesis(malaria) :- malaria, !.
  hypothesis(unknown). /* no diagnosis*/
  
  /*Hypothesis Identification Rules*/
  
  cold(Mucosidad, DolorCabeza,Estornudos , Garganta, Fiebre, Resfriado, DolorCuerpo) :-
  verify(headache, DolorCabeza),
  verify(runny_nose, Mucosidad),
  verify(sneezing, Estornudos),
  verify(sore_throat, Garganta).
  % write('Advices and Sugestions:'),
  % nl,
  % write('1: Tylenol/tab'),
  % nl,
  % write('2: panadol/tab'),
  % nl,
  % write('3: Nasal spray'),
  % nl,
  % write('Please weare warm cloths Because'),
  % nl.
  
  flu(Mucosidad, DolorCabeza,Estornudos , Garganta, Fiebre, Resfriado, DolorCuerpo) :-
  verify(fever, Fiebre),
  verify(headache, DolorCabeza),
  verify(chills, Resfriado),
  verify(body_ache, DolorCuerpo).
  % write('Advices and Sugestions:'),
  % nl,
  % write('1: Tamiflu/tab'),
  % nl,
  % write('2: panadol/tab'),
  % nl,
  % write('3: Zanamivir/tab'),
  % nl,
  % write('Please take a warm bath and do salt gargling Because'),
  % nl.
  
  typhoid :-
  verify(headache),
  verify(abdominal_pain),
  verify(poor_appetite),
  verify(fever).
  % write('Advices and Sugestions:'),
  % nl,
  % write('1: Chloramphenicol/tab'),
  % nl,
  % write('2: Amoxicillin/tab'),
  % nl,
  % write('3: Ciprofloxacin/tab'),
  % nl,
  % write('4: Azithromycin/tab'),
  % nl,
  % write('Please do complete bed rest and take soft Diet Because'),
  % nl.
  
  measles :-
  verify(fever),
  verify(runny_nose),
  verify(rash),
  verify(conjunctivitis).
  % write('Advices and Sugestions:'),
  % nl,
  % write('1: Tylenol/tab'),
  % nl,
  % write('2: Aleve/tab'),
  % nl,
  % write('3: Advil/tab'),
  % nl,
  % write('4: Vitamin A'),
  % nl,
  % write('Please Get rest and use more liquid Because'),
  % nl.
  
  malaria :-
  verify(fever),
  verify(sweating),
  verify(headache),
  verify(nausea),
  verify(vomiting),
  verify(diarrhea).
  % write('Advices and Sugestions:'),
  % nl,
  % write('1: Aralen/tab'),
  % nl,
  % write('2: Qualaquin/tab'),
  % nl,
  % write('3: Plaquenil/tab'),
  % nl,
  % write('4: Mefloquine'),
  % nl,
  % write('Please do not sleep in open air and cover your full skin Because'),
  % nl.
  
  
  
  :- dynamic yes/1,no/1.
  /*How to verify something */
  verify(S, R) :-
  (yes(S)
  ->
  true ;
  (no(S)
  ->
  fail ;
  ask(S, R))
  ).
  
  /* undo all yes/no assertions*/
  undo :- retract(yes(_)),fail.
  undo :- retract(no(_)),fail.
  undo.
  
  /* how to ask questions */
  ask(Question, Respo) :-
      % write('Does the patient have following symptom:'),
      % write(Question),
      % write('? '),
      % read(Response),
      % nl,
      ( (Respo == si)
      ->
      assert(yes(Question)) ;
      assert(no(Question)), fail).
  
  