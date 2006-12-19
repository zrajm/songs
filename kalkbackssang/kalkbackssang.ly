\version "2.8.0"

%
% TODO:
%
%   o finish transcription
%   o check the one or two weird things with someone who knows
%   o make sure all "mf", "f", "ff" etc markings are present
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% License: Attribution-ShareAlike2.5 License
%
% [2006-12-14] written by Zrajm C Akfohg using Lilypond 2.8.8
%
% Kälkbackssång
%
% Kälkarna fram! Kälkarna fram! Solen högt på himlen är och manar oss att hand
% i hand. Skynda till berget höjd. Därifrån vi med fröjd, åka ner med blixtens
% fart, men välta ock ibland.
%
% Snötäcket hvilar så lugnt över jorden. Kälkbacken är som en spegel så hal.
% Broder hur skönt är ej vintern i Norden.  Friskhet och lif bor i berg och
% dal.
%
% Framåt framåt Skynda medan tider är!  framåt framåt Snart ja middag är.
%
% Anförarn fram! Ge oss ton! La- Ja! framåt marsch! Gossar blå ingen här svika
% må raskt framåt på vår gladta stråt gossar blå ingen här svika må raskt
% framåt! på vår gladta stråt kom skynda kom kom skynda kom Si opp! Si opp!
%

\header {
    title = \markup { Kälkbacks-sång. }
    %subtitle = \markup \italic { The Warrior’s Anthem. }
    composer = \markup {
        H.K.H. Prins Gustaf, %(birth–death)
        %\italic { First Booke of Songes or Ayres, }
        6 mars 1852
    }
    dedication = \markup \italic {
        De kälkåkande på Ultuna vänskapsfullt tillegnad.
    }
    tagline = \markup \column { \center-align {
        \line { Zrajm C Akfohg, December 2006 }
        \line { http://zrajm.klingonska.org/songs/ }
    }}
}


myStaffSize = #18
#(set-global-staff-size myStaffSize)
\paper {

    #(set-paper-size "a4" 'landscape)  % A4 = 210mm × 297.9mm
    %linewidth = 277\mm

    ragged-bottom     = ##t
    print-page-number = ##f  % turn on/off page number printing
    page-top-space    = 0\mm
}

\layout {
    \context {
        \Lyrics
        \override LyricSpace #'minimum-distance = #1 %default: #0.45
            % Widen space between words in lyrics a little bit (otherwise the
            % word separation it difficult to spot when the space occurs
            % between two apostrophes). /zrajm [2006-12-13]
    }
    \context {
        \Score
        \override PaperColumn #'keep-inside-line = ##t
    }
    \context {
        \Staff
        \consists Ambitus_engraver
    }
}
\midi {
    \tempo 4 = 120
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Functions                                                                %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


left = {
    \once \override LyricText #'self-alignment-X = #-1 %default: #0
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Choir Notes                                                              %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

midiInstrumentVoice = #"drawbar organ"


\parallelMusic #'(lyricA voiceA lyricB voiceB lyricC voiceC lyricD voiceD) {
    \lyricmode { Snö -- täck -- et }      | % T1
    g'4\mf ~ \times 2/3 { g'8 f'8 d'8 }   | % T1
    \lyricmode { Snö -- täck -- et ren }  | % T2
    \times 2/3 { g8 g8 g8 } g4            | % T2
    \lyricmode { Snö -- täck -- et ren }  | % B1
    \times 2/3 { d8\mf d8 d8 } d4         | % B1
    \lyricmode { Snö -- täck -- et ren }  | % B2
    \times 2/3 { b,8 b,8 b,8 } b,4        | % B2

    \lyricmode { hvi -- lar -- så }       | % T1
    e'4 ~ \times 2/3 { e'8 c'8 d'8 }      | % T1
    \lyricmode { hvi -- lar -- så lungt } | % T2
    \times 2/3 { g8 g8 g8 } g4            | % T2
    \lyricmode { hvi -- lar -- så lungt } | % B1
    \times 2/3 { c8 e8 e8 } e4            | % B1
    \lyricmode { hvi -- lar -- så lungt } | % B2
    \times 2/3 { c8 c8 c8 } c4            | % B2

    \lyricmode { lugnt -- öf -- ver }     | % T1
    e'4 ~ \times 2/3 { e'8 d'8 b8 }       | % T1
    \lyricmode { öf -- ver vår jord }     | % T2
    \times 2/3 { eis8 eis8 eis8 } eis4    | % T2
    \lyricmode { öf -- ver vår jord }     | % B1
    \times 2/3 { e8 e8 e8 } e4            | % B1
    \lyricmode { öf -- ver vår jord }     | % B2
    \times 2/3 { b,8 b,8 b,8 } b,4        | % B2

    \lyricmode { jor -- den. }            | % T1
    d'4 c'4                               | % T1
    \lyricmode { öf -- ver vår jord. }    | % T2
    \times 2/3 { a8 a8 a8 } a4            | % T2
    \lyricmode { öf -- ver vår jord. }    | % B1
    \times 2/3 { e8 e8 e8 } e4            | % B1
    \lyricmode { öf -- ver vår jord. }    | % B2
    \times 2/3 { a,8 a,8 a,8 } a,4        | % B2

    \lyricmode { Kälk -- back -- en }     | % T1
    c'4 ~ \times 2/3 { c'8 b8 a8 }        | % T1
    \lyricmode { Kälk -- back -- en är }  | % T2
    \times 2/3 { fis8 fis8 fis8 } a4      | % T2
    \lyricmode { Kälk -- back -- en är }  | % B1
    \times 2/3 { es8 es8 es8 } es4        | % B1
    \lyricmode { Kälk -- back -- en är }  | % B2
    \times 2/3 { a,8 a,8 a,8 } fis,4      | % B2

    \lyricmode { är som en }              | % T1
    g4 ~ \times 2/3 { g8 b8 c'8 }         | % T1
    \lyricmode { kälk -- back -- en är }  | % T2
    \times 2/3 { g8 g8 g8 } g4            | % T2
    \lyricmode { kälk -- back -- en är }  | % B1
    \times 2/3 { e!8 e8 e8 } e4           | % B1 (kept caut.acc.)
    \lyricmode { kälk -- back -- en är }  | % B2
    \times 2/3 { g,8 g,8 g,8 } g,4        | % B2

    \lyricmode { spe -- gel så }          | % T1
    d'4 ~ \times 2/3 { d'8 d'8 dis'8 }    | % T1
    \lyricmode { li -- ka som en }        | % T2
    \times 2/3 { g8 g8 g8 } g4            | % T2
    \lyricmode { li -- ka som en }        | % B1
    \times 2/3 { f8 f8 f8 } f4            | % B1
    \lyricmode { li -- ka som en }        | % B2
    \times 2/3 { g,8 g,8 g,8 } g,4        | % B2

    \lyricmode { hal, }                   | % T1
    e'4 r4                                | % T1
    \lyricmode { spe -- gel så hal, }     | % T2
    \times 2/3 { g8 g8 g8 } g4            | % T2
    \lyricmode { spe -- gel så hal, }     | % B1
    \times 2/3 { e8 e8 e8 } e4            | % B1
    \lyricmode { spe -- gel så hal, }     | % B2
    \times 2/3 { c8 c8 c8 } c4            | % B2

    \lyricmode { brö -- der hur }         | % T1
    g'4 ~ \times 2/3 { g'8 f'8 d'8 }      | % T1
    \lyricmode { brö -- der hur skön }    | % T2
    \times 2/3 { g8 g8 g8 } g4            | % T2
    \lyricmode { brö -- der hur skön }    | % B1
    \times 2/3 { d8 d8 d8 } d4            | % B1
    \lyricmode { brö -- der hur skön }    | % B2
    \times 2/3 { b,8 b,8 b,8 } b,4        | % B2

    \lyricmode { skön är ej }             | % T1
    e'4 ~ \times 2/3 { e'8 c'8 d'8 }      | % T1
    \lyricmode { brö -- der hur skön }    | % T2
    \times 2/3 { g8 g8 g8 } g4            | % T2
    \lyricmode { brö -- der hur skön }    | % B1
    \times 2/3 { c8 e8 e8 } e4            | % B1
    \lyricmode { brö -- der hur skön }    | % B2
    \times 2/3 { c8 c8 c8 } c4            | % B2

    \lyricmode { vin -- tern i }          | % T1
    e'4 ~ \times 2/3 { e'8 d'8 b8 }       | % T1
    \lyricmode { är vin -- tern ej }      | % T2
    \times 2/3 { gis8 gis8 gis8 } gis4    | % T2
    \lyricmode { är vin -- tern ej }      | % B1
    \times 2/3 { e8 e8 e8 } e4            | % B1
    \lyricmode { är vin -- tern ej }      | % B2
    \times 2/3 { b,8 b,8 b,8 } b,4        | % B2

    \lyricmode { nor -- den. }            | % T1
    d'4 c'4                               | % T1
    \lyricmode { här i vår nord. }        | % T2
    \times 2/3 { a8 a8 a8 } a4            | % T2
    \lyricmode { här i vår nord. }        | % B1
    \times 2/3 { es8 es8 es8 } es4        | % B1
    \lyricmode { här i vår nord. }        | % B2
    \times 2/3 { a,8 a,8 a,8 } a,4        | % B2

    \lyricmode { Frisk -- het och }       | % T1
    c'4 ~ \times 2/3 { c'8 b8 a8 }        | % T1
    \lyricmode { Frisk -- het och lif, }  | % T2
    \times 2/3 { fis8 fis8 fis8 } a4      | % T2
    \lyricmode { Frisk -- het och lif, }  | % B1
    \times 2/3 { es8 es8 es8 } es4        | % B1
    \lyricmode { Frisk -- het och lif, }  | % B2
    \times 2/3 { a,8 a,8 a,8 } fis,4      | % B2

    \lyricmode { lif bo på }              | % T1
    g4 ~ \times 2/3 { g8 c'8 e'8 }        | % T1
    \lyricmode { frisk -- het och lif }   | % T2
    \times 2/3 { g8 g8 g8 } g4            | % T2
    \lyricmode { frisk -- het och lif }   | % B1
    \times 2/3 { e!8 e8 e8 } e4           | % B1
    \lyricmode { frisk -- het och lif }   | % B2
    \times 2/3 { g,8 g,8 g,8 } g,4        | % B2

    \lyricmode { berg och i }             | % T1
    a'4 ~ \times 2/3 { a'8 g'8 b8 }       | % T1
    \lyricmode { bo högt på berg }        | % T2
    \times 2/3 { f8 f8 f8 } f4            | % T2
    \lyricmode { bo högt på berg }        | % B1
    \times 2/3 { g8 g8 g8 } g4            | % B1
    \lyricmode { bo högt på berg }        | % B2
    \times 2/3 { g,8 g,8 g,8 } g,4        | % B2

    \lyricmode { dal. }                   | % T1
    c'4 r4                                | % T1
    \lyricmode { och ner i dal. }         | % T2
    \times 2/3 { e8 e8 e8 } e4            | % T2
    \lyricmode { och ner i dal. }         | % T2
    \times 2/3 { g8 g8 g8 } g4            | % B1
    \lyricmode { och ner i dal. }         | % T2
    \times 2/3 { c8 c8 c8 } c4            | % B2
}


\parallelMusic #'(lyricF voiceF lyricG voiceG lyricH voiceH) {
    \lyricmode { Fram -- åt, }            | % T2
    b4 c'4                                | % T2
    \lyricmode { Fram -- åt, }            | % B1
    gis4 a4                               | % B1
    \lyricmode { Fram -- åt, }            | % B2
    e4->\f e4->                           | % B2

    \lyricmode { fram -- åt }             | % T2
    b4 c'4                                | % T2
    \lyricmode { fram -- åt }             | % B1
    gis4 a4                               | % B1
    \lyricmode { fram -- åt }             | % B2
    e4 e4                                 | % B2

    \lyricmode { skyn -- da me -- dan }   | % T2
    c'8. c'16 c'8. b16                    | % T2
    \lyricmode { skyn -- da me -- dan }   | % B1
    a8. a16 g8. g16                       | % B1
    \lyricmode { skyn -- da me -- dan }   | % B2
    d8. d16 g,8. g,16                     | % B2

    \lyricmode { ti -- der är }           | % T2
    c'8. g16 g4                           | % T2
    \lyricmode { ti -- der är }           | % B1
    g8. f16 e4                            | % B1
    \lyricmode { ti -- der är }           | % B2
    c8. c16 c4                            | % B2

    \lyricmode { fram -- åt, }            | % T2
    d'4 c'4                               | % T2
    \lyricmode { fram -- åt, }            | % B1
    gis4 a4                               | % B1
    \lyricmode { fram -- åt, }            | % B2
    b,4 a,4                               | % B2

    \lyricmode { fram -- åt. }            | % T2
    b4 c'4                                | % T2
    \lyricmode { fram -- åt. }            | % B1
    gis4 a4                               | % B1
    \lyricmode { fram -- åt. }            | % B2
    e4 a,4                                | % B2

    \lyricmode { Snart ju mid -- dag }    | % T2
    c'8. c'16 c'8. b16                    | % T2
    \lyricmode { Snart ju mid -- dag }    | % B1
    a8. a16 g8. g16                       | % B1
    \lyricmode { Snart ju mid -- dag }    | % B2
    d8. f16 g8. g,16                      | % B2
}


%lowVoice  = { \stemDown \dynamicDown \slurDown \tieDown }

tenoreI = {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiInstrumentVoice
        \set Staff.instrument     = \markup { Tenore 1 " " }
        \set Staff.instr          = \markup { T " " }
        \set Staff.voltaSpannerDuration = #(ly:make-moment 2 4)

        \clef "treble_8"
        \time 2/4

        \repeat volta 2 {
            R4*2                            | %
            \times 2/3 { e'8\f e' e' } e'4  | % Kälkarna fram!
            R4*2                            | %
            \times 2/3 { g'8 g' g' } g'4    | % Kälkarna fram!
            d'8.     c'16    b8.     c'16   | % Solen högt på
            d'8.   cis'16   d'8.     e'16   | % himlen är och
            f'8.     e'16   f'8.   fis'16   | % manar oss att
            g'8.    f'!16   e'8.[    d'16 ] | % hand i hand    (incl.caut.acc.)
            e'4  \times 2/3 { e'4 e'8 }     | % skynda till
            e'8.     e'16   e'4             | % bergets höjd
            e'4  \times 2/3 { e'4 e'8 }     | % derifrån
            e'8.     e'16   e'8[    es'8  ] | % vi med fröjd   (should be a slur here)
            d'8.->   e'16   d'8.->   e'16   | % åka ned med
            d'8.->   e'16   d'8.->   e'16   | % blixtens fart men
            d'8.-> dis'16   e'8.   fis'16   | % välta ock i-
            g'4              r4             | % bland.
        } % repeat
        \voiceA
        \repeat volta 2 {
            e'4->\f e'4->                         | % Framåt,
            e'4 e'4                               | % framåt
            g'8. f'16 e'8. d'16                   | % skynda medan
            e'8. d'16 c'4                         | % tider är
            e'4 e'4                               | % framåt,
            e'4 e'4                               | % framåt.
            g'8. f'16 e'8. d'16                   | % Snart ju middag
        } \alternative {{
            c'4  r4                           | % är. _
        } {
            c'2 ~ \fermata                    | % är...
            c'8 r8 r4                         | %
        }} % alternative

        \times 2/3 { c'8 c'8 c'8 } \times 2/3 { c'4 c'8 } | %
        R4*2                                  | %
        R4*2                                  | %
        r4 g4                                 | %
        e'2                                   | %
        d'2                                   | %
        c'4 r4                                | %
        \repeat volta 2 {
            e'8. e'16 e'4                         | %
            R4*2                                  | %
            e'8. e'16 e'4                         | %
            R4*2                                  | %
            f'8. f'16 f'4                         | %
            r4 \times 2/3 { e'4 e'8 }             | %
            r4 \times 2/3 { d'4 d'8 }             | %
        } \alternative {{
            c'4 r4                                | %
        } {
            c'4 c'4                               | %
        }} % alternative
        c'4 b4                                | %
        c'4 c'4                               | %
        c'4 b4                                | %
        c'4. e'8                              | %
        e'4. e'8                              | %
        e'4-> r4                              | %
        \bar "|."
    } % Voice
    \addlyrics {
      % 1st repeat
        Käl -- kar -- na fram!
        Käl -- kar -- na fram!
        So -- len högt på
        him -- len är och
        ma -- nar oss att
        hand i hand __
        skyn -- da till
        ber -- gets höjd
        der -- i -- från
        vi med fröjd __
        å -- ka ned med
        blix -- tens fart men
        väl -- ta ock i --
        bland.
      % 2nd repeat
        \lyricA
      % 3rd repeat
        Fram -- åt,
        fram -- åt
        skyn -- da me -- dan
        ti -- der är
        fram -- åt,
        fram -- åt.
        Snart ju mid -- dag
      % 3rd repeat alternate endings
        är.
        är.
      % cont'd
        Sång -- en i te -- ten
        % (paus)
        % (paus)
        Ja
        fram --
        åt
        marsch!
      % 4th repeat
        Gos -- sar blå
        % (paus)
        Svi -- ka må
        % (paus)
        gladt fram -- åt
        på vår
        glat -- ta
      % 4th repeat alternate endings
        stråt.
        stråt. Kom
      % cont'd
        skyn -- da
        kom! kom!
        skyn -- da
        kom. Se
        opp! Se
        opp!
    } % addlyrics
} % tenoreI

tenoreII = {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiInstrumentVoice
        \set Staff.instrument     = \markup { Tenore 2 " " }
        \set Staff.instr          = \markup { T " " }
        \set Staff.voltaSpannerDuration = #(ly:make-moment 2 4)

        \clef "treble_8"
        \time 2/4

        \repeat volta 2 {
            R4*2                            | %
            \times 2/3 { c'8 c' c' } c'4    | % Kälkarna fram!
            R4*2                            | %
            \times 2/3 { e'8 e' e' } e'4    | % Kälkarna fram!
             b8. a16 g8. a16                | % Solen högt på
             b8.   ais16   b8.  c'16        | % himlen är och
            d'8.  cis'16  d'8.  c'16        | % manar oss att
             b8.    d'16  c'8.[  b16 ]      | % hand i hand
            c'4  \times 2/3 { c'4 c'8 }     | % skynda till
            c'8.   c'16   c'4               | % bergets höjd
            c'4  \times 2/3 { c'4 c'8 }     | % derifrån
            c'8.   c'16   c'4               | % vi med fröjd
            c'8.   c'16   c'8. c'16         | % åka ned med
            c'8.   c'16   c'8. c'16         | % blixtens fart men
            c'8.   c'16   c'8. c'16         | % välta ock i-
             b4     r4                      | % bland.
        } % repeat
        \voiceB
        \repeat volta 2 {
            \voiceF
        } \alternative {{
            g4  r4                      | % är.
        } {
            fis2(                       | % är...
            g8 ) r8 r4                  |
        }} % alternative
        R4*2                                  | %
        \times 2/3 { g8 g8 g8 } g4            | %
        R4*2                                  | %
        r4 g4 \ff                             | %
        c'2                                   | %
        b2                                    | %
        g4 r4                                 | %
        \repeat volta 2 {
            c'8. c'16 c'4                         | %
            R4*2                                  | %
            c'8. c'16 c'4                         | %
            R4*2                                  | %
            c'8. c'16 c'4                         | %
            r4 \times 2/3 { c'4 c'8 }             | %
            r4 \times 2/3 { b4 b8 }               | %
        } \alternative {{
            g4 r4                                 | %
        } {
            g4 a4                                 | %
        }} % alternative
        g4 g4                                 | %
        g4 a4                                 | %
        g4 g4                                 | %
        g4. c'8                               | %
        c'4. c'8                              | %
        c'4 \fermata r4                       | %
        \bar "|."
    } % Voice
    \addlyrics {
      % 1st repeat
        % (paus)
        Käl -- kar -- na fram!
        % (paus)
        Käl -- kar -- na fram!
        So -- len högt på
        him -- len är och
        ma -- nar oss att
        hand i hand __
        skyn -- da till
        ber -- gets höjd
        der -- i -- från
        vi med fröjd
        å -- ka ned med
        blix -- tens fart men
        väl -- ta ock i --
        bland.
      % 2nd repeat
        \lyricB
      % 3rd repeat
      \break
        \lyricF
      % 3rd repeat alternate endings
        är.
        är.
      % cont'd
        % (paus)
        An -- fö -- rarn fram
        % (paus)
        Ja
        fram --
        åt
        marsch!
      % 4th repeat
        Gos -- sar blå
        % (paus)
        Svi -- ka må
        % (paus)
        gladt fram -- åt
        på vår
        glat -- ta
      % 4th repeat alternate endings
        stråt.
        stråt. Kom
      % cont'd
        skyn -- da
        kom! kom!
        skyn -- da
        kom. Se
        opp! Se
        opp!
    } % addlyrics
} % tenoreII

basI = {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiInstrumentVoice
        \set Staff.instrument     = \markup { Bas 1 " " }
        \set Staff.instr          = \markup { B " " }
        \set Staff.voltaSpannerDuration = #(ly:make-moment 2 4)

        \clef bass
        \time 2/4

        \repeat volta 2 {
             R4*2                           | %
            \times 2/3 { c'8  c'  c' } c'4  | % Kälkarna fram!
             R4*2                           | %
            \times 2/3 { c'8  c'  c' }  c4  | % Kälkarna fram!
             g4          g4                 | % Solen
             g4          g4                 | % manar
             g4          g4                 | % oss att
             g8.   g16   g4                 | % hand i hand
             R4*2                           | %
            c'8.  c'16  c'4                 | % bergets höjd
             R4*2                           | %
             a8.   a16   a4                 | % vi med fröjd
             a8.   a16   a8.  a16           | % åka ned med
             a8.   a16   a8.  a16           | % blixtens fart men
             a8.   a16   a8.  a16           | % välta ock i-
             g4          r4                 | % bland.
        } % repeat
        \voiceC
        \repeat volta 2 {
            \voiceG
        } \alternative {{
            e4  r4                       | % är.
        } {
            es2(                         | % är...
            e!8 ) r8 r4                  | %
        }} % alternative
        R4*2                                  | %
        R4*2                                  | %
        e8 e8 e4                              | %
        r4 g4 \ff                             | %
        g2                                    | %
        f2                                    | %
        e4 r4                                 | %
        \repeat volta 2 {
            c'8. c'16 c'4                         | %
            R4*2                                  | %
            a8. a16 a4                            | %
            R4*2                                  | %
            a8. a16 a4                            | %
            r4 \times 2/3 { g4 g8 }               | %
            r4 \times 2/3 { g4 g8 }               | %
        } \alternative {{
            e4 r4                                 | %
        } {
            e4 f4                                 | %
        }} % alternative
        e4  f4                                | %
        e4  f4                                | %
        e4  d4                                | %
        e4. g8                                | %
        g4. g8                                | %
        g4-> r4                               | %
        \bar "|."
    } % Voice
    \addlyrics {
      % 1st repeat
        % (paus)
        Käl -- kar -- na fram!
        % (paus)
        Käl -- kar -- na fram!
        So -- len
        ma -- nar
        oss att
        hand i hand
        % (paus)
        ber -- gets höjd
        % (paus)
        vi med fröjd
        å -- ka ned med
        blix -- tens fart men
        väl -- ta ock i --
        bland.
      % 2nd repeat
        \lyricC
      % 3rd repeat
        \lyricG
      % 3rd repeat alternate endings
        är.
        är.
      % cont'd
        % (paus)
        % (paus)
        Gif an ton
        Ja
        fram --
        åt
        marsch!
      % 4th repeat
        Gos -- sar blå
        % (paus)
        Svi -- ka må
        % (paus)
        gladt fram -- åt
        på vår
        glat -- ta
      % 4th repeat alternate endings
        stråt.
        stråt. Kom
      % cont'd
        skyn -- da
        kom! kom!
        skyn -- da
        kom. Se
        opp! Se
        opp!
    } % addlyrics
} % basI

basII = {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiInstrumentVoice
        \set Staff.instrument     = \markup { Bas 2 " " }
        \set Staff.instr          = \markup { B " " }
        \set Staff.voltaSpannerDuration = #(ly:make-moment 2 4)

        \clef bass
        \time 2/4

        \repeat volta 2 {
             c4  \times 2/3 { e4 g8 }       | % Kälkarna
            c'4              r4             | % fram!
             c4  \times 2/3 { e4 g8 }       | % Kälkarna
            c'4              r4             | % fram!
             g4              g4             | % Solen
             g4              g4             | % manar
             g4              g4             | % oss att
             g8.     g16     g4             | % hand i hand
             c4  \times 2/3 { e4 g8 }       | % skynda till
            c'8.    c'16    c'4             | % bergets höjd
            a,4  \times 2/3 { c4 e8 }       | % derifrån
             a8.     a16     a8[       g8 ] | % vi med fröjd
           fis8.->   g16   fis8.->    g16   | % åka ned med
           fis8.->   g16   fis8.->    g16   | % blixtens fart men
           fis8.-> fis16   fis8.      d16   | % välta ock i-
            g,4      r4                     | % bland.
        } % repeat
        \voiceD
        \repeat volta 2 {
            \voiceH
        } \alternative {{
            c4  r4                       | % är.
        } {
            a,2( \fermata                | % är...
            g,8 ) r8 r4                  | %
        }} % alternative
        R4*2                                  | %
        R4*2                                  | %
        R4*2                                  | %
        g4-> g4                               | %
        c2                                    | %
        g,2                                   | %
        c4 \times 2/3 { e4( g8 ) }            | %
        \repeat volta 2 {
            c'8. c'16 c'4                         | %
            a,4 \times 2/3 { c4 e8 }              | %
            a8. a16 a4                            | %
            f,4 \times 2/3 { a,4 c8 }             | %
            f8. f16 f4                            | %
            \times 2/3 { g,4 c8  } \times 2/3 { e4 g8 } | %
            \times 2/3 { g,4 b,8 } \times 2/3 { d4 g8 } | %
        } \alternative {{
            c4 \times 2/3 { e4 g8 }               | %
        } {
            c4 c4                                 | %
        }} % alternative
        c4 d4                                 | %
        c4 c4                                 | %
        c4 g,4                                | %
        c4. c8                                | %
        c4. c8                                | %
        c4 \fermata r4                        | %
        \bar "|."
    } % Voice
    \addlyrics {
      % 1st repeat
        Käl -- kar -- na
        fram!
        Käl -- kar -- na
        fram!
        So -- len
        ma -- nar
        oss att
        hand i hand
        skyn -- da till
        ber -- gets höjd
        der -- i -- från
        vi med fröjd __
        å -- ka ned med
        blix -- tens fart men
        väl -- ta ock i --
        bland.
      % 2nd repeat
        \lyricD
      % 3rd repeat
        \lyricH
      % 3rd repeat alternate endings
        är.
        är.
      % cont'd
        % (paus)
        % (paus)
        % (paus)
        La, ja
        fram --
        åt
        föl -- jen. __
      % 4th repeat
        Gos -- sar blå
        in -- gen här
        svi -- ka må
        fram -- åt, fram --
        åt, fram -- åt,
        på vår glat -- ta,
        sol -- be -- glän -- sta
      % 4th repeat alternate endings
        stråt, föl -- jen.
        stråt. Kom
      % cont'd
        skyn -- da
        kom! kom!
        skyn -- da
        kom. Se
        opp! Se
        opp!
    } % addlyrics
} % basII


choir = {
    \new ChoirStaff <<
        %\new Staff <<
            \tenoreI
            \tenoreII
        %>>
        %\new Staff <<
            \basI
            \basII
        %>>
    >>
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Score                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\book {
    \score {                 \choir              } % sheet music
    \score { \unfoldRepeats  \choir     \midi {} } % all
    \score { \unfoldRepeats  \tenoreI   \midi {} } % S
    \score { \unfoldRepeats  \tenoreII  \midi {} } % A
    \score { \unfoldRepeats  \basI      \midi {} } % T
    \score { \unfoldRepeats  \basII     \midi {} } % B
}

%[[eof]]
