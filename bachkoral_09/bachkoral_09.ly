\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 9"
    subtitle = ""
    composer = "J.S. Bach (1685-1750)"
    copyright = "Zrajm C Akfohg, mars–april 2006"
    tagline = ""
}
midiChoirInstrument = #"drawbar organ"
midiPianoInstrument = #"acoustic grand"
labelSoprano        = \markup Sopran
shortSoprano        = \markup S
labelAlto           = \markup Alt
shortAlto           = \markup A
labelTenor          = \markup Tenor
shortTenor          = \markup T
labelBass           = \markup Bas
shortBass           = \markup B

#(set-global-staff-size 18)
\paper {
    #(set-paper-size "a4")  %'landscape)
    raggedbottom    = ##t
    printpagenumber = ##f  % turn on/off page number printing
}
\layout {
    papersize = "a4"
    \context {
        \Staff \consists Ambitus_engraver
    }
}
\midi {
    \tempo 4 = 70
}



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

labelSoprano = \markup \instrFix \labelSoprano
shortSoprano = \markup \instrFix \shortSoprano
labelAlto    = \markup \instrFix \labelAlto
shortAlto    = \markup \instrFix \shortAlto
labelTenor   = \markup \instrFix \labelTenor
shortTenor   = \markup \instrFix \shortTenor
labelBass    = \markup \instrFix \labelBass
shortBass    = \markup \instrFix \shortBass



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Swedish lyrics
lyricSvOne = \lyricmode {
    Din vil -- ja ske i allt som är,
    i him -- len som på jor -- den här.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% I Sveriges Radios version är nästa rad (3) ersatt av: %%
    %% "Lär oss din fa -- ders -- hand att se"               %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Om stil -- la lyd -- nad lär oss be
    i lust och sorg, i väl och ve.
    Styr vå -- ra steg och tan -- kar så,
    att vi på di -- na vä -- gar gå.
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Dein Will' gescheh' Herr Gott, zugleich
    auf Erden wie im Himmelreich
    gib uns Geduld in Leidenszeit,
    Gehorsamsein in Lieb' und Leid,
    wehr, und steur' allem Fleisch und Blut,
    das wider deinen Willen tut.
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Choir Notes                                                              %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


soprano = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelSoprano
        \set Staff.instr          = \shortSoprano

        \clef treble
        \key d\minor
        \time 4/4

        \partial 4 a'4  |
        a'8[ g' ] f'4 g' a'8[ g' ]  |
        f'4 e' d'\fermata a'  |
        a'4 g' c'' a'8[ g' ]  |
        f'4 g' a'\fermata a'8[ b' ]  |
      \break
        %% 5
        c''4 d''8[ e'' ] f''4 e''  |
        d''4 cis'' d''\fermata d''  |
        e''4 d'' c'' b'  |
        a'4 gis' a'\fermata d''  |
      \break
        c''4 b' c''8[ bes' ] a'4  |
        %% 10
        a'4 g' f'\fermata a'  |
        bes'4 a'8[ g' ] f'4 g'  |
        f'4 e' d'\fermata
        \bar "|."
    } % Voice
    \addlyrics { \lyricSvOne }
} % soprano


alto = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelAlto
        \set Staff.instr          = \shortAlto

        \clef treble
        \key d\minor
        \time 4/4

        \partial 4 f'4  |
        e'4 e'8[ d' ] cis'[ d'16 e' ] a4  |
        bes8( d'4 ) cis'8 a4\fermata f'  |
        e'4 d' e' f'8[ e' ]  |
        d'8[ f' ] e'[ d' ] e'4\fermata e'  |
        %% 5
        a'4 g' f'8[ a' ] g'[ e' ]  |
        f'8[ e' ] e'4 fis'\fermata g'8[ f' ]  |
        e'4 b' e' f'8[ e' ]  |
        e'8[ d' ] e'4 e'\fermata g'  |
        g'8[ f'16 e' ] f'4 e' f'  |
        %% 10
        f'4. e'8 c'4\fermata d'  |
        d'4 e' e'8[ a ] d'4  |
        d'4. cis'8 a4\fermata
        \bar "|."
    } % Voice
    \addlyrics { \lyricSvOne }
} % alto


tenor = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelTenor
        \set Staff.instr          = \shortTenor

        \clef "treble_8"
        \key d\minor
        \time 4/4

        \partial 4 d'4  |
        a4 a g d'  |
        d'4 a8[ g ] f4\fermata d'  |
        a4 bes c'4. cis'8  |
        d'8[ cis' ] d'4 cis'\fermata c'  |
        %% 5
        c'8[ a ] b[ cis' ] d'[ c' ] bes4  |
        b4 a a\fermata b  |
        b8[ a ] a[ gis ] a4. gis8  |
        a4 b c'\fermata b  |
        \stemUp c'8[ a ] \stemNeutral g[ f ] g4 d'  |
        %% 10
        d'4 g8[ c' ] a4\fermata a  |
        g8[ f ] e4 a bes  |
        b4 e8[ a ] fis4\fermata
        \bar "|."
    } % Voice
    \addlyrics { \lyricSvOne }
} % tenor


bass = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelBass
        \set Staff.instr          = \shortBass

        \clef bass
        \key d\minor
        \time 4/4

        \partial 4 d4  |
        cis4 d e f  |
        g4 a d\fermata d  |
        c4 bes, a,8[ c ] f4  |
        bes8[ a ] bes4 a\fermata a8[ g ]  |
        %% 5
        f4. e8 d4 g  |
        gis4 a d\fermata g  |
        c4 b, a, d8[ e ]  |
        f4 e a,\fermata g8[ f ]  |
        e4 d c d8[ c ]  |
        %% 10
        bes,4 c f\fermata fis  |
        g4 cis d8[ c ] bes,[ a, ]  |
        gis,4 a, d\fermata
        \bar "|."
    } % Voice
    \addlyrics { \lyricSvOne }
} % bass


choir = {
    \new ChoirStaff <<
        \soprano
        \alto
        \tenor
        \bass
    >>
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Piano Notes                                                              %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% FIXME: piano parts
pianoTreble = \new Staff {
    \set Staff.autoBeaming    = ##f
    \set Staff.midiInstrument = \midiPianoInstrument

    \clef treble
    \key d\minor
    \time 4/4

    <<
        \new Voice {
        } % Voice
    >>
} % pianoTreble


pianoBass = \new Staff {
    \set Staff.autoBeaming    = ##f
    \set Staff.midiInstrument = \midiPianoInstrument

    \clef bass
    \key d\minor
    \time 4/4

    <<
        \new Voice {
        } % Voice
    >>
} % pianoBass


piano = {
    \new PianoStaff <<
       \pianoTreble
       \pianoBass
    >>
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Score                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\book {
    \score {                             << \choir %{ \piano %} >>    } % notes
    \score { \applymusic #unfold-repeats << \choir %{ \piano %} >> \midi {} } % SATB
    \score { \applymusic #unfold-repeats    \soprano         \midi {} } % S
    \score { \applymusic #unfold-repeats    \alto            \midi {} } % A
    \score { \applymusic #unfold-repeats    \tenor           \midi {} } % T
    \score { \applymusic #unfold-repeats    \bass            \midi {} } % B
    \score { \applymusic #unfold-repeats    \piano           \midi {} } % piano
}

%[[eof]]
