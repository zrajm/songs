\version "2.6.0"
\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "La, la, la, vågar jag berätta"
    subtitle = "(La la la, je ne l'ose dire)"
    composer = "Pierre Certon (1562-1638)"
    copyright = "Zrajm C Akfohg, februari 2006"
    tagline = ""
}
%#(set-default-paper-size "a4" 'landscape)
#(set-global-staff-size 18)
\paper {
    raggedbottom = ##t
    printpagenumber = ##f  % turn on/off page number printing
}

\score {
    \new ChoirStaff <<
        \new Staff {
            %\set Staff.instrument = "Soprano"
            \new Voice {
                \clef treble
                \key f\major
                \time 4/4

                \stemUp
                g' 4 fis' g'  bes' 8 bes'   |
                bes' 4  a' 8 a'  a' 4 g' ~  |
                g' 8 g' g' g'  fis' 4 g'  |
                bes' 4 a' g' 2  |
                %% 5
                g' 8 g' g' fis'  g' 4 a'  |
                bes' 4 a' g' 2  |
                g' 8 g' g' fis'  g' 2  |
              \break
                \repeat volta 9 {
                    g' 4 g' g' bes'  |
                    a' 4 g' fis' g'  |
                    %% 10
                    bes' 4. bes' 8 a' 4 g'  |
                    g' 4 fis' g' 2  |
                    bes' 4. bes' 8 bes' 4 bes'  |
                    d'' 4 bes' a' g'  |
                    bes' 4. bes' 8 a' 4 g'  |
                    %% 15
                    f' 4 es' d' g'  |
                    g' 4 fis' g'  bes' 8 bes'   |
                    bes' 4  a' 8 a'  a' 4 g' ~  |
                    g' 8 g' g' g'  fis' 4 g'  |
                    bes' 4 a' g' 2  |
                    %% 20
                    g' 8 g' g' fis'  g' 4 a'  |
                    bes' 4 a' g' 2  |
                    g' 8 g' g' fis'  g' 2 \fermata  |
                }
            } % Voice
            \addlyrics {
                La la la, vå -- gar jag, vå -- gar jag,
                vå -- gar jag be -- rätt -- a
                La la la, jag ska säg -- a allt och
                la la la, jag ska säg -- a allt

                \set stanza = "1. "
                Det finns en man här i stad -- en
                som är svart -- sjuk på sin fru
                Han är rädd att bli be -- drag -- en
                men det blev han än -- då nu
                och

                la la la, vå -- gar jag, vå -- gar jag,
                vå -- gar jag be -- rätt -- a
                La la la, jag ska säg -- a allt och
                la la la jag ska säg -- a allt
            }
        } % Staff (Soprano)

        \new Staff {
            %\set Staff.instrument = "Alto"
            \new Voice {
                \clef "treble_8"
                \key g\minor
                \time 4/4

                d' 4 d' bes  g' 8 g'   |
                d' 4  f' 8 f'  c' 4 es' ~  |
                es' 8 es' d' d'  d' 4 bes  |
                g' 4 f' es' 2  |
                %% 5
                es' 8 es' d' d'  bes 4 f'  |
                g' 4 f' es' 2  |
                es' 8 es' d' d'  bes 2  |
                \repeat volta 9 {
                    d' 4 d' d' f'  |
                    f' 4 d' d' bes  |
                    %% 10
                    d' 4. g' 8 f' 4 es'  |
                    es' 4 d' bes 2  |
                    g' 4. g' 8 g' 4 g'  |
                    a' 4 g' fis' g'  |
                    g' 4 f' f' d'  |
                    %% 15
                    d' 4 bes bes d'  |
                    es' 4 d' bes  g' 8 g'   |
                    d' 4  f' 8 f'  c' 4 es' ~  |
                    es' 8 es' d' d'  d' 4 bes  |
                    g' 4 f' es' 2  |
                    %% 20
                    es' 8 es' d' d'  bes 4 f'  |
                    g' 4 f' es' 2  |
                    es' 8 es' d' d'  b 2 \fermata  |
                }
            } % Voice
            \addlyrics {
                La la la, vå -- gar jag, vå -- gar jag,
                vå -- gar jag be -- rätt -- a
                La la la, jag ska säg -- a allt och
                la la la, jag ska säg -- a allt

                \set stanza = "1. "
                Det finns en man här i stad -- en
                som är svart -- sjuk på sin fru
                Han är rädd att bli be -- drag -- en
                men det blev han än -- då nu och

                la la la, vå -- gar jag, vå -- gar jag,
                vå -- gar jag be -- rätt -- a
                La la la, jag ska säg -- a allt och
                la la la jag ska säg -- a allt
            }
        } % Staff (Alto)

        \new Staff {
            %\set Staff.instrument = "Tenor"
            \new Voice {
                \clef "treble_8"
                \key d\minor
                \time 4/4

                bes 4 a g 2  |
                bes 8 c'  d' 4  a 8 bes  c' 4  |
                g 8 a bes g  a 4 g  |
                d' 4 d' bes 2  |
                %% 5
                c' 8 c' bes a  g 4 d'  |
                d' 4 d' bes 2  |
                c' 8 c' bes a  g 2  |
                \repeat volta 9 {
                    bes 4 bes bes d'  |
                    c' 4 bes a g  |
                    %% 10
                    g 8[ a bes ] c' d' 4 bes  |
                    c' 4 a g 2  |
                    d' 4. d' 8 d' 4 d'  |
                    d' 4 d' d' bes  |
                    bes 4 d' c' bes  |
                    %% 15
                    a 4 g f bes  |
                    a 4 a g 2  |
                    bes 8 c'  d' 4  a 8 bes  c' 4  |
                    g 8 a bes g  a 4 g  |
                    d' 4 d' bes 2  |
                    %% 20
                    c' 8 c' bes a  g 4 d'  |
                    d' 4 d' bes 2  |
                    c' 8 c' bes a  g 2 -\fermata  |
                }
            } % Voice
            \addlyrics {
                La la la, vå -- gar jag, vå -- gar jag,
                vå -- gar jag be -- rätt -- a
                La la la, jag ska säg -- a allt och
                la la la, jag ska säg -- a allt

                \set stanza = "1. "
                Det finns en man här i stad -- en
                som _ _ är svart -- sjuk på sin fru
                Han är rädd att bli be -- drag -- en
                men det blev han än -- då nu och

                la la la, vå -- gar jag, vå -- gar jag,
                vå -- gar jag be -- rätt -- a
                La la la, jag ska säg -- a allt och
                la la la jag ska säg -- a allt
            }
        } % Staff (Tenor)

        \new Staff {
            %\set Staff.instrument = "Bass"
            \new Voice {
                \clef bass
                \key g\minor
                \time 4/4

                g 4 d g 2  |
                g 8 g  d 4  f 8 f  c 4  |
                c 8 c g g  d 4 g  |
                g 4 d es 2  |
                %% 5
                c 8 c d d  g 4 d  |
                g 4 d es 2  |
                c 8 c d d  g 2  |
                \repeat volta 9 {
                    g 4 g g d  |
                    f 4 g d g  |
                    %% 10
                    g 4. g 8 d 4 es  |
                    c 4 d g 2  |
                    g 4. g 8 g 4 g  |
                    f 4 g d g  |
                    g 4 bes f g  |
                    %% 15
                    d 4 es bes, bes,  |
                    c 4 d g, 2  |
                    g 8 g  d 4  f 8 f  c 4  |
                    c 8 c g g  d 4 g  |
                    g 4 d es 2  |
                    %% 20
                    c 8 c d d  g 4 d  |
                    g 4 d es 2  |
                    c 8 c d d  g 2 \fermata  |
                }
            } % Voice
            \addlyrics {
                La la la, vå -- gar jag, vå -- gar jag,
                vå -- gar jag be -- rätt -- a
                La la la, jag ska säg -- a allt och
                la la la, jag ska säg -- a allt

                \set stanza = "1. "
                Det finns en man här i stad -- en
                som är svart -- sjuk på sin fru
                Han är rädd att bli be -- drag -- en
                men det blev han än -- då nu och

                la la la, vå -- gar jag, vå -- gar jag,
                vå -- gar jag be -- rätt -- a
                La la la, jag ska säg -- a allt och
                la la la jag ska säg -- a allt
            }
            \addlyrics {
                \repeat unfold 32 \skip 1
                \set stanza = "2. "
                Hon är ung och han är gam -- mal
                Så -- dant kom -- mer o -- färd av
                Slit -- en päls ger ing -- en värm -- e
                murk -- en gren har ing -- en sav
                och
            }
        } % Staff (Bass)
    >> % ChoirStaff

    \layout {
        papersize = "a4"
        \context {
            \Voice \consists Ambitus_engraver
        }
    }
    %\midi { \tempo 4 = 120 }
} % score

%[[eof]]
