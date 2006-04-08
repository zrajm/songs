\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 40"
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
    När du av bo -- jor tyng -- es ner,
    bli vå -- ra bo -- jor lös -- ta.
}
lyricSvTwo = \lyricmode {
    Ditt fäng -- el -- se en fri -- stad ger
    åt dem på dig för -- trös -- ta.

    Ty ha -- de du ej ve -- tat råd,
    vi lev -- de al -- la ut -- an nåd.
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Durch dein Gefängnis, Gottes Sohn,
    ist uns die Freiheit kommen,
}
lyricDeTwo = \lyricmode {
    dein Kerker ist der Gnadenthron,
    die Freistatt aller Frommen,

    denn gingst du nicht die Knechtschaft' ein,
    müsst' unsre Knechtschaft ewig sein.
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
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 f'8[ g' ]  |
            a'4 bes' c'' c''  |
            bes'4 a' g'\fermata c''  |
            d''4 e'' f'' e''8[ d'' ]  |
            d''2 c''4
        }
      \break
        \partial 4 c''4  |
        %% 5
        f''4 e''8[ d'' ] d''4 c''  |
        bes'4 a'8[ g' ] g'4\fermata c''  |
        bes'4 a' g'8[ a' ] bes'4  |
        a'4 g' f'\fermata
        \bar "|."
    } % Voice
    \addlyrics { \lyricSvOne }
    \addlyrics { \lyricSvTwo }
} % soprano


alto = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelAlto
        \set Staff.instr          = \shortAlto

        \clef treble
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 c'  |
            f'4 f' f' f'  |
            f'8[ e' ] f'4 e'\fermata g'  |
            g'4 b' c''8[ g' ] g'[ a' ]  |
            \stemUp a'4( b' ) g' \stemNeutral
        }
        \partial 4 a'4
        %% 5
        d''4 c'' c''8[ bes' ] bes'[ a' ]  |
        a'8[ g' ] f'4 e'\fermata ees'  |
        des'4 c' bes8[ c' ] des'4  |
        c'8[ f' ] f'[ e' ] c'4\fermata
        \bar "|."
    } % Voice
    \addlyrics { \lyricSvOne }
    \addlyrics { \lyricSvTwo }
} % alto


tenor = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelTenor
        \set Staff.instr          = \shortTenor

        \clef "treble_8"
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 a8[ bes ]  |
            c'4 d' ees' d'8[ c' ]  |
            d'4 c' c'\fermata e'  |
            d'4 g' c'8[ d' ] e'[ f' ]  |
            f'8([ e' ] d'4 ) e'
        }
        \partial 4 f'4  |
        %% 5
        a'4 a' a'8[ g' ] g'[ e' ]  |
        f'8[ c' ] c'4 c'\fermata a8[ g ]  |
        f4 fis g g  |
        a8.[ bes16 ] c'8[ g ] a4\fermata
        \bar "|."
    } % Voice
    \addlyrics { \lyricSvOne }
    \addlyrics { \lyricSvTwo }
} % tenor


bass = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelBass
        \set Staff.instr          = \shortBass

        \clef bass
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 f  |
            f4 d a, d  |
            g4 a8[ bes ] c'4\fermata c'  |
            b4 a8[ g ] a[ b ] c'4  |
            f4( g ) c
        }
        \partial 4 f8[ e ]  |
        %% 5
        d4 a, bes, c  |
        d8[ e ] f4 c\fermata c  |
        des4 d ees e  |
        f4 c f\fermata
        \bar "|."
    } % Voice
    \addlyrics { \lyricSvOne }
    \addlyrics { \lyricSvTwo }
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
    \key f\major
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
    \key f\major
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
