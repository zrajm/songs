\version "2.6.0"
\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Lämpligt röstomfång"
    subtitle = \markup { "(från" \italic "För kör," "av Madeleine Uggla s.116)" }
    %composer = "J.S. Bach (1685-1750)"
    copyright = "Zrajm C Akfohg, mars 2006"
    tagline = ""
}
#(set-global-staff-size 18)
\paper {
    raggedbottom = ##t
    raggedright = ##t
    printpagenumber = ##f  % turn on/off page number printing
}


\score {
    \new ChoirStaff <<
        \new Staff {
            \new Voice {
                \set Staff.instrument = "Sopran"
                \set Staff.instr = "S"

                \clef treble

                f'' 1  |
                bes 1  |

                \bar "|."
            } % Voice
        } % Staff (Soprano)

        \new Staff {
            \new Voice {
                \set Staff.instrument = "Alt"
                \set Staff.instr = "A"

                \clef treble

                d'' 1  |
                g 1  |

                \bar "|."
            } % Voice
        } % Staff (Alto)

        \new Staff {
            \new Voice {
                \set Staff.instrument = "Tenor"
                \set Staff.instr = "T"

                \clef "treble_8"

                g' 1  |
                c 1  |

                \bar "|."
            } % Voice
        } % Staff (Tenor)

        \new Staff {
            \new Voice {
                \set Staff.instrument = "Bass"
                \set Staff.instr = "B"

                \clef bass

                d' 1  |
                g, 1  |

                \bar "|."
            } % Voice
        } % Staff (Bass)
    >> % ChoirStaff

    \layout {
        papersize = "a4"
        \context {
            \Voice \consists Ambitus_engraver
        }
    }
    % \midi { \tempo 4 = 50 }

} % score

%[[eof]]
