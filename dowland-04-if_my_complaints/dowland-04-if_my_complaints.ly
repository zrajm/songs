\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    title = "IIII. If My Complaints."
    composer = \markup {
        John Dowland, %(1562–1638)
        \italic { First Booke of Songes or Ayres, }
        1597
    }
    tagline = \markup \column { \center-align {
        \line { Zrajm C Akfohg, March–April 2006 }
        \line { http://zrajm.klingonska.org/songs/ }
    }}
}
midiChoirInstrument = #"drawbar organ"
midiCompInstrument  = #"acoustic guitar (nylon)"
upstep              = \partial 4*3
labelSoprano        = \markup Cantus
shortSoprano        = \markup C
labelAlto           = \markup Altus
shortAlto           = \markup A
labelTenor          = \markup Tenor
shortTenor          = \markup T
labelBass           = \markup Bassus
shortBass           = \markup B
labelComp           = \markup { Lute   }
shortComp           = \markup { L   }

myStaffSize = #18
#(set-global-staff-size myStaffSize)
\paper {
    #(set-paper-size "a4" 'landscape)  % A4 = 210mm × 297.9mm
    %raggedbottom    = ##t
    %raggedlast      = ##t
    printpagenumber = ##f  % turn on/off page number printing

    topmargin = 12.5\mm
    headsep   = 0\mm  %% no effect?

    %beforetitlespace = 50\mm
        % only useful if there's a title coming after some staves
    %betweentitlespace = 10\mm  % dist between titles
        %(e.g., the title of the book and the title of a piece)
    aftertitlespace = 0\mm
        % distance between title/composer header and fist system thereafter
        % If set to '0\mm', generates the somewhat bizarre error message:
        %    programming error: insane spring found, setting to unit
        %    continuing, cross fingers

    %indent = 10\mm
        % indent for 1st system (excluding any leftmost labels)
    betweensystemspace  = 0.01\mm
    betweensystempadding = 0.01\mm
        % between systems, and topmost system/title (overlapping with
        % `aftertitlespace', I think)

}
\layout {
    papersize = "a4"
    \context {
        \Staff
            \consists Ambitus_engraver
            %minimumVerticalExtent = #'(-3 . 3) % put lyrics closer to staff
                % default is: #'(-4 . 4)
    }
    \context {
        \GrandStaff
            \consists Instrument_name_engraver
                % FIXME: turn off ambitus_engraver for the lute part (GrandStaff)!
    }
    \context {
        \Lyrics
            fontSize = #-1
            %minimumVerticalExtent = #'(-1.2 . 1.8)
            minimumVerticalExtent = #'(-.8 . 1.6)
                % 1st (negative) value is distance below, 2nd (positive) is dist above
                % default is: '(-1.2 . 2.4)
    }
}
\midi {
    \tempo 4 = 100
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
labelComp    = \markup \instrFix \instrFix \labelComp
shortComp    = \markup \instrFix \instrFix \shortComp



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Original English Lyrics
sopranoVerseIRepeatsI = \lyricmode {
    \set stanza = "1. "
    If my com -- plaints could pas -- sions __ move,
    Or make love see where -- in I suf -- fer wrong,

    \set stanza = "1. "
    O love, I live and __ die in thee,
    Thy grief in my deep sighs still speaks;

    \set stanza = "1. "
    Yet thou dost hope when I des -- pair,
    And when I hope thou mak’st me hope in vain.
}
sopranoVerseIRepeatsII = \lyricmode {
    My pas -- sions were e -- nough to __ prove
    That my des -- pairs had go -- vern’d me too long.

    Thy wounds do fresh -- ly __ bleed in me,
    My heart for thy un -- kind -- ness breaks;

    Thou say’st thou canst my harms re -- pair,
    Yet for re -- dress thou lett’st me still com -- plain.
}
sopranoVerseIIRepeatsI = \lyricmode {
    \set minimumVerticalExtent = #'(-.8 . 3)
    \set stanza = "2. "
    Can love be rich, and yet I __ want?
    Is love my Judge, and yet I am con -- demn’d?

    \set stanza = "2. "
    That I do love, it __ is thy power;
    That I de -- sire, it is thy worth;

    \set stanza = "2. "
    Die shall my hopes, but not my faith,
    That you, that of my fall, my hear -- ers be,
}
sopranoVerseIIRepeatsII = \lyricmode {
    Thou plen -- ty hast, yet me dost __ scant;
    Thou made a god, and yet thy pow’r con -- demn’d.

    If love doth make men’s __ lives too sour,
    Let me not love, nor live hence -- forth.

    May hear de -- spair, which tru -- ly saith:
    I was more true to Love than Love to me.
}

altoVerseIRepeatsI = \lyricmode {
    \set stanza = "1. "
    If my com -- plaints could pas -- sions __ move,
    Or make love see where -- in I suf -- fer wrong,

    \set stanza = "1. "
    O love, I live, __ I live and die in thee,
    Thy grief in my deep sighs, deep sighs still speaks;

    \set stanza = "1. "
    Yet thou dost hope, dost hope when I des -- pair,
    And when I hope thou mak’st, thou mak’st me hope in vain.
}
altoVerseIRepeatsII = \lyricmode {
    My pas -- sions were e -- nough to __ prove
    That my des -- pairs had go -- vern’d me too long.

    Thy wounds do fresh -- ly, fresh -- ly bleed in me,
    My heart for thy un -- kind un -- kind -- ness breaks;

    Thou say’st thou canst, thou canst my harms re -- pair,
    Yet for re -- dress thou lett’st, thou lett’st me still com -- plain.
}
altoVerseIIRepeatsI = \lyricmode {
    \set minimumVerticalExtent = #'(-.8 . 3)
    \set stanza = "2. "
    Can love be rich, and yet I __ want?
    Is love my Judge, and yet I am con -- demn’d?

    \set stanza = "2. "
    That I do love, __ do love, it is thy power;
    That I de -- sire, it is, it is thy worth;

    \set stanza = "2. "
    Die shall my hopes, my hopes, but not my faith,
    That you, that of my fall, my fall, my hear -- ers be,
}
altoVerseIIRepeatsII = \lyricmode {
    Thou plen -- ty hast, yet me dost __ scant;
    Thou made a god, and yet thy pow’r con -- demn’d.

    If love doth make __ men’s, make men’s lives too sour,
    Let me not love, nor live, nor live hence -- forth.

    May hear de -- spair, de -- spair, which tru -- ly saith:
    I was more true to Love, to Love than Love to me.
}

tenorVerseIRepeatsI = \lyricmode {
    \set stanza = "1. "
    If my com -- plaints could pas -- sions move, could pas -- sions move,
    Or make love see where -- in I suf -- fer wrong,

    \set stanza = "1. "
    O love, I live __ and die, I live and die in thee,
    Thy grief in __ my deep sighs, deep sighs still speaks;

    \set stanza = "1. "
    Yet thou dost hope when I des -- pair,
    And when I hope thou mak’st me hope in vain.
}
tenorVerseIRepeatsII = \lyricmode {
    My pas -- sions were e -- nough to prove, e -- nough to prove
    That my des -- pairs had go -- vern’d me too long.

    Thy wounds do fresh -- ly bleed, do fresh -- ly bleed in me,
    My heart for __ thy un -- kind un -- kind -- ness breaks;

    Thou say’st thou canst my harms re -- pair,
    Yet for re -- dress thou lett’st me still com -- plain.
}
tenorVerseIIRepeatsI = \lyricmode {
    \set minimumVerticalExtent = #'(-.8 . 3)
    \set stanza = "2. "
    Can love be rich, and yet I want, and yet I want?
    Is love my Judge, and yet I am con -- demn’d?

    \set stanza = "2. "
    That I do love, __ it is, do love, it is thy power;
    That I de -- sire, it is, it is thy worth;

    \set stanza = "2. "
    Die shall my hopes, but not my faith,
    That you, that of my fall, my hear -- ers be,
}
tenorVerseIIRepeatsII = \lyricmode {
    Thou plen -- ty hast, yet me dost scant, yet me dost scant;
    Thou made a god, and yet thy pow’r con -- demn’d.

    If love doth make __ men’s lives, doth make men’s lives too sour,
    Let me not __ love nor live, nor live hence -- forth.

    May hear de -- spair, which tru -- ly saith:
    I was more true to Love than Love to me.
}

bassVerseIRepeatsI = \lyricmode {
    \set stanza = "1. "
    If my com -- plaints could pas -- sions move,
    Or __ make love see __ where -- in I suf -- fer wrong,

    \set stanza = "1. "
    O love, I live and die in thee,
    Thy grief,
        \markup \italic thy
        \markup \italic grief
        in my deep sighs still speaks;

    \set stanza = "1. "
    And when I hope thou mak’st,
        \markup \italic thou
        \markup \italic mak’st
        me hope in vain.
}
bassVerseIRepeatsII = \lyricmode {
    My pas -- sions were e -- nough to prove
    That __ my des -- pairs __ had go -- vern’d me too long.

    Thy wounds do fresh -- ly bleed in me,
    My heart,
        \markup \italic my
        \markup \italic heart
        for thy un -- kind -- ness breaks;

    Yet for re -- dress thou lett’st,
        \markup \italic thou
        \markup \italic lett’st
        me still com -- plain.
}

bassVerseIIRepeatsI = \lyricmode {
    \set minimumVerticalExtent = #'(-.8 . 3)
    \set stanza = "2. "
    Can love be rich, and yet I want?
    Is __ love my Judge, __ and yet I am con -- demn’d?

    \set stanza = "2. "
    That I do love, it is thy power;
    That I,
        \markup \italic That
        \markup \italic I
        de -- sire, it is thy worth;

    \set stanza = "2. "
    That you, that of my fall,
        \markup \italic my
        \markup \italic fall,
        my hear -- ers be,
}
bassVerseIIRepeatsII = \lyricmode {
    Thou plen -- ty hast, yet me dost scant;
    Thou __ made a god, __ and yet thy pow’r con -- demn’d.

    If love doth make men’s lives too sour,
    Let me,
        \markup \italic Let
        \markup \italic me
        not love, nor live hence -- forth.

    I was more true to Love,
        \markup \italic to
        \markup \italic Love
        than Love to me.
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
        \key bes\major
        \time 3/2

        \upstep
        \repeat volta 2 {
            g'4 bes' ees''  |
            d''2 c''4 bes'4. a'8( g'4 )  |
            fis'2 r4 g' a' c''  |
            bes'4. bes'8 a'4 g' g' fis'  |
            %% 5
            g'2.
        }
      \break
        \repeat volta 2 {
            a'4 bes' c''  |
            %% 10
            d''2 c''8[ bes' ] bes'2 a'4  |
            bes'2 r4 d'' c'' a'  |
            bes'2. a'4 g'4. g'8  |
            fis'2.
        }
      \break
        \repeat volta 2 {
            d''4 f'' ees''  |
            d''2 ees''4 d''2 c''4  |
            d''2 r4 d'' c'' d''  |
            %% 20
            bes'4. bes'8 a'4 g' g' fis'  |
            g'2.
        }
    } % Voice
    \addlyrics { \sopranoVerseIRepeatsI }
    \addlyrics { \sopranoVerseIRepeatsII }
    \addlyrics { \sopranoVerseIIRepeatsI }
    \addlyrics { \sopranoVerseIIRepeatsII }
} % soprano


alto = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelAlto
        \set Staff.instr          = \shortAlto

        \clef treble
        \key bes\major
        \time 3/2

        \upstep
        \repeat volta 2 {
            d'4 g' g'  |
            g'2. g'4 f' bes8[ c' ]  |
            d'2. ees'4 c' a  |
            d'4 g' f' c' d'4. c'8  |
            %% 5
            b2.
        }
        \repeat volta 2 {
            f'4 d' ees'  |
            %% 10
            d'8.[ ees'16 f'8 ] d' g'4 ees' f'4. ees'8  |
            d'2. r8 d' e'( g'4 ) fis'8  |
            g'4. f'8 ees' d' d'2 c'4  |
            d'2.
        }
        \repeat volta 2 {
            f'4. bes'4 a'8  |
            bes'4. a'8 g'4 fis' g'4. g'8  |
            fis'2. r8 bes' a'4. a'8  |
            %% 20
            g'4. g'8 f' d' bes c' d'4. c'8  |
            b2.
        }
    } % Voice
    \addlyrics { \altoVerseIRepeatsI }
    \addlyrics { \altoVerseIRepeatsII }
    \addlyrics { \altoVerseIIRepeatsI }
    \addlyrics { \altoVerseIIRepeatsII }
} % alto


tenor = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelTenor
        \set Staff.instr          = \shortTenor

        \clef "treble_8"
        \key bes\major
        \time 3/2

        \upstep
        \repeat volta 2 {
            bes4 d' c'  |
            bes8 g bes4 ees' d' d'8 d'4 g8  |
            a2 r8 g g2 fis4  |
            g4 d' d' g a4. a8  |
            %% 5
            g2.
        }
        \repeat volta 2 {
            f4. bes4 a8  |
            %% 10
            bes8.[ c'16 d'8 ] f' ees' d' c' bes c'4. c'8  |
            bes2. g4 c' d'~ |
            d'8 c'[ bes ] a g4 a bes a8[ g ]  |
            a2.
        }
        \repeat volta 2 {
            bes4 d' c'  |
            bes2 c'4 d' ees'2  |
            d'2. f'4 f'4. f'8  |
            %% 20
            d'2 r8 f g a bes[ g ] a4  |
            g2.
        }
    } % Voice
    \addlyrics { \tenorVerseIRepeatsI }
    \addlyrics { \tenorVerseIRepeatsII }
    \addlyrics { \tenorVerseIIRepeatsI }
    \addlyrics { \tenorVerseIIRepeatsII }
} % tenor


bass = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelBass
        \set Staff.instr          = \shortBass

        \clef bass
        \key bes\major
        \time 3/2

        \upstep
        \repeat volta 2 {
            g,4 g, g,  |
            g,2. g,4 bes, ees  |
            d4. c8( b,4 ) c a,2  |
            g,8.[ a,16 bes,8 ] c d4 ees d d  |
            %% 5
            g,2.
        }
        \repeat volta 2 {
            d4 d c  |
            %% 10
            bes,2 ees4 g f2  |
            bes,2. bes,4 a, d  |
            g,4 g4. g8 f4 ees4. ees8  |
            d2.
        }
        \repeat volta 2 {
            r4 r2  |
            R2*3  |
            r2 r4 bes, f d  |
            %% 20
            g8 g, bes, c d4 ees d d  |
            g,2.
        }
    } % Voice
    \addlyrics { \bassVerseIRepeatsI }
    \addlyrics { \bassVerseIRepeatsII }
    \addlyrics { \bassVerseIIRepeatsI }
    \addlyrics { \bassVerseIIRepeatsII }
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
%%  Accompaniment Notes                                                      %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% FIXME: accompaniment parts
compTreble = \new Staff {
    \set Staff.autoBeaming     = ##f
    \set Staff.midiInstrument  = \midiCompInstrument
    \set GrandStaff.instrument = \labelComp
    \set GrandStaff.instr      = \shortComp

    \clef treble
    \key bes\major
    \time 3/2

    \new Voice {
        \upstep
        \repeat volta 2 { % 1st
            < d' bes >2 c'4 |
            d'2 es'4 d'8[ g' f' d' bes c' ]  |
            < d' a >4 < d' a > r8 a8 < es' c' >4 c' a  |
            < d' bes g > < g' d' bes > f' c' r8 < d' a >4 c'8  |
            r8 < g' d' b > g4 < g' d' b >
        } % repeat (1st)
        \repeat volta 2 { % 2nd
            <<
                { f'4. bes'4 a'8 | } \\
                { a4 d' es' | }
            >> |
            <<
                { bes'4. a'8 g'4 es'4. d'16[ es' ] f'8[ es' ] | } \\
                { < d' b >8.[ c'16 d'8 f' es' d' ] }
            >> |
            r8 < d' bes >8 f4 < d' bes > r8 d' <<
                { e' g'4 fis'8 | } \\
                { c'4 d' | }
            >> |
            g'4. f'8 es'[ d' ] d'4 bes8[ c'16 bes ] c'4  |
            r8 < d' a > fis4 < d' a >
        } % repeat (2nd)
        \repeat volta 2 { % 3rd
            f'4. bes'4 a'8  |
            bes'4. a'8 g'4 fis' g'8[ bes' a' g' ]  |
            <<
                { a'2. d''8\rest bes' a'4. a'8  | } \\
                { fis'2. d'4 f'2  | }
            >> |
            < g' d' bes >2 f'8[ d' bes c' ] d'4 d'8.[ c'16 ]  |
            r8 < g' d' b > g4 < g' d' b >
        } % repeat (3rd)
    } % Voice
} % compTreble


compBass = \new Staff {
    \set Staff.autoBeaming    = ##f
    \set Staff.midiInstrument = \midiCompInstrument

    \clef bass
    \key bes\major
    \time 3/2

    \new Voice {
        \upstep
        \repeat volta 2 { % 1st
            g,4 g2  |
            <<
                { g4 bes } \\
                { g,2. g,4 bes, < g es > | }
            >> |
            d4. c8 b,4 <<
                { g2 fis4 | } \\
                { c4 a,2 | }
            >> |
            g,8.[ a,16 ] bes,8 [ c ] < a d >4 < g es > <<
                { a8\rest g fis4 | } \\
                { d2  | }
            >> |
            g,4. g,4.
        } % repeat (1st)
        \repeat volta 2 { % 2nd
            d2 c4 |
            bes,2 es4 <<
                { c'8[ bes ] c'2 | } \\
                { g4 f2 | }
            >> |
            bes,4. bes, < g bes, >4 a, d  |
            <<
                { g8[ c' bes a ] bes4 a g4. g8  | } \\
                { g,2 g4 f es2  | }
            >> |
            d4. d
        } % repeat (2nd)
        \repeat volta 2 { % 3rd
            < d' bes >4 d' c'  |
            < d' bes >2 < es' c' >4 d' es'2  |
            d'2. < bes bes, >4 < c' f > d  |
            g8[ g, bes, c ] < a d >4 <<
                { g8[ a bes g ] a4  | } \\
                { es4 d d  | }
            >> |
            g,4. g,
        } % repeat (3rd)
    } % Voice
} % compBass


comp = {
    \new GrandStaff <<
       \compTreble
       \compBass
    >>
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Score                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\book {
    \score {                             << \choir \comp >>          } % notes
    \score { \applymusic #unfold-repeats << \choir \comp >> \midi {} } % all
    \score { \applymusic #unfold-repeats    \soprano        \midi {} } % S
    \score { \applymusic #unfold-repeats    \alto           \midi {} } % A
    \score { \applymusic #unfold-repeats    \tenor          \midi {} } % T
    \score { \applymusic #unfold-repeats    \bass           \midi {} } % B
    \score { \applymusic #unfold-repeats    \comp           \midi {} } % comp
}

%[[eof]]
