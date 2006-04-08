\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 20"
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
    Pet -- rus, om sin Her -- re spord,
    ne -- kar, ne -- kar å -- ter,
    minns för sent hans var -- nings -- ord,
    van -- drar bort och grå -- ter.
    Je -- su kä -- re, ma -- na mig
    med ditt ord så trä -- gen.
    Är jag stadd på far -- lig stig,
    led mig rät -- ta vä -- gen.
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Petrus, der nicht denkt zurück,
    seinen Gott verneinet,
    der doch auf ein'n ernsten Blick
    bitterlichen weinet
    Jesu, blicke mich auch an,
    wenn ich nicht will büssen;
    wenn ich Böses hab' getan,
    rühre mein Gewissen.
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

        a'4 g' f' g'  |
        a'4 bes' c''2\fermata  |
        d''4 c'' bes' a'8[ g' ]  |
        g'2 f'\fermata  |
        %% 5
        a'4 c'' bes' a'  |
      \break
        g'4 f' e'2\fermata  |
        f'4 g' a' a'8[ bes'16 c'' ]  |
        bes'2 a'\fermata  |
        a'8[ g' ] a'[ bes' ] c''4 bes'  |
        %% 10
        a'4 g' a'2\fermata  |
      \break
        g'4 g' a'8[ b' ] c''4  |
        c''4( b' ) c''2\fermata  |
        c''4 a' d''4. c''8  |
        bes'4 a'8[ g' ] g'2\fermata  |
        %% 15
        a'4 a'8[ bes'16 c'' ] bes'4 a'8[ g' ]  |
        g'2 f'\fermata  |
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
        \key f\major
        \time 4/4

        f'4 e' d' c'  |
        c'4 d' ees'2\fermata  |
        d'4 e' f'8[ g' ] c'[ f' ]  |
        f'4( e' ) c'2\fermata  |
        %% 5
        f'4 g' f' f'  |
        e'4 d' cis'2\fermata  |
        d'4 c' c' d'  |
        d'8[ f' e' d' ] e'2\fermata  |
        d'4 d' a8[ e' ] f'[ g' ]  |
        %% 10
        f'4 e' f'2\fermata  |
        d'4 c' f' g'  |
        a'4( g'8[ f' ]) e'2\fermata  |
        e'4 f' f' ees'  |
        ees'8[ d' ] c'4 bes2\fermata  |
        %% 15
        d'4 c'8[ d' ] e'4 f'  |
        f'8([ d' ]e'4 ) c'2\fermata  |
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
        \key f\major
        \time 4/4

        d'4 a a g  |
        f4 f f2\fermata  |
        bes4 a a8[ g ] a[ bes ]  |
        \stemUp c'4( bes8[ a ]) \stemNeutral a2\fermata  |
        %% 5
        c'4 c' d' c'  |
        bes4 a a2\fermata  |
        a4 g f8[ g ] a4  |
        a4( g8[ f ]) g2\fermata  |
        f4 f' e' d'  |
        %% 10
        c'4 c' c'2\fermata  |
        b4 c' c'8[ d' ] ees'4  |
        \stemUp d'4( g ) g2\fermata \stemNeutral  |
        a4 a aes g8[ fis ]  |
        g4 fis g2\fermata  |
        %% 15
        f4 f g c  |
        \stemUp c'4( bes16[ a bes8 ]) \stemNeutral a2\fermata  |
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
        \key f\major
        \time 4/4

        d4 cis d e  |
        f4 d a,2\fermata  |
        bes,4 c d8[ e ] f4  |
        c2 f,\fermata  |
        %% 5
        f4 e d8[ e ] f4  |
        cis4 d a,2\fermata  |
        d4 e f fis  |
        g2 cis\fermata  |
        d8[ e ] f[ g ] a4 d8[ e ]  |
        %% 10
        f4 c f,2\fermata  |
        f4 e ees d8[ c ]  |
        fis4( g ) c2\fermata  |
        a,4 d bes, ees  |
        c4 d g,2\fermata  |
        %% 15
        d8[ c ] bes,[ a, ] g,4 a,8[ bes, ]  |
        c2 f,\fermata  |
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
