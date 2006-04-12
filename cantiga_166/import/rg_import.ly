\version "2.6.0"
\header {
    copyright = "Unknown"
    subtitle = "blank"
    title = "Untitled"
    tagline = "Exported by Rosegarden 4-1.0"
    footer = "Rosegarden 4-1.0"
}
#(set-global-staff-size 18)
\score {
    \new ChoirStaff <<
        % force offset of colliding notes in chords:
        \override Score.NoteColumn #'force-hshift = #1.0
        \time 3/2

        \new Staff {
            %\set Staff.instrument = "Treble"
            \new Voice {

                \time 3/2
                  r2*2 \clef treble
                f'4 f'  |
                f'4( e' ) d' f'2 g'4  |
                a'2 a' a'4 a'  |
                c''4( b' ) c'' c''2 c''8[ b' ]  |
                %% 5
                a'2 a' a'4 g'  |
                f'4( e' ) d' f'2 g'4  |
                a'2 a' a'4 g'  |
                f'4( e' ) d' e' d' c'  |
                d'2 d'^"Fine" c''4 c''  |
                %% 10
                c''4( b' ) g' a'2 b'4  |
                c''2 c'' c''4 d''  |
                c''4( b' ) g' a'2 b'4  |
                g'2 g' c''4 c''  |
                c''4( b' ) g' a'2 b'4  |
                %% 15
                c''2 c'' c''4 d''  |
                c''4( b' ) g' a'2 b'4  |
                g'2 g' a'4 g'  |
                f'4( e' ) d' f'2 g'4  |
                a'2 a' a'4 a'  |
                %% 20
                c''4( b' ) c'' d''2 c''8[ b' ]  |
                a'2 a' a'4 g'  |
                f'4( e' ) d' f'2 g'4  |
                a'2 a' a'4 g'  |
                f'4( e' ) d' e'( d' ) c'  |
                %% 25
                d'2 d' f'4^"Da Capo" f'  |
                r2 r 
                % warning: bar too short, padding with rests
                 r2  |
                 \bar "|."
            } % Voice

        } % Staff

        \new Staff {
            %\set Staff.instrument = "track"
            \new Voice {
                \override Voice.TextScript #'padding = #2.0

                \time 3/2
                  r2*2 \clef treble
                d''4 a'  |
                d'4 a' d'' d' a' d''  |
                d'4 a' d'' a' d'' a'  |
                d'4 a' d'' d' a' d''  |
                %% 5
                d'4 a' d'' a' d'' a'  |
                d'4 a' d'' d' a' d''  |
                d'4 a' d'' a' d'' a'  |
                d'4 a' d'' c' g' c''  |
                d'4 a' d'' a'^"Fine" d'' a'  |
                %% 10
                f'4 c'' f'' f' c'' f''  |
                f'4 c'' f'' c'' f'' c''  |
                f'4 c'' f'' f' c'' f''  |
                g'4 d'' g'' d'' g'' d''  |
                f'4 c'' f'' f' c'' f''  |
                %% 15
                f'4 c'' f'' c'' f'' c''  |
                f'4 c'' f'' f' c'' f''  |
                g'4 d'' g'' d'' < f'' c'' f' > < e'' b' e' >  |
                d'4 a' d'' d' a' d''  |
                e'4 a' d'' a' d'' a'  |
                %% 20
                d'4 a' d'' d' a' d''  |
                d'4 a' d'' a' d'' a'  |
                d'4 a' d'' d' a' d''  |
                d'4 a' d'' a' d'' a'  |
                d'4 a' d'' c' g' c''  |
                %% 25
                d'4 a' d'' a' d''^"Da Capo" a'  |
                r2 r 
                % warning: bar too short, padding with rests
                 r2  |
                 \bar "|."
            } % Voice

        } % Staff(final)
    >> % ChoirStaff
    \layout { papersize = "a4" }
    \midi {
        \tempo 4 = 120
    } 
} % score

%[[eof]]