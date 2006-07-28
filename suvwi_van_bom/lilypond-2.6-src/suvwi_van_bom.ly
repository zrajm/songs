\version "2.6.5"

%
% License: Attribution-ShareAlike2.5 License
%
% [2006-02-17] written by Zrajm C Akfohg using Lilypond 2.6.5
%

\header {
    dedication = \markup \small "http://klingonska.org/songs/anthem"
    title = "SuvwI’ van bom (1996)"
    subtitle = "(The Warrior’s Anthem)"
    poet = "Hilary J. Bader (1952-2002)"
    composer = "©1993 Paramount Pictures"
    copyright = "Zrajm C Akfohg, February 2006"
    tagline = ""
}
#(set-global-staff-size 18)
\paper {
    raggedbottom = ##t
    printpagenumber = ##f  % turn on/off page number printing
}

\score {
    \new Staff {
        %\set Staff.instrument = "Melody"
        %\set Staff.midiInstrument = "drawbar organ"
        \new Voice {
            \repeat volta 2 {
                \clef treble
                \key as\major
                \time 4/4

                f'2     f'4 f' | as'2  bes'4   r     |
                f'2     f'4 f' | as'2( bes'4 ) r     |
                f'  f'  f'  f' | as'   as'     bes'2 |
                c''4 bes' as' g' | f'2 r4 r8
                c''8 | f'4. f'8 f'4. as'8 | as'4 as' bes'4.
                c''8 | f'4  f'  f'   f'    | as'2 f''4 r
                c'' c'' c''8( bes' )  as'4 | bes' bes' bes' g' | c'' c''8 c'' c''( bes' ) as' bes'
                c''4 bes'8 bes'8  bes'4 g'8 bes'
                \time 3/2 c''8( bes' ) g' g' bes'( as' ) g'4 r as' |
                \time 4/4 f'1( f' )
            } % repeat
        } % voice
        \addlyrics {
            Qoy qey -- lIS puq -- loD
            Qoy puq -- be’ -- pu’
            yoH -- bogh matlh -- bogh je Suv -- wI’
            Say’ -- moH -- chu’ may’ ’Iw.
            ma -- Suv ma -- nong ’ej ma -- HoH -- chu’.
            nI’ -- be’ yIn -- maj ’ach wov -- qu’.
            batlh ma -- Hegh -- bej ’ej yo’ qIj -- Daq vav -- pu’ -- ma’ DI -- muv. pa’
                reH ma -- Suv -- taH -- qu’. ma --
                mev -- Qo’. ma -- Suv -- taH. ma -- ’ov.
        }
    } % Staff

    \layout {
        papersize = "a4"
        \context {
            \Voice \consists Ambitus_engraver
        }
    }
    %\midi { \tempo 4 = 150 }
}

%[[eof]]
