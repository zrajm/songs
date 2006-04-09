\version "2.6.0"



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 21"
    subtitle = ""
    composer = "J.S. Bach (1685-1750)"
    copyright = "Zrajm C Akfohg, mars 2006"
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
    \tempo 4 = 65
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



% TODO: Can't get midi volumes to work (there's no effect at all).
% /zrajm [2006-03-30]
%
% [http://article.gmane.org/gmane.comp.gnu.lilypond.general/5890]
%\set Staff.midiMinimumVolume = #0.2
%\set Staff.midiMaximumVolume = #0.8



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Swedish lyrics
lyricSvOne = \lyricmode {
    Guds Son, sänd att hjäl -- pa oss,
    blev i mid -- natts -- stun -- den
    som en rö -- va -- re, med bloss
    spå -- rad upp och bun -- den.
    Ej med min -- sta brott be -- trädd,
    dömd att mis -- ta li -- vet;
    lik ett lamm till slakt bort -- ledd,
    så -- som det står skri -- vet.
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Christus, der uns selig macht,
    kein Bös's hat begangen,
    der ward für uns in der Nacht
    als ein Dieb gefangen,
    geführt vor gottlose Leut'
    und fälschlich verklaget,
    verlacht, verhöhnt und verspeit,
    wie denn die Schrift saget.
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
        \key des\major
        \time 4/4

        f''4 f'' f'' f''  |
        ees''4 des'' c''2\fermata  |
        des''4 ees'' f'' f''  |
        ees''4( des'' ) c''2\fermata  |
        %% 5
        bes'4 c'' des'' bes'  |
        bes'8[ aes' ] ges'4 f'2\fermata  |
      \break
        ges'4 aes' bes' bes'  |
        aes'4( ges' ) f'2\fermata  |
        bes'4 a' bes' c''  |
        %% 10
        des''4 c'' bes'2\fermata  |
        des''4 ees'' f'' f''  |
      \break
        ees''4( des'' ) c''2\fermata  |
        bes'4 c'' des'' bes'  |
        bes'8[ aes' ] ges'4 f'2\fermata  |
        %% 15
        ges'4 aes' bes' bes'  |
        aes'4( ges' ) f'2 ~  |
        f'1\fermata  |
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
        \key des\major
        \time 4/4

        a'4 a' bes' c''  |
        bes'4 bes' a'2\fermata  |
        f'8[ g' ] aes'4 aes' ges'8[ f' ]  |
        ges'4( f' ) f'2\fermata  |
        %% 5
        f'4 f' f' ges'  |
        f'4 ees' d'2\fermata  |
        ees'4 f' fes' ees'  |
        ees'2 d'\fermata  |
        ees'4 f' f' g'8[ a' ]  |
        %% 10
        bes'4 aes' g'2\fermata  |
        aes'4 aes' aes' ges'  |
        ges'4( f'8[ g' ]) aes'2\fermata  |
        bes'4 f' f' f'  |
        bes4 ees' d'2\fermata  |
        %% 15
        ees'4 f' ges' ges'  |
        f'4( ees'2 des'4 )  |
        c'1\fermata  |
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
        \key des\major
        \time 4/4

        c'4 c' des' c'8[ des' ]  |
        ees'8[ f' ] ges'4 c'2\fermata  |
        bes4 ces' ces' bes  |
        bes2 a\fermata  |
        %% 5
        des'4 c' bes8[ c' ] des'[ ees' ]  |
        f'4 bes bes2\fermata  |
        bes4 des' des' des'  |
        ces'8([ des' ] ees'4 ) bes2\fermata  |
        bes4 c' des' ees'  |
        %% 10
        f'4 ees' ees'2\fermata  |
        des'4 ces' bes bes  |
        bes8([ c' ] des'4 ) ees'2\fermata  |
        ees'8[ des' ] c'4 bes8[ c' ] des'[ ees' ]  |
        f'4 bes bes2\fermata  |
        %% 15
        bes4 des' des' des'  |
        des'8([ c' ] bes4 a bes )  |
        a1\fermata  |
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
        \key des\major
        \time 4/4

        f4 f bes aes  |
        ges4 f8[ ees ] f2\fermata  |
        bes4 aes d d  |
        \stemUp ees4( bes, ) \stemNeutral f2\fermata  |
        %% 5
        bes4 a bes ges  |
        d4 ees bes,2\fermata  |
        ees4 des ges, g,  |
        aes,4( a, ) bes,2\fermata  |
        ges4 f8[ ees ] des4 c  |
        %% 10
        bes,4 c8[ des ] ees2  |
        fes4 ees d ees8[ f ]  |
        ges8([ aes ] bes4 ) aes2\fermata  |
        g4 a bes bes,8[ c ]  |
        d4 ees bes,2\fermata  |
        %% 15
        ees4 des ges,8[ aes, ] bes,[ c ]  |
        des4( ees ) f2 ~  |
        f1\fermata  |
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


pianoTreble = \new Staff {
    \set Staff.autoBeaming    = ##f
    \set Staff.midiInstrument = \midiPianoInstrument

    \clef treble
    \key des\major
    \time 4/4

    <<
        \new Voice {
            \stemUp\slurUp
            f''4 f'' f'' f''  |
            es'' des'' c''2\fermata  |
            des''4 es'' f'' f''  |
            es''( des'' ) c''2\fermata  |
            %% 5
            bes'4 c'' des'' bes'  |
            bes'8[ as' ] ges'4 f'2\fermata  |
        } % Voice
        \new Voice {
            \stemDown\slurDown
            a'4 a' bes' c''  |
            bes' bes' a'2  |
            f'8[ g' ] as'4 as' ges'8[ f' ]  |
            ges'4( f' ) f'2  |
            %% 5
            f'4 f' f' ges'  |
            f' es' d'2  |
        } % Voice
    >>
} % pianoTreble


pianoBass = \new Staff {
    \set Staff.autoBeaming    = ##f
    \set Staff.midiInstrument = \midiPianoInstrument

    \clef bass
    \key des\major
    \time 4/4

    <<
        \new Voice {
            \stemUp\slurUp
            c'4 c' des' c'8[ des' ]  |
            es'[ f' ] ges'4 c'2  |
        } % Voice
        \new Voice {
            \stemDown\slurDown
            f4 f bes as  |
            ges f8[ es ] f2  |

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
%    \score { \applymusic #unfold-repeats    \piano           \midi {} } % piano
}

%[[eof]]
