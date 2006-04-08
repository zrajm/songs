\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 7"
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
    O kär -- leks makt, o kär -- lek o -- fatt -- ba -- ra,
    så stark att du
    ditt blod ej vil -- le spa -- ra!
    Att jag för -- spillt mitt liv
    i lust och vil -- la,
    fick du um -- gäl -- la.
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    O grosse Lieb', o Lieb' ohn' alle Masse
    die dich gebracht
    auf diese Marterstrasse!
    Ich lebte mit der Welt
    in Lust und Freuden,
    und du musst leiden!
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
        \key g\minor
        \time 4/4

        \partial 4 g'4  |
        g'4 g' fis'\fermata d'  |
        g'4 a' bes' bes'  |
        c''4( bes' ) a'\fermata a'  |
      \break
        bes'4 c'' d''8[ c'' ] bes'4  |
        %% 5
        ees''4 ees'' d'' des''8[ c'' ]  |
        c''2 bes'4\fermata bes'  |
        a'4 g' f' d'8[ ees' ]  |
      \break
        f'4 f' g' f'  |
        ees'2 d'4\fermata d''  |
        %% 10
        c''4 bes'8[ a' ] a'2  |
        g'2.\fermata
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
        \key g\minor
        \time 4/4

        \partial 4 d'4  |
        ees'8[ d' ] c'4 d'\fermata a  |
        d'8[ e' ] fis'4 g' g'  |
        a'4( g' ) fis'\fermata fis'  |
        g'4 a' bes' f'  |
        %% 5
        g'8[ a' ] bes'4 bes' bes'  |
        \stemUp bes'4( a' ) \stemNeutral f'\fermata g'8[ f' ]  |
        ees'8[ d' ] e'4 d' a  |
        d'8[ ees' ] f'4 f'8[ ees' ] ees'[ d' ]  |
        d'8([ c'16 bes ] c'4 ) bes\fermata bes'  |
        %% 10
        a'4 g' g'( fis' )  |
        d'2.\fermata
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
        \key g\minor
        \time 4/4

        \partial 4 bes4  |
        bes4 a8[ g ] a4\fermata fis  |
        g4 c' d' d'  |
        ees'4( d' ) d'\fermata d'  |
        d'4 ees' f'8[ ees' ] d'[ c' ]  |
        %% 5
        bes4 bes8[ c' ] d'[ bes ] g'4  |
        f'4.( ees'8 ) d'4\fermata d'  |
        c'4 bes a f  |
        bes4 bes bes a  |
        \stemUp bes4( f ) \stemNeutral f\fermata f'  |
        %% 10
        ees'4 d' e'( d'8[ c' ])  |
        b2.\fermata
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
        \key g\minor
        \time 4/4

        \partial 4 g4  |
        c8[ d ] ees4 d\fermata c  |
        bes,4 a, g, g  |
        fis4( g ) d\fermata d  |
        g4 c' bes aes  |
        %% 5
        g4 ges f e  |
        f2 bes,4\fermata g,  |
        c4 cis d d8[ c ]  |
        bes,8[ c ] d[ bes, ] ees4 f  |
        g8([ g, ] a,4 ) bes,\fermata bes,  |
        %% 10
        fis4 g \stemUp cis( d ) \stemNeutral  |
        g,2.\fermata
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
    \key g\minor
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
    \key g\minor
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
