\version "2.6.0"
\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Passio Salvatoris et Domini Nostri Jesu Christi"
    %subtitle = \markup \italic { (First Booke of Songes or Ayres) }
    %composer = "John Dowland (1562-1638)"
    copyright = "Zrajm C Akfohg, March 2006"
    tagline = ""
}
#(set-global-staff-size 16)
%#(set-default-paper-size "a4" 'landscape)
#(set-default-paper-size "a4")
\paper {
    betweensystempadding = #1
    %betweensystemspace  = 4\mm
    raggedbottom         = ##t
    %raggedright         = ##t
    raggedlast           = ##t      % make last note system raggedright
    printpagenumber      = ##f      % turn on/off page number printing
}
\layout { papersize = "a4"
    \context {
        \Score \consists Span_bar_engraver
    }
    %\context {
    %    \Staff \remove "Beam_engraver"
    %}
}
\midi {
    \tempo 4  =  50
}


% TODO:
%
%   o find a better way to line upp lyrics and notes that does not interfer with
%     the up/downwardness of stems
%   o alway print key after clef
%   o disable beaming warnings?
%   o where to place a global "layout" section, valid for all staves?
%   o create \fermataBracketed -- should output a bracketed fermata in, but
%     otherwise work as \fermata (in ¿note? context) -- using some combination
%     of commands `\musicglyph #"scripts.ufermata"' and `\mark', perhaps?
%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Functions                                                                %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Syntax: \instrFix #"Instrument" /zrajm [2006-03-22]
#(def-markup-command (instrFix layout props name) (markup?)
    "Right align instrument name and put some space between it an the staff."
    (interpret-markup layout props
        (markup #:column (#:right-align name) #:null)))


labelChorus = {
    \bar "" \mark \markup {
        \hspace #0 \raise #0.25
        \large \bold \italic "Chorus:"
    }
    %\bar "" \mark \markup { \large \bold "Chorus:" }
}
evangelistaSings = {
    \clef "treble_8"
    \bar "" \mark \markup {
        \hspace #0 \raise #0.25
        \right-align {
            \large \bold \italic "Evangelista:"
        }
    }
}
jesusSings = {
    \clef bass
    \bar "" \mark \markup {
        \hspace #0 \raise #0.25
        \large \bold \italic "Jesus:"
    }
}
ancillaSings = {
    \clef treble
    \bar "" \mark \markup {
        \hspace #0 \raise #0.25
        \large \bold \italic "Ancilla:"
    }
}
petrusSings = {
    \clef treble
    \bar "" \mark \markup {
        \hspace #0 \raise #0.25
        \large \bold \italic "Petrus:"
    }
    \bar "" \mark \markup { \large \bold "Petrus:" }
}
servusSings = {
    \clef treble
    \bar "" \mark \markup {
        \hspace #0 \raise #0.25
        \large \bold \italic "Servus:"
    }
}


fermataBracketed = \markup {
    % FIXME: The correct thingy is prolly to override the standard fermata with
    % a substitute string.
    %
    % \override BreathingSign #'text
    %        = #(make-musicglyph-markup "scripts.rvarcomma")
    \center-align {
        \line {
            \bracket { \musicglyph #"scripts.ufermata" } 
        }
    }
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Original English Lyrics
lyricOne = \lyricmode {
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Notes                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


pipeSymbol = { s4 \bar "" }  % used between words in chanting


globalSettings = {
    \set Score.timing                = ##f
    \set Staff.autoBeaming           = ##f
    \set Staff.midiInstrument        = #"drawbar organ"
    \set Staff.ignoreBarChecks       = ##t
    \override Staff.TimeSignature #'break-visibility = #all-invisible
    %\set Staff.createKeyOnClefChange = ##t
    \key f\major
    %\time 8/4
}
sopranoSettings = {
    \globalSettings
    %\set Staff.instr = \markup \instrFix D
    \clef treble
}
altoSettings = {
    \globalSettings
    %\set Staff.instr = \markup\instrFix A
    \clef treble
}
tenorSettings = {
    \globalSettings
    %\set Staff.instr = \markup \instrFix T
    \clef "treble_8"
}
bassoSettings = {
    \globalSettings
    %\set Staff.instr = \markup \instrFix B
    \clef bass
}
chantSettings = {
    \globalSettings
    \override Staff.TimeSignature #'break-visibility = #all-invisible
    \override Staff.Stem          #'transparent      = ##t
    \slurUp \phrasingSlurUp       % put ties above notes
}

        nazareth = <<
        \new ChoirStaff <<
            \new Voice {
                \sopranoSettings
                \labelChorus
                \relative c'' {
                    a2[a]| a| a1[g2 g1]\fermata
                    \bar "||"
                }
            }
            \addlyrics { Jesum aff Nazareth. }
            \new Voice {
                \altoSettings
                \relative c' {
                    f2[f]| f| f1[e2 e1]\fermata
                    \bar "||"
                }
            }
            \new Voice {
               \tenorSettings
               \relative c' {
                   c2[c]| c| c1[c2 c1]\fermata
                   \bar "||"
               }
            }
            \new Voice {
               \bassoSettings
               \relative c {
                   f2[f]| f| f1[c2 c1]\fermata
                   \bar "||"
               }
            }
        >>
        >>


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Score                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




\book {

    \score { % Chorus: Wårs Herres Christi pinos[...]
        \new ChoirStaff <<
            \new Staff {
                \new Voice {
                    \set Staff.instrument = \markup \instrFix Disc.
                    \sopranoSettings
                    \labelChorus
                    \relative c'' {
                        c1 a2[a] r4
                        a2[a] a[a4] g[a2 bes4 a2] r4
                        a g2 a[a] bes[a a4] a[a1 a]^\fermataBracketed
                        %\fermata%bracketed
                    }
                }
                \addlyrics {
                    Wårs Herres
                    Christi pinos Historia
                    som oss Sanctus Johannes beskrifuer.
                }
            }
            \new Staff {
                \new Voice {
                    \set Staff.instrument = \markup\instrFix Alt.
                    \altoSettings
                    \relative c' {
                        f1 f2[f] r4
                        f2[f] f[f4] e[f2 e4 f2] r4
                        f e2 f[f] f[f f4] f[f1 f]\fermata%bracketed
                    }
                }
            }
            \new Staff {
                \new Voice {
                    \set Staff.instrument = \markup \instrFix Ten.
                    \tenorSettings
                    \relative c' {
                        c1 c2[c] r4
                        c2[c] c[c4] c[c2 bes4 c2] r4
                        c c2 c[c] d[c c4] c[c1 c]\fermata%bracketed
                    }
                }
            }
            \new Staff {
                \new Voice {
                    \set Staff.instrument = \markup \instrFix Bas.
                    \bassoSettings
                    \relative c {
                        f1 f2[f] r4
                        f2[f] f[f4] c[f2 g4 f2] r4
                        f c2 f[f] f[f f4] f[f1 f]\fermata%bracketed
                    }
                }
            }
        >> % ChoirStaff
    } % Chorus: Wårs Herres Christi pinos[...]


    \score { % Evang.: Jesus gick öfuer then Becken[...]
        \new Staff {
            \relative c' {
                \chantSettings
              % Evang.:
                \evangelistaSings
              % Jesus  gick öfuer then Becken Kidron,
                a4[c]| c|   c[c]| c|   c[c]|  a[c]\fermata|
              % ther war een örtegård,
                a|   c|  c|  c[a a]\fermata|
              % ther ingick Jesus medh sina  Läriu -- ngar.
                a|   c[c]|  c[c]| c|   c[c]| g[a]\(   g4\)[f]\fermata|
              % Men Judas  som honom förrådde, wiste thet rum,
                a| c[c]|  c|  c[c]| a[c c]|   c[c]| a|   c\fermata|
              % förty  Jesus församlade sigh ther offta med sina
                c[c]|  c[c]| c[c c c]|  c|   c|   c[c]| c|  c[c]|
                  % Läriu -- ngar.
                    g[a]\(   g4\)[f]\fermata|
              % När nu Judas hade  till sig annammat then skara, meth the öfuerste
                a|  c| c[c]| c[c]| c|   c|  c[c c]|  c|   a[c]|  c|   c|  c[c c]|
                  % Presters och Phariseers tienare,
                    c[c]|    c|  c[c c c]|  c[a a]\fermata|
              % gick han ther uth,
                a|   c|  a|   c\fermata|
              % meth blås, wapen, och wärjor.
                c|   c|    c[c]|  g|  a[(g)f]\fermata|
              % Tå Jesus nu wisste allt huad henda skulle,
                a| c[c]| c| c[c]|  c|   c|   c[c]| c[a]\fermata|
              % gick han ther uth, och sade  till them:
                a|   c|  a|   c|   c|  c[g]| a(g) f\fermata|
              % Jesus:
                \jesusSings
              % Huem söken J eff -- ter?
                f|   f[f]  c d(e)   f\fermata|
              % Evang.:
                \evangelistaSings
              % The suarade och sadhe:
                a|  c[c c]| d|  d[(e d)c]\fermata|
            }
            \addlyrics {
              % Evang.:
                Jesus gick öfuer then Becken Kidron,
                ther war een örtegård,
                ther ingick Jesus medh sina Läriu -- ngar.
                Men Judas som honom förrådde, wiste thet rum,
                förty Jesus församlade sigh ther offta med sina Läriu -- ngar.
                När nu Judas hade till sig annammat then skara, meth the öfuerste
                    Presters och Phariseers tienare,
                gick han ther uth,
                meth blås, wapen, och wärjor.
                Tå Jesus nu wisste allt huad henda skulle,
                gick han ther uth, och sade till them:
              % Jesus:
                Huem söken J eff -- ter?
              % Evang.:
                The suarade och sadhe:
            }
        } % staff
    } % Evang.: Jesus gick öfuer then Becken[...]


    % Chorus: Jesum aff Nazareth.
    \score { \nazareth }


    % Evang.: Jesus säger till them:
    \score {
        <<
            \new Staff {
                \relative c' {
                    \chantSettings
                  % Evang.:
                    \evangelistaSings
                  % Jesus säger till them:
                    a4[c]| c[g]  a(g) f\fermata|
                  % Jesus:
                    \jesusSings
                  % Thett   är Jagh.
                    e(f e)| d| d\fermata|
                  % Evang.:
                    \evangelistaSings
                  % Men Judas som honom förrådde stod och hoos them;
                    a'| c[c]| c|  c[c]| c[c c]|  c|   c|  a|   c\fermata|
                  % tå nu Jesus sade  till them thet Jagh är,
                    a| c| c[c]| c[c]| c|   c|   a|   c|   c\fermata|
                  % weko  the tilbaka, och föllo till Jord -- den,
                    c[c]| c|  c[c c]|  c|  c[c]| g|   \tieUp a(g)    f\fermata|
                  % tå sporde han them åter  till:
                    a| c[c]|  c|  g|   a[g]| f\fermata|
                  % Jesus:
                    \jesusSings
                  % Huem söken I   eff -- ter?
                    f|   f[g]| c,| d(e)   f\fermata|
                  % Evang.:
                    \evangelistaSings
                  % The sa --- de:
                    c'|  d(e d) c\fermata|
                }
                \addlyrics {
                  % Evang.:
                    Jesus säger till them:
                  % Jesus:
                    Thett är Jagh.
                  % Evang.:
                    Men Judas som honom förrådde stod och hoos them;
                    tå nu Jesus sade till them thet Jagh är,
                    weko the tilbaka, och föllo till Jord -- den,
                    tå sporde han them åter till:
                  % Jesus:
                    Huem söken I eff -- ter?
                  % Evang.:
                    The sa -- de:
                }
            } % staff
        >>
    } % score


    % Chorus: Jesum aff Nazareth.
    \score { \nazareth }


    % Evang.: Jesus suarade och sade till them: [...]
    \score {
        \new Staff {
            \relative c' {
               \chantSettings
              % Evang.:
                \evangelistaSings
              % Jesus suarade och sade  till  them:
                a[c]| c[c c]| c|  c[g]| a(g)| f\fermata|
              % Jesus:
                \jesusSings
              % Jagh sade  eder  thet ähr jag, söken I  effter mig, så läter
                f|   f[f]| f[f]| f|   d|  f|   f[f]| f| f[f]|  f|   f| g[g]|
              %     thes -- se gå.
                    g(a)    g| f\fermata|
            }
            \addlyrics {
              % Evang.:
                Jesus suarade och sade till them:
              % Jesus:
                Jagh sade eder thet ähr jag, söken I effter mig, så läter
                    thes -- se gå.
            }
        } % staff
    } % Evang.: Jesus suarade och sade till them: [...]


    % Koral nr. 7
    \markup {
        \fill-line {
            \override #'(box-padding . 2.0)
            \override #'(thickness   . 0.5)
            \box \huge \bigger \bigger \bold \italic \line {
                Koral nr. 7
            }
        }
    }


    \score { %
        \new Staff {
            \relative c' {
               \chantSettings
              % Evang.:
                \evangelistaSings
              % På thet the ord skulle fulkomnas,
                a| c|   c|  c|  c[c]|  c[c c a]\fermata|
              % huilket han sade:
                a[c]|   a|  c[c]\fermata|
              % iag hafuer ingen förloradt af them,
                c|  c[c]|  c[c]| c[c c]|   c| c\fermata|
              % som tu haffuer giffuit mig.
                c|  c| c[g]|   a[g]|   f\fermata|
              % Ta       hade  Simon Petrus itt Suerd,
                a^"Kollas!"| c[c]| c[c]| c[c]|  a|  c\fermata|
              % och drog thet uth,
                c|  c|   a|   c\fermata|
              % och slog effter then öfuerste Prestens dreng,
                c|  c|   c[c]|  c|   c[c c]|  c[a]|    c\fermata|
              % och högg thet högra örat  af honom,
                c|  c|   c|   c[c]| c[c]| a| c[c]\fermata|
              % och then dreng heet Mal -- cus;
                c|  c|   c|    g|   a(g)   f\fermata|
              % tå sade  Jesus till Pet -- rum:
                a| c[c]| c[c]| g|   a(g)   f\fermata|
              % Jesus:
                \jesusSings
              % Petre stick titt Suerd i  Ballion,
                f[f]| f|    f|   f|    f| f[d]\fermata|
              % skall iag icke  dricka then kalck, som min fader haffuer gifuit
                d|    f|  f[f]| f[f]|  d|   f|     f|  f|  f[f]| f[c]|   d[e]|
                  % mig?
                    f\fermata|
            }
            \addlyrics {
              % Evang.:
                På thet the ord skulle fulkomnas,
                huilket han sade:
                iag hafuer ingen förloradt af them,
                som tu haffuer giffuit mig.
                Ta hade Simon Petrus itt Suerd,
                och drog thet uth,
                och slog effter then öfuerste Prestens dreng,
                och högg thet högra örat af honom,
                och then dreng heet Mal -- cus;
                tå sade Jesus till Pet -- rum:
              % Jesus:
                Petre stick titt Suerd i Ballion,
                skall iag icke dricka then kalck, som min fader haffuer gifuit mig?
            }
        } % staff
    }

    % Koral nr. 9
    \markup {
        \fill-line {
            \override #'(box-padding . 2.0)
            \override #'(thickness   . 0.5)
            \box \huge \bigger \bigger \bold \italic \line {
                Koral nr. 9
            }
        }
    }


    \score { %
        \new Staff {
            \relative c' {
                \chantSettings
              % Evang.:
                \evangelistaSings
              % Men skaren och then öfuerste Höfuitzman,
                a|  c[c]|  c|  c|   c[c c]|  c[a c]\fermata|
              % och Judarnas tienare,
                c|  c[c c]|  c[a a]\fermata|
              % togo  Jesum och bundo honom,
                a[c]| c[c]| c|  c[c]| c[a]\fermata|
              % och förde honom först till Hannam, Caiphae Suåger, huilken i
                a|  c[c]| c[c]| c|    c|   c[c]|   c[a]|   c[c]|   c[c]|   c|
              %     thet år öffuerste prest war.
                    c|   c| c[g a]|   g|    f\fermata|

              % Men then war Caiphas som gaff Judomen rådh,
                a|  c|   c|  c[c]|   c|  c|   c[c a]| c\fermata|
              % att thet war godt een Mennskia dödde för fol -- cket.
                c|  c|   c|  c|   c|  c[c]|    c[c]| g|  a(g)   f\fermata|
              % Men Simon Petrus och een annan Läriunge,
                a|  c[c]| c[c]|  c|  c|  c[c]| a[c c]\fermata|
              % folgde effter Jesum then samme Läriungen war kend met Bispen,
                c[c]|  c[c]|  c[a]| a|   c[c]| c[c c]|   c|  c|   a|  c[c]\fermata|
              % och gick in meth Jesum i  then öffuerste prestens Saal,
                c|  c|   c| c|   c[c]| c| c|   c[c c]|   c[a]|    c\fermata|
              % och Petrus stod uthan för dören;
                c|  c[c]|  c|   c[c]| c|  c[a]\fermata|
              % tå gick then andre Läriungen uth,
                a| c|   c|   c[c]  c[c a]|   c\fermata|
              % och talade  meth Dörewechterskan och flijdde Petrum in,
                c|  c[c c]| c|   c[c c c c]|     c|  c[a]|   a[g]|  f\fermata|
              % tå sade  Dörewechterskian till Pet -- rum
                a| c[c]| c[c c c c]|      d|   d(e d) c\fermata|
              % Ancilla:
                \ancillaSings
              % Ästu  icke  eenn aff thenne Mansen Läriu -- ngar?
                d[f]| f[f]| f|   f|  f[f]|  f[f]|  c[d]\(   e\)[f]\fermata|
              % Evang.:
                \evangelistaSings
              % Han sa -- de:
                c| d(e d) c\fermata|
              % Petrus:
                \petrusSings
              % Jagh är icke.
                f|   d| f[f]\fermata|
              % Evang.:
                \evangelistaSings
              % Men Suennerna och tienarnar stodo och hade  giordt een
                a,| c[c c]|   c|  c[c c]|   c[c]| c|  c[c]| c|     a|
                  % Kåleld,
                    c[c]\fermata|
              % ty thet war kalt,
                c| c|   a|  c\fermata|
              % och Petrus stod hoos them och wermde sig.
                c|  c[c]|  c|   c|   c|   g|  a[g]|  f\fermata|
              % Men then öfuerste Prest sporde Jesum om hans läriungar och om
                a|  c|   c[c c]|  c|    c[c]|  c[c]| c| c|   c[c c]|   c|  c|
                  % hans lärdom,
                    c|   c[a]\fermata|
              % och Jesus suarade:
                c|  c[g]| a[g f]\fermata|
              % Jesus:
                \jesusSings
              % Jagh haffuer talat uppenbarliga för werlden;
                f|   f[f]|   f[f]| f[f f f f]|  d|  f[f]\fermata|
              % iag lärde altid i  Synagoger och Templer,
                f|  f[f]| f[f]| f| f[f f f]| f|  f[d]\fermata|
              % ther som alle  Judar kommo tilsamman,
                d|   f|  f[f]| f[f]| f[f]| f[f d]\fermata|
              % iag hafuer inthet talat i  löndom; huij spör tu mig ther
                d|  f[f]|  f[f]|  f[f]| d| f[f]|   f|   f|   c| d|  e|
                   % om,
                     f\fermata|
              % spör them åth som hafua hördt huad iag talade  till them.
                f|   f|   f|  f|  f[f]| f|    f|   f|  f[f f]| d|   f\fermata|
              % Sij the wetha huad iag ha -- fuer    sagdt.
                d|  f|  f[f]| f|   f|  g\(   a\)[g]| f\fermata|
              % Evang.:
                \evangelistaSings
              % Som han thetta talade,
                a|  c|  c[c]|  c[c c]\fermata|
              % gaf een aff tienarnar Jesum een Kindpust och sade:
                a|  c|  c|  c[c c]|   c[c]| a|  c[c]|    d|  d[(e d) c]\fermata|
              % Servus:
                \servusSings
              % Skal tu så suara then öffwersta Prest?
                d|   f| f| f[f]| f|   c[d e]|   f\fermata|
              % Evang.:
                \evangelistaSings
              % Jesus suarade:
                c[g]| a[g f]\fermata|
              % Jesus:
                \jesusSings
              % Haffuer iag talat illa  så bewijs thet wara  oreth; men hafuer
                f[f]|   f|  f[f]| f[d]| d| f[f]|  f|   f[f]| d[f]|  f|  f[f]|
                  % iag talat rett, huij slår tu migh?
                    f|  f[f]| f|    c|   d|   e|  f\fermata|
            }
            \addlyrics {
              % Evang.:
                Men skaren och then öfuerste Höfuitzman,
                och Judarnas tienare,
                togo Jesum och bundo honom,
                och förde honom först till Hannam, Caiphae Suåger, huilken i
                    thet år öffuerste prest war.
                Men then war Caiphas som gaff Judomen rådh,
                att thet war godt een Mennskia dödde för fol -- cket.
                Men Simon Petrus och een annan Läriunge,
                folgde effter Jesum then samme Läriungen war kend met Bispen,
                och gick in meth Jesum i then öffuerste prestens Saal,
                och Petrus stod uthan för dören;
                tå gick then andre Läriungen uth,
                och talade meth Dörewechterskan och flijdde Petrum in,
                tå sade Dörewechterskian till Pet -- rum
              % Ancilla:
                Ästu icke eenn aff thenne Mansen Läriu -- ngar?
              % Evang.:
                Han sa -- de:
              % Petrus:
                Jagh är icke.
              % Evang.:
                Men Suennerna och tienarnar stodo och hade giordt een Kåleld,
                ty thet war kalt,
                och Petrus stod hoos them och wermde sig.
                Men then öfuerste Prest sporde Jesum om hans läriungar och om hans lärdom,
                och Jesus suarade:
              % Jesus:
                Jagh haffuer talat uppenbarliga för werlden;
                iag lärde altid i Synagoger och Templer,
                ther som alle Judar kommo tilsamman,
                iag hafuer inthet talat i löndom; huij spör tu mig ther om,
                spör them åth som hafua hördt huad iag talade till them.
                Sij the wetha huad iag ha -- fuer sagdt.
              % Evang.:
                Som han thetta talade,
                gaf een aff tienarnar Jesum een Kindpust och sade:
              % Servus:
                Skal tu så suara then öffwersta Prest?
              % Evang.:
                Jesus suarade:
              % Jesus:
                Haffuer iag talat illa så bewijs thet wara oreth; men hafuer
                    iag talat rett, huij slår tu migh?
            }
        } % staff
    }

    % Koral nr. 15
    \markup {
        \fill-line {
            \override #'(box-padding . 2.0)
            \override #'(thickness   . 0.5)
            \box \huge \bigger \bigger \bold \italic \line {
                Koral nr. 15
            }
        }
    }

    \score { %
        \new Staff {
            \relative c' {
                \chantSettings
                \evangelistaSings
              % Men Simon Petrus stod och wermde sig
                a|  c[c]| c[c]|  c|   c|  c[a]|  c\fermata|
              % och the sade  till ho --- nom:
                a|  c|  c[c]| d|   d(e d) c\fermata|

            }
            \addlyrics {
                Men Simon Petrus stod och wermde sig
                och the sade till ho -- nom:
            }
        } % staff
    }


    \score { % Ästu icke een aff hans läriungar?
        <<
        \new ChoirStaff <<
            \new Voice {
                \sopranoSettings
                \labelChorus
                \relative c'' {
                  % Ästu   icke   een aff hans läriungar? }
                    a2[a]| a4[a]| a2| a|  a|   a[bes1 a]\fermata \bar "||"
                }
            }
            \addlyrics { Ästu icke een aff hans läriungar? }
            \new Voice {
                \altoSettings
                \relative c' {
                    f2[f]| f4[f]| f2| f|  f|   f[f1 f]\fermata \bar "||"
                }
            }
            \new Voice {
                \tenorSettings
                \relative c' {
                    c2[c]| c4[c]| c2| c|  c|   c[d1 c]\fermata \bar "||"
                }
            }
            \new Voice {
                \bassoSettings
                \relative c {
                    f2[f]| f4[f]| f2| f|  f|   f[bes1 f]\fermata \bar "||"
                }
            }
        >>
        >>
    }


%    \score { %
%        \new Staff {
%            \relative c' {
%                \chantSettings
%
%            }
%            \addlyrics {
%            }
%        } % staff
%    }





} % book

%[[eof]]
