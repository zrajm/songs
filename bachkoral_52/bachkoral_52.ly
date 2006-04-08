\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 52"
    subtitle = ""
    composer = "J.S. Bach (1685-1750)"
%    copyright = "Zrajm C Akfohg, april 2006"
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
    aftertitlespace = 1\cm
    topmargin       = 2.5\mm
    beforetitlespace = 3\cm
    betweensystempadding = 0\mm
%    betweensystemspace = 5\cm
    headsep         = 0\cm
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
    Djupt in -- ne i mitt hjär -- ta
    bär jag en he -- lig bild:
}
lyricSvTwo = \lyricmode {
    ett hu -- vud böjt i smär -- ta,
    ditt hu -- vud, Je -- su mild!

    Låt klart den bil -- den ly -- sa,
    då mör -- ker täckt min stig,
    och än en gång be -- vi -- sa,
    att du har dött för mig.
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    In meines Herzens Grunde,
    dein Nam' und Kreuz allein
}
lyricDeTwo = \lyricmode {
    funkelt all Zeit und Stunde,
    drauf kann ich fröhlich sein.

    Erschein' mir in dem Bilde
    zu Trost in meiner Not,
    wie du, Herr Christ, so milde,
    dich hast geblut't zu Tod.
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
        \key c\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 c'4  |
            g'4 g' a' b'  |
            c''2 c''4\fermata e''  |
            d''4 c'' c'' b'  |
            c''2.
        }
      \break
        \partial 4 c''8[ d'' ]  |
        %% 5
        e''4 e'' d'' c''  |
        \stemUp b'8([ a' ] b'4 ) g'\fermata b' \stemNeutral  |
        c''4 b' a' a'  |
        g'2.\fermata g'4  |
      \break
        e'8[ f' ] g'4 a' g'  |
        %% 10
        g'4( f' ) e'\fermata g'  |
        f'4 e' d' d'  |
        c'2.\fermata
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
        \key c\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 g4  |
            c'4 e' f' e'  |
            e'2 e'4\fermata a'  |
            a'4 f' e' d'  |
            e'2.
        }
        \partial 4 e'8[ f' ]  |
        %% 5
        g'4 a' a' fis'  |
        g'8([ fis' ] g'4 ) d'\fermata g'  |
        g'4 g' g' fis'  |
        d'2.\fermata d'4  |
        c'8[ d' ] e'4 f' e'  |
        %% 10
        e'4( d' ) c'\fermata c'  |
        c'4 c' c' b  |
        g2.\fermata
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
        \key c\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 e4  |
            g4 c' c' b  |
            a2 a4\fermata c'  |
            a4 a g g  |
            g2.
        }
        \partial 4 g4  |
        %% 5
        c'4 c' d' d'  |
        d'8([ c' ] d'4 ) b\fermata d'  |
        c'4 d' e' d'8[ c' ]  |
        b2.\fermata g4  |
        g4 c' c' bes  |
        %% 10
        a2 a4\fermata e  |
        f4 g a g8[ f ]  |
        e2.\fermata
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
        \key c\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 c4  |
            e4 c f gis,  |
            a,2 a,4\fermata a  |
            f4 d g g,  |
            c2.
        }
        \partial 4 c4  |
        %% 5
        c'8[ b ] a[ g ] fis4 d  |
        g2 g,4\fermata f  |
        e4 d c d  |
        g,2.\fermata b,4  |
        c4 bes, a,8[ b, ] cis4  |
        %% 10
        d2 a,4\fermata bes,  |
        a,4 g, fis, g,  |
        c2.\fermata
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
    \key c\major
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
    \key c\major
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
