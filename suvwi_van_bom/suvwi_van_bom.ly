\version "2.8.0"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% License: Attribution-ShareAlike2.5 License
%
% [2006-02-17] written by Zrajm C Akfohg using Lilypond 2.6.5
%

\header {
    title = \markup \bold { SuvwI’ van bom. }
    subtitle = \markup \italic { The Warrior’s Anthem. }
    poet = \markup {
        Hilary J. Bader (1952-2002),
        %\italic { First Booke of Songes or Ayres, }
        1996
    }
    composer = \markup {
        ©Paramount Pictures, %(birth–death)
        %\italic { First Booke of Songes or Ayres, }
        1993
    }
    tagline = \markup \column { \center-align {
        \line { Zrajm C Akfohg, February & December 2006 }
        \line { http://zrajm.klingonska.org/songs/ }
    }}
}


myStaffSize = #18
#(set-global-staff-size myStaffSize)
\paper {

    #(set-paper-size "a4" 'landscape)  % A4 = 210mm × 297.9mm
    %linewidth = 27.0 \cm
    paper-height        = 210\mm
    paper-width         = 297\mm
    line-width          = 277\mm  %- 20\mm % default: paper-width - 20mm
    left-margin         = 10\mm


    ragged-bottom     = ##t
    print-page-number = ##f  % turn on/off page number printing
    page-top-space    = 0\mm

    %line-width = 160\mm - 2.0 * 0.4\in

}

\layout {
    \context {
        \Lyrics
        \override LyricSpace #'minimum-distance = #1 %default: #0.45
            % Widen space between words in lyrics a little bit (otherwise the
            % word separation it difficult to spot when the space occurs
            % between two apostrophes). /zrajm [2006-12-13]
    }
    \context {
        \Score
        \override PaperColumn #'keep-inside-line = ##t
    }
    \context {
        \Staff
        \consists Ambitus_engraver
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


left = {
    \once \override LyricText #'self-alignment-X = #-1 %default: #0
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Choir Notes & Lyrics                                                     %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


melody = {
    \new Staff {
        \new Voice {
            \set Staff.autoBeaming    = ##f
            \set Staff.midiInstrument = "drawbar organ"

            \clef treble
            \key as\major
            \time 4/4

            \transpose c c' {
                \stemUp
                f2 f4 f | as2  bes4   r          | % Qoy qeylIS        | puqloD _
                f2 f4 f | as2( bes4 ) r          | % Qoy puqbe’-       | pu’ _
                f f f f | as as bes2             | % yoHbogh matlhbogh | je SuvwI’
                \stemNeutral
                c'4 bes as g                     | % Say’moHchu’ may’
                f2 r4. c'8                       | %   ’Iw. _ ma-
                f4. f8 f4. as8                   | % Suv manong ’ej
                as4 as bes4. c'8                 | %   maHoHchu’. nI’-
                f4 f f f                         | % be’ yInmaj ’ach
                as2 f'4 r                        | %   wovqu’. _
                c' c' c'8[ bes ] as4             | % batlh maHeghbej
                bes bes bes g                    | %   ’ej yo’ qIjDaq
                c' c'8 c' c'[ bes ] as bes       | %   vavpu’ma’ DImuv. pa’
                c'4 bes8 bes8 bes4 g8 bes        | %   reH maSuvtaHqu’. ma-
                \time 3/2                          %
                c'8[ bes ] g g bes[ as ] g4 r as | %   mevQo’. maSuvtaH. _ ma-
                \time 4/4 f1 ~ f                 | %   ’ov.
                \bar "|."
            } % transpose
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
        } % addlyrics
    } % Staff
}


\book {
    \score {                             \melody          } % sheet music
    \score { \applyMusic #unfold-repeats \melody \midi {} } % midi output
}

%[[eof]]
