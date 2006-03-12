\version "2.6.0"
\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "So ben mi ch'ha bon tempo"
    subtitle = "Aria a 4"
    composer = "Orazio Vecchi (1550-1605)"
    copyright = "Zrajm C Akfohg, februari 2006"
    tagline = ""
}
#(set-global-staff-size 18)
#(set-default-paper-size "a4" 'landscape)
\paper {
    raggedbottom = ##t
    printpagenumber = ##f  % turn on/off page number printing
}

% Hides the \time it's next to, and all subsequent \time:s in that context.
hideTimes = \override Staff.TimeSignature #'break-visibility = #all-invisible

\score {
     \new ChoirStaff <<
        \new Staff {
            %\set Staff.instrument = "Soprano"
            \new Voice {
                \clef treble
                \time 4/4

                \repeat volta 2 {
                    \partial 4 d'4  |
                    d'4 e' f' g'  |
                    a'2 a'4 d'  |
                    d'4 e' f' g'  |
                    %% 5
                    a'2 a'4 c''  |
                    c''2 d''  |
                    e''2. d''8 c''  |
                    b'4 a' b' b'  |
                    \partial 4*3 a'2 r4  |
                }
              \break
                \repeat volta 2 {
                    \partial 4 d''4  |
                    d''4 d'' cis'' cis''  |
                    d''2 r4 c''  |
                    %% 20
                    c''4 c'' \stemDown b' b' \stemNeutral  |
                    c''2 g'4 a'  |
                    bes'2 a'  |
                    g'2 f'4 f'  |
                    e'4 d' e' e'  |
                }
                \alternative {
                    { \partial 4*3 d'2 r4 }
                    { d'1\fermata }
                }
            } % Voice
            \addlyrics {
                \set stanza = "1. "
                \repeat unfold 2 { So ben mi ch'ha bon tem -- po, }
                Fa la la la la la la la la la la,
                \set stanza = "1. "
                \repeat unfold 2 { Al so, ma ba -- sta mo, }
                Fa la   la la   la la, Fa   la la la la   la.
                la.
            }
        } % Staff (Soprano)

        \new Staff {
            %\set Staff.instrument = "Alto"
            \new Voice {
                \clef "treble_8"
                \time 4/4

                \repeat volta 2 {
                    \partial 4 a4  |
                    a4 a d' d'  |
                    cis'2 cis'4 a  |
                    a4 a d' d'  |
                    %% 5
                    cis'2 cis'4 e'  |
                    e'2 g'  |
                    g'2. f'4  |
                    g'4 c' e' e'  |
                    \partial 4*3 e'2 r4  |
                }
                \break
                \repeat volta 2 {
                    \partial 4 f'4  |
                    d'4 d' g' g'  |
                    fis'2 r4 f'  |
                    %% 20
                    f'4 e' g' g'  |
                    a'4 a' e' f'  |
                    g'4 f'8 g' c'4 c' ~  |
                    c'4 c' a4. \stemDown b8 \stemNeutral  |
                    c'4 d' d' cis'  |
                    %% 25
                }
                \alternative {
                    { \partial 4*3 d'2 r4 }
                    { d'1\fermata }
                }
            } % Voice
            \addlyrics {
                \set stanza = "1. "
                \repeat unfold 2 { So ben mi ch'ha bon tem -- po, }
                Fa la la la la la la la la la,
                \set stanza = "1. "
                \repeat unfold 2 { Al so, ma ba -- sta mo, }
                Fa la la la la la la,
                Fa la la, Fa la la la la la.
                la.
            }
        } % Staff (Alto)

        \new Staff {
            %\set Staff.instrument = "Tenor"
            \new Voice {
                \clef "treble_8"
                \time 4/4

                \repeat volta 2 {
                    \partial 4 f4  |
                    f4 e d d  |
                    e2 e4 f  |
                    f4 e d d  |
                    %% 5
                    e2 e4 a  |
                    c'2 b  |
                    c'2. a4  |
                    e'4 a a gis  |
                    \partial 4*3 a2 r4  |
                }
                \break
                \repeat volta 2 {
                    \partial 4 a4  |
                    b4 b g g  |
                    a2 r4 a  |
                    %% 20
                    c'4 c' d' d'  |
                    f'2 r  |
                    d'4 e' f'2  |
                    e'2 d'  |
                    c'4 f a a  |
                    %% 25
                }
                \alternative {
                    { \partial 4*3 a2 r4 }
                    { a1\fermata }
                }
            } % Voice
            \addlyrics {
                \set stanza = "1. "
                \repeat unfold 2 { So ben mi ch'ha bon tem -- po, }
                Fa la la la la la la la la la,
                \set stanza = "1. "
                \repeat unfold 2 { Al so, ma ba -- sta mo, }
                Fa la la la la la la la la la.
                la.
            }
        } % Staff (Tenor)

        \new Staff {
            %\set Staff.instrument = "Bass"
            \new Voice {
                \clef bass
                \time 4/4

                \repeat volta 2 {
                    \partial 4 d4  |
                    d4 cis d bes,  |
                    a,2 a,4 d  |
                    d4 cis d bes,  |
                    %% 5
                    a,2 a,4 a  |
                    a2 g  |
                    c2. d4  |
                    e4 f e e  |
                    \partial 4*3 a,2 r4  |
                }
                \break
                \repeat volta 2 {
                    \partial 4 d4  |
                    g4 g e e  |
                    d2 r4 f  |
                    %% 20
                    f4 a g g  |
                    f4 f, c bes,8 a,  |
                    g,4 g, f, f  |
                    c2 d4 c8 bes,  |
                    a,4 bes, a, a,  |
                    %% 25
                }
                \alternative {
                    { \partial 4*3 d2 r4 }
                    { d1\fermata }
                }
            } % Voice
            \addlyrics {
                \set stanza = "1. "
                \repeat unfold 2 { So ben mi ch'ha bon tem -- po, }
                Fa la la la la la la la la la,
                \set stanza = "1. "
                \repeat unfold 2 { Al so, ma ba -- sta mo, }
                Fa la la la la la la,
                Fa la la la la la la la la la.
                la.
            }
            \addlyrics {
                \set stanza = "2. "
                \repeat unfold 2 { So ben ch'è fav -- o -- ri -- to, }
                \repeat unfold 10 { \skip 1 }
                \set stanza = "2. "
                \repeat unfold 2 { Ahi -- mè! no'l pos -- so dir. }
            }
            \addlyrics {
                \set stanza = "3. "
                \repeat unfold 2 { Oh! S'io po -- tessi al -- me -- no! }
                \repeat unfold 10 { \skip 1 }
                \set stanza = "3. "
                \repeat unfold 2 { Chi va, chi sta, chi vien, }
            }
            \addlyrics {
                \set stanza = "4. "
                \repeat unfold 2 { La ti da -- rà mar -- tell -- o }
                \repeat unfold 10 { \skip 1 }
                \set stanza = "4. "
                \repeat unfold 2 { Per far -- ti dis -- per -- ar. }
            }
            \addlyrics {
                \set stanza = "5. "
                \repeat unfold 2 { Sa -- luti e ba -- cia -- ma -- ni }
                \repeat unfold 10 { \skip 1 }
                \set stanza = "5. "
                \repeat unfold 2 { Son tutti indar -- no aff -- è; }
            }
            \addlyrics {
                \set stanza = "6. "
                \repeat unfold 2 { Non gio -- va fa -- re il Zanni }
                \repeat unfold 10 { \skip 1 }
                \set stanza = "6. "
                \repeat unfold 2 { An -- dan -- do su e giù, }
            }
            \addlyrics {
                \set stanza = "7. "
                \repeat unfold 2 { Al può ben im -- pic -- car -- si }
                \repeat unfold 10 { \skip 1 }
                \set stanza = "7. "
                \repeat unfold 2 { Ch'al non fa -- rà ni -- en. }
            }
            \addlyrics {
                \set stanza = "8. "
                \repeat unfold 2 { Pas -- seg -- gia pur chi vuo -- le }
                \repeat unfold 10 { \skip 1 }
                \set stanza = "8. "
                \repeat unfold 2 { Ch'el tem -- po per -- de -- rà }
            }
            \addlyrics {
                \set stanza = "9. "
                \repeat unfold 2 { O parli, o ridi, o pi -- angi, }
                \repeat unfold 10 { \skip 1 }
                \set stanza = "9. "
                \repeat unfold 2 { Non tro -- ver -- à pie -- tà. }
            }
            \addlyrics {
                \set stanza = "10. "
                \repeat unfold 2 { Dice il pro -- ver -- bio an -- tico, }
                \repeat unfold 10 { \skip 1 }
                \set stanza = "10. "
                \repeat unfold 2 { Chi ha fatto suo buon pro. }
            }
        } % Staff (Bass)
    >> % ChoireStaff

    \layout {
        papersize = "a4"
        \context {
            \Voice \consists Ambitus_engraver
        }
    }
    %\midi { \tempo 4 = 165 }
} % score

%    Arcaic Italian                 Translation (by John Horton)
%
% 1. So ben mi ch'ha bon tempo,     I know a lucky fellow
%    Al so, ma basta mo,            I know but I won't tell
%
% 2. So ben ch'è favorito,         I know that he's in favour
%    Ahimè! no'l posso dir.        I'm sorry I can't say
%
% 3. Oh! S'io potessi almeno!       I wish that I could tell you
%    Chi va, chi sta, chi vien,     Who goes, who stays, who comes
%
% 4. La ti darà martello          I'm sure you would be jealous
%    Per farti disperar.            And maybe you'd despair
%
% 5. Saluti e baciamani
%    Son tutti indarno affè;
%
% 6. Non giova fare il Zanni
%    Andando su e giù,
%
% 7. Al può ben impiccarsi
%    Ch'al non farà nien.
%
% 8. Passeggia pur chi vuole
%    Ch'el tempo perderà
%
% 9. O parli, o ridi, o piangi,
%    Non troverà pietà.
%
% 10.Dice il proverbio antico,
%    Chi ha fatto suo buon pro.


% Alternate lyrics: :)
% [http://www.richardthompson-music.com/catch_of_the_day.asp?id=182]
% 
% O ben mi ca bon tempon
% 
% This song is in italian,
% this song is in italian,
% fa la la la
% lalalalalala
% 
% but i don't know the words,
% but i don't know the words,
% fa la la la
% lalalalalala
% 
% my grandparents were from there,
% my grandparents were from there,
% fa la la la
% lalalalalala
% 
% but i don't know a word,
% but i don't know a word,
% fa la la la
% lalalalalala

%[[eof]]
