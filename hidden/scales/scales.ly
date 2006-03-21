\version "2.6.0"
\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 27"
    subtitle = ""
    composer = "J.S. Bach (1685-1750)"
    copyright = "Zrajm C Akfohg, mars 2006"
    tagline = ""
}
#(set-global-staff-size 18)
\paper {
    raggedbottom = ##t
    printpagenumber = ##f  % turn on/off page number printing
}


% Swedish lyrics
lyricSvOne = \lyricmode {
} lyricSvTwo = \lyricmode {
}


\score {
    \new ChoirStaff <<
        \new Staff {
            \new Voice {
                \set Staff.instrument = "Soprano"
                \set Staff.instr = "S"

                \clef treble
                \time 4/4

                %\setEasyHeads

                \repeat volta 2 {
                    \partial 4 a'4  |
                    a'4 a' gis' e'  |
                    a'4 b' c'' c''  |
                    d''4( c''16 b' c''8 ) b'4\fermata b'  |
                    c''4 d''8( e''16 f'' ) e''4 c''  |
                    %% 5
                    f''4 f'' e''8( d'' ) c''( d'' )  |
                    d''2 c''4\fermata c''  |
                    b'4 a' g'8( fis' ) e'( fis' )  |
                    g'4 g' a' g'  |
                    f'2 e'4\fermata e''  |
                    %% 10
                    d''4 c''8( b' ) b'2  |
                    a'2.\fermata
                }
            } % Voice
            \addlyrics { \lyricSvOne }
            \addlyrics { \lyricSvTwo }
        } % Staff (Soprano)

        \new Staff {
            %\set Staff.instrument = "Alto"
            \new Voice {
                \set Staff.instrument = "Alto"
                \set Staff.instr = "A"

                \clef treble
                \time 4/4

                \repeat volta 2 {
                    \partial 4 c'8( d' )  |
                    e'4 e' e' b  |
                    e'8( fis' ) gis'4 a' a'  |
                    a'2 gis'4\fermata gis'  |
                    a'4 g' g' f'  |
                    %% 5
                    a'4 a' a' e'  |
                    a'4( g' ) g'\fermata a'  |
                    a'8( g' ) g'( fis' ) e'4 e'  |
                    e'8( d' ) cis'( d' ) e'4 e'  |
                    e'4( d' ) cis'\fermata a'  |
                    %% 10
                    a'8( b' ) e'( d' ) f'4( e'8 d' )  |
                    cis'2.\fermata 
                }
            } % Voice
            \addlyrics { \lyricSvOne }
            \addlyrics { \lyricSvTwo }
        } % Staff (Alto)

        \new Staff {
            \new Voice {
                \set Staff.instrument = "Tenor"
                \set Staff.instr = "T"

                \clef "treble_8"
                \time 4/4

                \repeat volta 2 {
                    \partial 4 a8( b )  |
                    c'4 c' b gis  |
                    a4 d' e' e'  |
                    \stemDown f'4( a ) e'\fermata e' \stemNeutral  |
                    e'4 b c' a  |
                    %% 5
                    d'4 d' c' c'  |
                    c'4( b ) e'\fermata e'  |
                    fis'8( e' ) c'4 b b  |
                    % b4 ais _#'(italic "b") a a  |   %% some magic here!
                    b4 ais ^"b" a a  |
                    a2 a4\fermata c'  |
                    %% 10
                    c'8( b ) a4 a( gis )  |
                    e2.\fermata 
                }
            } % Voice
            \addlyrics { \lyricSvOne }
            \addlyrics { \lyricSvTwo }
        } % Staff (Tenor)

        \new Staff {
            \new Voice {
                \set Staff.instrument = "Bass"
                \set Staff.instr = "B"

                \clef bass
                \time 4/4

                \repeat volta 2 {
                    \partial 4 g,4  |
                    a,8( b, ) c( d ) e( f ) e( d )  |
                    c8( d ) c( b, ) a,( e ) a( g )  |
                    f8( e f d ) e4\fermata e  |
                    a8( g ) f( g ) c( d ) e( f )  |
                    %% 5
                    d8( e ) f( g ) a( b ) a( g )  |
                    f8( e f g ) c4\fermata a  |
                    dis8( e ) fis( dis ) e( fis ) g( fis )  |
                    e8( f ) e( d ) cis( a, ) b,( cis )  |
                    d8( e f g ) a4\fermata a8( g )  |
                    %% 10
                    fis8( gis ) a( f ) \stemUp d( b, e4 ) \stemNeutral  |
                    a,2.\fermata
                }
            } % Voice
            \addlyrics { \lyricSvOne }
            \addlyrics { \lyricSvTwo }
        } % Staff (Bass)
    >> % ChoirStaff

    \layout {
        papersize = "a4"
        \context {
            \Staff \consists Ambitus_engraver
        }
    }
    % \midi { \tempo 4 = 50 }

} % score

%[[eof]]
