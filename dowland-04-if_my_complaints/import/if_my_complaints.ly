\version "2.6.0"
\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "IIII. If My Complaints."
    subtitle = \markup \italic { (First Booke of Songes or Ayres) }
    composer = "John Dowland (1562–1638)"
    copyright = "Zrajm C Akfohg, March 2006"
    tagline = ""
}
#(set-global-staff-size 16)
#(set-default-paper-size "a4" 'landscape)
\paper {
    betweensystempadding = #1
    %betweensystemspace = 4\mm
    raggedbottom = ##t
    printpagenumber = ##f  % turn on/off page number printing
}

soprano   = \markup Cantus
alto      = \markup Altus
tenor     = \markup Tenor
basso     = \markup Bassus
midiInstr = #"drawbar organ"



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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Original English Lyrics
sopranoVerseOneFirstRepeats = \lyricmode {
    \set stanza = "1. "
    If my com -- plaints could pas -- sions move,
    Or make love see where -- in I suf -- fer wrong,

    O love, I live and die in thee,
    Thy grief in my deep sighs still speaks;

    Yet thou dost hope when I des -- pair,
    And when I hope thou mak'st me hope in vain.
}
sopranoVerseOneSecondRepeats = \lyricmode {
    My pas -- sions were e -- nough to prove
    That my des -- pairs had go -- vern'd me too long.

    Thy wounds do fresh -- ly bleed in me,
    My heart for thy un -- kind -- ness breaks;

    Thou say'st thou canst my harms re -- pair,
    Yet for re -- dress thou lett'st me still com -- plain.
}
sopranoVerseTwoFirstRepeats = \lyricmode {
    \set stanza = "2. "
    If my com -- plaints could pas -- sions move,
    Or make love see where -- in I suf -- fer wrong,

    O love, I live and die in thee,
    Thy grief in my deep sighs still speaks;

    Yet thou dost hope when I des -- pair,
    And when I hope thou mak'st me hope in vain.
}
sopranoVerseTwoSecondRepeats = \lyricmode {
    My pas -- sions were e -- nough to prove
    That my des -- pairs had go -- vern'd me too long.

    Thy wounds do fresh -- ly bleed in me,
    My heart for thy un -- kind -- ness breaks;

    Thou say'st thou canst my harms re -- pair,
    Yet for re -- dress thou lett'st me still com -- plain.
}

altoVerseOneFirstRepeats = \lyricmode {
    \set stanza = "1. "
    If my com -- plaints could pas -- sions move,
    Or make love see where -- in I suf -- fer wrong,

    O love, I live, I live and die in thee,
    Thy grief in my deep sighs, deep sighs still speaks;

    Yet thou dost hope, dost hope when I des -- pair,
    And when I hope thou mak'st, thou mak'st me hope in vain.
}
altoVerseOneSecondRepeats = \lyricmode {
    My pas -- sions were e -- nough to prove
    That my des -- pairs had go -- vern'd me too long.

    Thy wounds do fresh -- ly, fresh -- ly bleed in me,
    My heart for thy un -- kind un -- kind -- ness breaks;

    Thou say'st thou canst, thou canst my harms re -- pair,
    Yet for re -- dress thou lett'st, thou lett'st me still com -- plain.
}
altoVerseTwoFirstRepeats = \lyricmode {
    \set stanza = "2. "
    If my com -- plaints could pas -- sions move,
    Or make love see where -- in I suf -- fer wrong,

    O love, I live, I live and die in thee,
    Thy grief in my deep sighs, deep sighs still speaks;

    Yet thou dost hope, dost hope when I des -- pair,
    And when I hope thou mak'st, thou mak'st me hope in vain.
}
altoVerseTwoSecondRepeats = \lyricmode {
    My pas -- sions were e -- nough to prove
    That my des -- pairs had go -- vern'd me too long.

    Thy wounds do fresh -- ly, fresh -- ly bleed in me,
    My heart for thy un -- kind un -- kind -- ness breaks;

    Thou say'st thou canst, thou canst my harms re -- pair,
    Yet for re -- dress thou lett'st, thou lett'st me still com -- plain.
}

tenorVerseOneFirstRepeats = \lyricmode {
    \set stanza = "1. "
    If my com -- plaints could pas -- sions move, could pas -- sions move,
    Or make love see where -- in I suf -- fer wrong,

    O love, I live and die, I live and die in thee,
    Thy grief in my deep sighs, deep sighs still speaks;

    Yet thou dost hope when I des -- pair,
    And when I hope thou mak'st me hope in vain.
}
tenorVerseOneSecondRepeats = \lyricmode {
    My pas -- sions were e -- nough to prove, e -- nough to prove
    That my des -- pairs had go -- vern'd me too long.

    Thy wounds do fresh -- ly bleed, do fresh -- ly bleed in me,
    My heart for thy un -- kind un -- kind -- ness breaks;

    Thou say'st thou canst my harms re -- pair,
    Yet for re -- dress thou lett'st me still com -- plain.
}
tenorVerseTwoFirstRepeats = \lyricmode {
    \set stanza = "2. "
    If my com -- plaints could pas -- sions move, could pas -- sions move,
    Or make love see where -- in I suf -- fer wrong,

    O love, I live and die, I live and die in thee,
    Thy grief in my deep sighs, deep sighs still speaks;

    Yet thou dost hope when I des -- pair,
    And when I hope thou mak'st me hope in vain.
}
tenorVerseTwoSecondRepeats = \lyricmode {
    My pas -- sions were e -- nough to prove, e -- nough to prove
    That my des -- pairs had go -- vern'd me too long.

    Thy wounds do fresh -- ly bleed, do fresh -- ly bleed in me,
    My heart for thy un -- kind un -- kind -- ness breaks;

    Thou say'st thou canst my harms re -- pair,
    Yet for re -- dress thou lett'st me still com -- plain.
}

bassoVerseOneFirstRepeats = \lyricmode {
    \set stanza = "1. "
    If my com -- plaints could pas -- sions move,
    Or __ make love see __ where -- in I suf -- fer wrong,

    O love, I live and die in thee,
    Thy grief, thy grief in my deep sighs still speaks;

    And when I hope thou mak'st, thou mak'st me hope in vain.
}
bassoVerseOneSecondRepeats = \lyricmode {
    My pas -- sions were e -- nough to prove
    That __ my des -- pairs __ had go -- vern'd me too long.

    Thy wounds do fresh -- ly bleed in me,
    My heart, my heart for thy un -- kind -- ness breaks;

    Yet for re -- dress thou lett'st, thou lett'st me still com -- plain.
}

bassoVerseTwoFirstRepeats = \lyricmode {
    \set stanza = "2. "
    %If  my   com -- plaints could pas -- sions move,
    Can love be     rich,   and   yet    I     want?

    %Or  make   love  see  where -- in   I  suf -- fer wrong,
    Thou plen -- ty  hast,  yet FIXME me dost   FIXME  scant;


    That I do love, it is thy power;
    If love, if love, doth make men's lives too sour,

    That you, that of my fall, my fall may hear -- ers be,
}
bassoVerseTwoSecondRepeats = \lyricmode {
    Is love my Judge, and yet I am con -- demn'd?
    Thou made a god, and yet thy pow'r con -- demn'd.

    That I de -- sire, it is thy worth;
    Let me, let me, not love, nor live hence -- forth.

    I was more true to Love, to Love, than Love to me.
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Notes                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


sopranoStaff = \new Staff {
    \new Voice {
        \set Staff.midiInstrument = \midiInstr
        \set Staff.instrument     = \markup \instrFix \soprano
        \set Staff.instr          = \markup \instrFix C
        \set Staff.autoBeaming    = ##f

        \clef treble
        \key bes\major
        \time 6/4

        \repeat volta 2 {
            \partial 4*3 g'4 bes' ees''  |
            d''2 c''4 bes'4. a'8( g'4 )  |
            fis'2 r4 g' a' c''  |
            bes'4. bes'8 a'4 g' g' fis'  |
            %% 5
            g'2.
        }
        \repeat volta 2 {
            \partial 4*3 a'4 bes' c''  |
            %% 10
            d''2 c''8[ bes' ] bes'2 a'4  |
            bes'2 r4 d'' c'' a'  |
            bes'2. a'4 g'4. g'8  |
            fis'2.
        }
        \repeat volta 2 {
            \partial 4*3 d''4 f'' ees''  |
            d''2 ees''4 d''2 c''4  |
            d''2 r4 d'' c'' d''  |
            %% 20
            bes'4. bes'8 a'4 g' g' fis'  |
            g'2.
        }
    } % Voice
    \addlyrics { \sopranoVerseOneFirstRepeats }
    \addlyrics { \sopranoVerseOneSecondRepeats }
    \addlyrics { \sopranoVerseTwoFirstRepeats }
    \addlyrics { \sopranoVerseTwoSecondRepeats }
} % sopranoStaff


altoStaff = \new Staff {
    \new Voice {
        \set Staff.midiInstrument = \midiInstr
        \set Staff.instrument = \markup\instrFix \alto
        \set Staff.instr = \markup\instrFix A
        \set Staff.autoBeaming = ##f

        \clef treble
        \key bes\major
        \time 6/4

        \repeat volta 2 {
            \partial 4*3 d'4 g' g'  |
            g'2. g'4 f' bes8[ c' ]  |
            d'2. ees'4 c' a  |
            d'4 g' f' c' d'4. c'8  |
            %% 5
            b2. 
        }
        \repeat volta 2 {
            \partial 4*3 f'4 d' ees'  |
            %% 10
            d'8.[ ees'16 f'8 ] d' g'4 ees' f'4. ees'8  |
            d'2. r8 d' e'( g'4 ) fis'8  |
            g'4. f'8 ees' d' d'2 c'4  |
            d'2. 
        }
        \repeat volta 2 {
            \partial 4*3 f'4. bes'4 a'8  |
            bes'4. a'8 g'4 fis' g'4. g'8  |
            fis'2. r8 bes' a'4. a'8  |
            %% 20
            g'4. g'8 f' d' bes c' d'4. c'8  |
            b2. 
        }
    } % Voice
    \addlyrics { \altoVerseOneFirstRepeats }
    \addlyrics { \altoVerseOneSecondRepeats }
    \addlyrics { \altoVerseTwoFirstRepeats }
    \addlyrics { \altoVerseTwoSecondRepeats }
} % altoStaff


tenorStaff = \new Staff {
    \new Voice {
        \set Staff.midiInstrument = \midiInstr
        \set Staff.instrument = \markup \instrFix \tenor
        \set Staff.instr = \markup \instrFix T
        \set Staff.autoBeaming = ##f

        \clef "treble_8"
        \key bes\major
        \time 6/4

        \repeat volta 2 {
            \partial 4*3 bes4 d' c'  |
            bes8 g bes4 ees' d' d'8 d'4 g8  |
            a2 r8 g g2 fis4  |
            g4 d' d' g a4. a8  |
            %% 5
            g2. 
        }
        \repeat volta 2 {
            \partial 4*3 f4. bes4 a8  |
            %% 10
            bes8.[ c'16 d'8 ] f' ees' d' c' bes c'4. c'8  |
            bes2. g4 c' d'~ |
            d'8 c'[ bes ] a g4 a bes a8[ g ]  |
            a2.
        }
        \repeat volta 2 {
            \partial 4*3 bes4 d' c'  |
            bes2 c'4 d' ees'2  |
            d'2. f'4 f'4. f'8  |
            %% 20
            d'2 r8 f g a bes[ g ] a4  |
            g2.
        }
    } % Voice
    \addlyrics { \tenorVerseOneFirstRepeats }
    \addlyrics { \tenorVerseOneSecondRepeats }
    \addlyrics { \tenorVerseTwoFirstRepeats }
    \addlyrics { \tenorVerseTwoSecondRepeats }
} % tenorStaff


bassoStaff = \new Staff {
    \new Voice {
        \set Staff.midiInstrument = \midiInstr
        \set Staff.instrument = \markup \instrFix \basso
        \set Staff.instr = \markup \instrFix B
        \set Staff.autoBeaming = ##f

        \clef bass
        \key bes\major
        \time 6/4

        \repeat volta 2 {
            \partial 4*3 g,4 g, g,  |
            g,2. g,4 bes, ees  |
            d4. c8( b,4 ) c a,2  |
            g,8.[ a,16 bes,8 ] c d4 ees d d  |
            %% 5
            g,2. 
        }
      \break
        \repeat volta 2 {
            \partial 4*3 d4 d c  |
            %% 10
            bes,2 ees4 g f2  |
            bes,2. bes,4 a, d  |
            g,4 g4. g8 f4 ees4. ees8  |
            d2.
        }
        \repeat volta 2 {
            \partial 4*3 r4 r2  |
            R2*3  |
            r2 r4 bes, f d  |
            %% 20
            g8 g, bes, c d4 ees d d  |
            g,2.
        }
    } % Voice
    \addlyrics { \bassoVerseOneFirstRepeats }
    \addlyrics { \bassoVerseOneSecondRepeats }
    \addlyrics { \bassoVerseTwoFirstRepeats }
    \addlyrics { \bassoVerseTwoSecondRepeats }
} % bassoStaff


luteTreble = {

}
luteBass = {

}

%luteStaff = \new Staff {
%    \new pianoStaff <<
%        \set Staff.midiInstrument = \midiInstr
%        \set Staff.instrument = \markup \instrFix \lute
%        \set Staff.instr = \markup \instrFix B
%        \set Staff.autoBeaming = ##f
%        \new Staff {
%            \clef treble
%        }
%        \new Staff {
%            \clef bass
%        }
%    >> % pianoStaff
%} % luteStaff



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Score                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\score {
    <<
        \new ChoirStaff <<
            \sopranoStaff
            \altoStaff
            \tenorStaff
            \bassoStaff
        >> % ChoirStaff

        % BELOW is unfinished lute part.
        %\new PianoStaff <<
        %    \new Staff {
        %        \clef treble
        %        \key bes\major
        %        \time 6/4
        %
        %        <<d'2 bes>> c'4  |
        %        d'2 es'4 d'8[g' f' d' bes c']  |
        %        <<d'4 a>> <<d' a>> r8 g8 <<e'4 c'>> c' a  |
        %        %\luteTreble
        %    }
        %    \new Staff {
        %        \clef bass
        %        \key bes\major
        %        \time 6/4
        %
        %        g4 g2  |
        %        <<{\stemUp g4 bes} \stemDown g,2.>> \stemNeutral g,4 bes, <<g es>>  |
        %        d4. c8 b,4 <<{g2 fis4} {c4 a,2}>>  |
        %        %\luteBass
        %    }
        %>>
    >>

    \layout {
        papersize = "a4"
        \context {
            \Staff \consists Ambitus_engraver
        }
    }
    \midi { \tempo 4 = 50 }

} % score

%[[eof]]
