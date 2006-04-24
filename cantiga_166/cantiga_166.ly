\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    title = "Cantiga 166"
    composer = "Alfonso X, el Sabio, 1200-1277"
    tagline = \markup \column { \center-align {
        \line { Zrajm C Akfohg, April 2006 }
        \line { http://zrajm.klingonska.org/songs/ }
    }}
}
midiChoirInstrument = #"cello"
midiPianoInstrument = #"acoustic guitar (nylon)"
labelSoprano        = \markup ""
shortSoprano        = \markup ""
labelAlto           = \markup ""
shortAlto           = \markup ""

#(set-global-staff-size 16)
\paper {
    #(set-paper-size "a4")  %'landscape)
    raggedbottom = ##t
    printpagenumber = ##f  % turn on/off page number printing
}
\layout {
    papersize = "a4"
    \context {
        \Staff \consists Ambitus_engraver
    }
}
\midi {
    \tempo 4 = 140
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Swedish lyrics
lyricRefrain = \lyricmode {
    Co -- mo po -- den per sas cul -- pas
    os om -- es se -- er con -- trei -- tas
    as -- si po -- den pe -- la vir -- gen
    de -- pois se -- er sã -- os fei -- tos.


  \set stanza = "1."
    Ond' a -- vẽ -- o a un o -- me,
    por pe -- ca -- das que fe -- ze -- ra,
    que foi tol -- lei -- to dos nen -- bros
    dũ -- a do -- or que ou -- ve -- ra,
    e du -- rou as -- si cinc' a -- nos
    que mo -- ver -- se non po -- de -- ra,
    as -- si a -- vi -- a os nen -- bros
    to -- dos do cor -- po mal -- trei -- tos.

}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
        \time 3/2
        \slurDashed

    %\transpose c c, {
        \partial 4*2 f'4 f'  |
        f'4( e' ) d' f'2 g'4  |
        a'2 a' a'4 a'  |
        c''4( b' ) c'' d''2 c''8[ b' ]  |
        a'2 a' a'4 g'  |
      \break
        %% 5
        f'4( e' ) d' f'2 g'4  |
        a'2 a' a'4 g'  |
        f'4( e' ) d' e'( d' ) c'  |
        d'2 d'\mark \markup{ \large \bold Fine }
      \bar "|."
      \break
        c''4 c''  |
        c''4( b' ) g' a'2 b'4  |
        %% 10
        c''2 c'' c''4 d''  |
        c''4( b' ) g' a'2 b'4  |
        g'2 g' c''4 c''  |
      \break
        c''4( b' ) g' a'2 b'4  |
        c''2 c'' c''4 d''  |
        %% 15
        c''4( b' ) g' a'2 b'4  |
        g'2 g' a'4 g'  |
      \break
        f'4( e' ) d' f'2 g'4  |
        a'2 a' a'4 a'  |
        c''4( b' ) c'' d''2 c''8[ b' ]  |
        %% 20
        a'2 a' a'4 g'  |
      \break
        f'4( e' ) d' f'2 g'4  |
        a'2 a' a'4 g'  |
        f'4( e' ) d' e'( d' ) c'  |
        d'2 d'
        \bar "|."
    %} % transpose
    } % Voice
    \addlyrics { \lyricRefrain }
} % soprano


alto = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiPianoInstrument
        \set Staff.instrument     = \labelAlto
        \set Staff.instr          = \shortAlto

        \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
        \override Score.RehearsalMark #'self-alignment-X = #right


        \clef treble
        \time 3/2

    %\transpose c c, {
        \partial 4*2 d''4 a'  |
        d'4 a' d'' d' a' d''  |
        d'4 a' d'' a' d'' a'  |
        d'4 a' d'' d' a' d''  |
        d'4 a' d'' a' d'' a'  |
      \break
        %% 5
        d'4 a' d'' d' a' d''  |
        d'4 a' d'' a' d'' a'  |
        d'4 a' d'' c' g' c''  |
        d'4 a' d'' a'\mark \markup{ \large \bold Fine }
      \bar "|."
      \break
        d'' a'  |
        f'4 c'' f'' f' c'' f''  |
        %% 10
        f'4 c'' f'' c'' f'' c''  |
        f'4 c'' f'' f' c'' f''  |
        g'4 d'' g'' d'' g'' d''  |
        f'4 c'' f'' f' c'' f''  |
        f'4 c'' f'' c'' f'' c''  |
        %% 15
        f'4 c'' f'' f' c'' f''  |
        g'4 d'' g'' d'' < f'' c'' f' > < e'' b' e' >  |
        d'4 a' d'' d' a' d''  |
        e'4 a' d'' a' d'' a'  |
        d'4 a' d'' d' a' d''  |
        %% 20
        d'4 a' d'' a' d'' a'  |
        d'4 a' d'' d' a' d''  |
        d'4 a' d'' a' d'' a'  |
        d'4 a' d'' c' g' c''  |
        d'4 a' d'' a'
        \bar "|."
    %} % transpose
    } % Voice
} % alto


choir = {
    \new ChoirStaff <<
        \soprano
        \alto
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
    \score { \applymusic #unfold-repeats    \piano           \midi {} } % piano
}

%[[eof]]
