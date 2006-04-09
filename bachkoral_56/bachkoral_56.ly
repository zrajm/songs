\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 56"
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
    Än i sis -- ta stun -- dens nöd
    han på al -- la tänk -- te
    och Jo -- han -- nes som ett stöd
    åt sin mo -- der skänk -- te.
    Män -- ska, tag din tid i akt:
    styrk och hjälp din näs -- ta!
    “Se din bro -- der”, har han sagt
    och skall själv dig gäs -- ta.
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Er nahm alles wohl in acht
    in der letzten Stunde,
    seine Mutter noch bedacht
    setzt ihr ein'n Vormunde.
    O Mensch, mache Richtigkeit,
    Gott und Menschen liebe,
    stirb darauf ohn' alles Leid,
    und dich nicht betrübe.
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
        a'4 b' c''2\fermata  |
        d''4 c'' bes' a'8[ g' ]  |
        g'2 f'\fermata  |
        %% 5
        a'4 c'' bes' a'  |
      \break
        g'4 f' e'2\fermata  |
        f'4 g' a' a'8[ bes'16 c'' ]  |
        bes'2 a'\fermata  |
        a'4 bes' c'' bes'  |
        %% 10
        a'4 g' a'2\fermata  |
      \break
        g'4 g' a'8[ b' ] c''4  |
        c''4( b' ) c''2\fermata  |
        c''4 a' d''4. c''8  |
        bes'4 a'8[ g' ] g'2\fermata  |
        %% 15
        a'4 c'' bes' a'8[ g' ]  |
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

        f'4 e' f' e'  |
        f'8[ e' ] d'4 e'2\fermata  |
        g'4 g' e' f'  |
        f'4( e' ) c'2\fermata  |
        %% 5
        f'4 g' f' e'  |
        d'4 d' cis'2\fermata  |
        a4 c' c' c'  |
        f'4( g' ) f'2\fermata  |
        f'4 f' f' f'  |
        %% 10
        f'4 e' f'2\fermata  |
        e'4 c' f' e'  |
        d'2 e'\fermata  |
        ees'4 ees' d'8[ e' ] f'4  |
        f'8[ e' ] f'4 e'2\fermata  |
        %% 15
        f'4 g' f' f'  |
        f'4( e' ) c'2\fermata  |
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

        c'4 c' c' c'  |
        c'4 g g2\fermata  |
        bes4 g c' c'  |
        d'4( c'8[ bes ]) a2\fermata  |
        %% 5
        c'4 c' d' a  |
        bes4 bes e2\fermata  |
        d4 e f g  |
        d'4( c' ) c'2\fermata  |
        c'4 bes a g  |
        %% 10
        a8[ bes ] c'4 c'2\fermata  |
        c'4 g f g  |
        a4( g ) g2\fermata  |
        ges4 f f8[ g ] a4  |
        bes4 c' c'2\fermata  |
        %% 15
        c'4 c' d' d'  |
        d'4( c'8[ bes ]) a2\fermata  |
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

        f4 c a, c  |
        f,4 g, c2\fermata  |
        g4 e c f  |
        bes,4( c ) f,2\fermata  |
        %% 5
        f4 e d c  |
        bes,4 a,8[ g, ] a,2\fermata  |
        d4 c f e  |
        d4( e ) f2\fermata  |
        f4 d a, bes,  |
        %% 10
        c4 c f,2\fermata  |
        c8[ d ] e4 d c  |
        f4( g ) c2\fermata  |
        ees4 f bes, a,  |
        g,4 f, c2\fermata  |
        %% 15
        f4 e d c  |
        b,4( c ) f,2\fermata  |
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
