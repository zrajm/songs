\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 65"
    subtitle = ""
    composer = "J.S. Bach (1685-1750)"
    copyright = "Zrajm C Akfohg, april 2006"
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
    Hjälp, o Kris -- te, att jag städs
    upp till dig må blic -- ka,
    att jag ej för värl -- den räds
    mig som kris -- ten skic -- ka;
    le -- va så, att and -- ra se
    och för -- stå din lä -- ra
    och ge dig, min Fräl -- sa -- re,
    dig al -- le -- na ä -- ra.
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    O hilf, Christe, Gottes Sohn,
    durch dein bitt'res Leiden,
    dass wir, dir stets undertan,
    all' Untugend meiden;
    deinen Tod und sein Ursach'
    furchtbarlich bedenken,
    dafür, wiewohl arm und schwach,
    dir Dankopfer schenken.
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
        \key es\major
        \time 4/4

        f''4 f'' f'' f''  |
        es''4 des'' c''2\fermata  |
        des''4 es'' f'' f''  |
        es''4( des'' ) c''2\fermata  |
        %% 5
        bes'4 c'' des'' bes'  |
        bes'8[ aes' ] ges'4 f'2\fermata  |
      \break
        ges'4 aes' bes' bes'  |
        aes'4( ges' ) f'2\fermata  |
        bes'4 a' bes' c''  |
        %% 10
        des''4 c''8[ bes' ] bes'2\fermata  |
        des''4 es'' f'' f''  |
        es''4( des''8[ c'' ]) c''2\fermata  |
      \break
        bes'4 c'' des''8[ c'' ] bes'4  |
        bes'8[ aes' ] ges'4 f'2\fermata  |
        %% 15
        ges'4 aes' bes' bes'  |
        aes'4( ges' ) f'2 ~  |
        f'1  |
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
        \key es\major
        \time 4/4

        a'4 a' bes' c''  |
        bes'4 bes' a'2\fermata  |
        f'4 ges' aes' aes'  |
        ges'4( f' ) f'2\fermata  |
        %% 5
        f'4 f' f' ges'  |
        f'4 es' d'2\fermata  |
        es'4 es' fes' fes'  |
        es'2 d'\fermata  |
        f'4 es' f' ges'  |
        %% 10
        f'4 f' ges'2\fermata  |
        aes'4 aes' aes' bes'  |
        bes'2 a'\fermata  |
        f'4 f' f' ges'  |
        f'4 es' d'2\fermata  |
        %% 15
        es'4 f' ges' ges'  |
        f'4( es'2 des'4 )  |
        c'1  |
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
        \key es\major
        \time 4/4

        c'4 c' des' c'8[ des' ]  |
        es'8[ f' ] ges'4 c'2\fermata  |
        bes4 bes ces' bes  |
        bes2 a\fermata  |
        %% 5
        des'4 c' bes8[ c' ] des'[ es' ]  |
        f'8[ bes ] bes4 bes2\fermata  |
        bes4 ces' des' des'  |
        ces'8([ des' ] es'4 ) bes2\fermata  |
        des'4 c' bes bes  |
        %% 10
        bes8[ aes ] des'4 des'2\fermata  |
        f'4 c' des' des'  |
        es'8([ f' ] ges'4 ) f'2\fermata  |
        bes4 a bes8[ c' ] des'[ es' ]  |
        f'8[ bes ] bes4 bes2\fermata  |
        %% 15
        bes4 des' des' des'  |
        \stemDown des'8([ ces' ] bes4 a bes ) \stemNeutral  |
        a1  |
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
        \key es\major
        \time 4/4

        f4 f bes aes  |
        ges4 f8[ es ] f2\fermata  |
        bes4 ges d d  |
        \stemUp es4( bes, ) \stemNeutral f2\fermata  |
        %% 5
        bes4 a bes ges  |
        d4 es bes,2\fermata  |
        es4 ces g, g,  |
        aes,4( a, ) bes,2\fermata  |
        bes,4 c des es  |
        %% 10
        f4 des ges2\fermata  |
        f4 aes des'8[ c' ] bes[ aes ]  |
        ges4( f8[ es ]) f2\fermata  |
        des4 f bes8[ aes ] ges4  |
        d4 es bes,2\fermata  |
        %% 15
        es4 des ges,8[ aes, ] bes,[ ces ]  |
        des4( es ) f2 ~  |
        f1  |
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
    \key es\major
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
    \key es\major
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
