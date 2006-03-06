\version "2.6.0"
\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "XVII. Come Againe: Sweet loue doth now enuite."
    subtitle = "(First Booke of Songes or Ayres)"
    composer = "John Dowland (1562-1638)"
    copyright = "Zrajm C Akfohg, February 2006"
    tagline = ""
}
#(set-global-staff-size 18)
\paper {
    raggedbottom = ##t
    printpagenumber = ##f  % turn on/off page number printing
}

lyricOne = \lyricmode {
    Come a -- gaine: sweet loue doth now en -- uite,
    thy gra -- ces that re -- fraine,
    to do me due de -- light,
    to see, to heare, to touch, to kisse, to die,
}
lyricOneS = \lyricmode {
    \lyricOne
    with thee a -- gaine in sweet -- est sim -- pha -- thy.
}
lyricOneAB = \lyricmode {
    \lyricOne to die,
    with thee a -- gaine in sweet -- est sim -- pha -- thy.
}
lyricOneT = \lyricmode {
    \lyricOne to die,
    with thee a -- gaine,
    with thee a -- gaine in sweet -- est sim -- pha -- thy.
}




lyricTwo = \lyricmode {
    Come a -- gaine that I may cease to mourne,
    Through thy vn -- kind dis -- daine,
    For now left and for -- lorne:
    I sit, I sigh, I weepe, I faind, I die,
    In dead -- ly paine, and end -- les mi -- ser -- ie.
}
lyricThree = \lyricmode {
    All the day the sun that lends me shine,
    By frownes do cause me pine,
    And feeds me with de -- lay:
    Her smiles, my springs, that makes my ioies to grow,
    Her frowes the win -- ters of my woe:
}
lyricFour = \lyricmode {
    All the night, my sleepes are full of dreames,
    My eies are full of streames,
    My hart takes no de -- light:
    To see the fruits and ioies that some do find,
    And marke the stormes are me a -- signd,
}
lyricFive = \lyricmode {
    Out alas, my faith is euer true,
    Yet will she ne -- uer rue,
    Nor yeeld me any grace:
    Her eies of fire, her hart of flint is made,
    Whom teares nor truth may once in -- uade.
}
lyricSix = \lyricmode {
    Gen -- tle loue draw forth thy wound -- ing dart,
    Thou canst not pearce her hart,
    For I that do ap -- proue:
    By sighs and teares more hote then are thy shafts:
    Did tempt while she for tri -- umps laughs.
}

% Hides the \time it's next to, and all subsequent \time:s in that context.
hideTimes = \override Staff.TimeSignature #'break-visibility = #all-invisible

\score {
     \new ChoirStaff <<
        \new Staff {
            %\set Staff.instrument = "Cantvs"
            \new Voice {
                \clef treble
                \time 4/2

                r2 b' 4. c'' 8 d'' 1  |
                r2 d'' e'' d''  |
                c'' 2. c'' 4 b' 1  |
                r2 d'' d'' c''  |
                %% 5
                b' 2 b' a' 1  |
                r2 a' b' g'  |
                a' 2. a' 4 a' 1  |
                \repeat volta 2 {
                    \time 2/2\hideTimes
                    r4 d' g' 2  |
                    r4 e' a' 2  |
                    %% 10
                    r4 fis' b' 2  |
                    r4 g' c'' 2  |
                    \time 6/2
                    r4 a' d''2 ~ d''\breve  |
                    \time 4/2
                    r4 d'' c'' b' a' 2 r4 b'  |
                    \time 6/2
                    a'4 g' g'2.( fis'8 e' ) fis'2 g'1  |
                }
            } % Voice
            \addlyrics { \lyricOneS }
        } % Staff (Cantvs)
        \new Staff {
            %\set Staff.instrument = "Altvs"
            \new Voice {
                \clef treble
                \time 4/2

                g'2. g'4 g'1  |
                r2 b' a'4 g' g'2  |
                fis' 1 g'  |
                r2 g' g' e'4.( fis'8 )  |
                %% 5
                g'2. g'4 fis'1  |
                r2 fis' g'2. d'4  |
                e'2. e'4 fis'1  |
                \repeat volta 2 {
                    \time 2/2\hideTimes
                    d' 1  |
                    e' 2 r4 e'  |
                    %% 10
                    fis' 2 r4 fis'  |
                    g' 2 r4 g'  |
                    \time 6/2
                    a' 2 r4 a' b' 1. a' 2  |
                    \time 4/2
                    g' 4. f' 8 e' 4 g' fis' 2. g' 4  |
                    \time 6/2
                    e'2 b4( c' ) d'2. c'4 b1  |
                }
            } % Voice
            \addlyrics { \lyricOneAB }
        } % Staff (Altvs)

        \new Staff {
            %\set Staff.instrument = "Tenor"
            \new Voice {
                \clef "treble_8"
                \time 4/2

                d' 2. d' 4 b 1  |
                r2 b c' d'  |
                e'2. d'8( c' ) d'1  |
                r2 b b a  |
                %% 5
                g 2 d' d' 1  |
                r2 d' d' 2. d' 4  |
                d' 2 cis' d' 1  |
                \repeat volta 2 {
                    \time 2/2\hideTimes
                    g 1  |
                    g 2 r4 c'  |
                    %% 10
                    a 2 r4 d'  |
                    b 2 r4 e'  |
                    \time 6/2
                    d' 2 r4 c' b g g a b 2 c'  |
                    \time 4/2
                    d' 2 r4 g d' 2. d' 4  |
                    \time 6/2
                    c'4 b b a8( g ) a2. a4 g1  |
                }
            } % Voice
            \addlyrics { \lyricOneT }
        } % Staff (Tenor)

        \new Staff {
            %\set Staff.instrument = "Bassvs"
            \new Voice {
                \clef bass
                \time 4/2

                g 2 g g 1  |
                r2 g, c b,  |
                a, 2. a, 4 g, 1  |
                r2 g, g, a,  |
                %% 5
                b, 2 g, d 1  |
                r2 d g, b,  |
                a, 2. a, 4 d 1  |
                \repeat volta 2 {
                    \time 2/2\hideTimes
                    b,1  |
                    c2. c4  |
                    %% 10
                    d2. d4  |
                    e2. e4  |
                    \time 6/2
                    fis2. fis4 g2 g, g, a,  |
                    \time 4/2
                    b, 2 c d b,  |
                    \time 6/2
                    \stemDown c4( d ) \stemNeutral e2 d2. d4 g,1  |
                }
            } % Voice
            \addlyrics { \lyricOneAB }
        } % Staff (Bassvs)

%        \new Staff {
%            %\set Staff.instrument = "Lute1"
%            \new Voice {
%                \clef treble
%                \time 4/2
%
%                r\breve  |
%                r2 \stemUp g' 4 fis' e' fis' < g' g d' > 2 ~ \stemNeutral  |
%                \stemUp g' 8 [ g' fis' e' ] fis' 2 < g' d' b > 1 \stemNeutral  |
%                r2 g' 4. a' 8 b' 2 < a' c' a, >  |
%                %% 5
%                b, 2 g, r r  |
%                r2 < fis' d' a d > g, b,  |
%                r4 e' 4. ~ e' 4 g' r8 r4 r2  |
%            } % Voice
%            \new Voice {
%                < d'' d' b > 1  |
%                c'' 1  |
%                %% 10
%                r1  |
%                r1  |
%                r2 r r g 2. g 4 r2  |
%                \stemUp g'' 4. fis'' 8 e'' 4 g'' < fis'' d'' > 2. g'' 4 \stemNeutral  |
%                e'' 2 e' r g' 4 c'' < g'' d'' b' g > 1  |
%            } % Voice
%        } % Staff
%
%        \new Staff {
%            %\set Staff.instrument = "Lute2"
%            \new Voice {
%                \clef treble
%                \time 4/2
%
%                < d' g' g b > 1 < d' g' g b >  |
%                r2 < d' g b > c b,  |
%                < c' a, > 1 \stemUp g, \stemNeutral  |
%                r2 < d' b > 1 e' 4 f'  |
%                %% 5
%                < d' g > 1 < d' a d fis' >  |
%                r2 r d' 2. d' 4 ~  |
%                d' 8 [ d' cis' b ] cis' 2 r d,  |
%                \bar "|."
%            } % Voice
%            \new Voice {
%                r1  |
%                < e'' c' > 2 r4 < e'' c'' c' >  |
%                %% 10
%                < fis'' d'' a' d' > 2 r4 < fis'' d'' d' >  |
%                < g'' b' e' > 2 r4 < g'' e'' e' >  |
%                < fis' d'' a'' > 2 r4 < a'' d'' fis' > g' 2 r < b'' d'' g' > < a'' e'' c'' a >  |
%                \stemDown b 2 c' d' b \stemNeutral  |
%                r4 b' 2 r4 r < d'' a' > 2 fis' r4 r2  |
%            } % Voice
%        } % Staff
%
%        \new Staff {
%            %\set Staff.instrument = "Lute3"
%            \new Voice {
%                \clef treble
%                \time 4/2
%
%                r\breve  |
%                r\breve  |
%                r\breve  |
%                r2 g, 2. g, 4 a, 2  |
%                %% 5
%                g' 2. g' 4 r2 d,  |
%                r2 r < g' g > 1  |
%                a, 1 < d a d' fis' >  |
%                 \bar "|."
%            } % Voice
%            \new Voice {
%                r1  |
%                r1  |
%                %% 10
%                r1  |
%                r1  |
%                r1 b'' r  |
%                r1 r  |
%                < b c'' > 4 d' r c'' d' 1 r2 r4 r  |
%                 \bar "|."
%            } % Voice
%        } % Staff (final)
    >> % ChoirStaff

    \layout {
        papersize = "a4"
        \context {
            \Voice \consists Ambitus_engraver
        }
    }
    %\midi { \tempo 4 = 240 }
} % score

%[[eof]]
