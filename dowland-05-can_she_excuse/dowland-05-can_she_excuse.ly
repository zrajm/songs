\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    title = "V. Can She Excuse My Wrongs?"
    composer = \markup {
        John Dowland, %(1562–1638)
        \italic { First Booke of Songes or Ayres, }
        1597
    }
    tagline = \markup \column { \center-align {
        \line { Zrajm C Akfohg, April 2006 }
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
labelComp           = \markup Lute
shortComp           = \markup L

myStaffSize = #18
#(set-global-staff-size myStaffSize)
\paper {
    #(set-paper-size "a4" 'landscape)  % A4 = 210mm × 297.9mm
    %raggedbottom   = ##t
    raggedlast     = ##t
    printpagenumber = ##f  % turn on/off page number printing

    topmargin     = 12.5\mm % (default: `5\mm')
    %bottommargin = 6\mm (default: `6\mm')
    %leftmargin   = #f % (Que?)
    %%headsep       = 0\mm  %% no effect? (default: `4\mm')
    %%%footsep      = 4\mm (default: `4\mm')

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
    %%betweensystemspace  = 0.01\mm
    %%betweensystempadding = 0.01\mm
    %%    % between systems, and topmost system/title (overlapping with
    %%    % `aftertitlespace', I think)
}
\layout {
    papersize = "a4"
    \context {
        \GrandStaff
            \consists Instrument_name_engraver
                % FIXME: turn off ambitus_engraver for the lute part (GrandStaff)!
    }
    \context {
        \Staff
            \consists Ambitus_engraver
            %minimumVerticalExtent = #'(-3 . 3) % put lyrics closer to staff
                % default is: #'(-4 . 4)
    }
    \context {
        \Lyrics
            fontSize = #-1
            %minimumVerticalExtent = #'(-1.2 . 1.8)
            minimumVerticalExtent = #'(-.8 . 1.6)
                % 1st (negative) value is distance below, 2nd (positive) is dist above
                % default is: '(-1.2 . 2.4)
            \override LyricExtender #'minimum-length = #0
                % allow extender line (signifies melismata) to become zero in length

            \override LyricHyphen  #'minimum-length = #0
                % allow hyphens to become zero in length
    }
}
\midi {
    \tempo 4 = 52
    %\tempo 4 = 70
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
    Can she ex -- cuse my wrongs with Vir -- tue’s cloak?
    Shall I call her good when she proves un -- kind?

    \set stanza = "1. "
    No, no; where sha -- dows do for bo -- dies stand,
    That may’st be ab -- us’d if thy sight be dim.

    \set stanza = "1. "
    Wilt thou be thus ab -- us -- ed still,
    See -- ing that she will right thee ne -- ver?
    If thou cans’t not o’er -- come her will,
    Thy love will be thus fruit -- less e -- ver.
}
sopranoVerseIRepeatsII = \lyricmode {
    Are those clear fires which va -- nish in -- to smoke?
    Must I praise the leaves where no fruit I find?

    Cold love is like to words writ -- ten on sand,
    Or to bub -- bles which on the wa -- ter swim.
}
sopranoVerseIIRepeatsI = \lyricmode {
    \set minimumVerticalExtent = #'(-.8 . 3)
    \set stanza = "2. "
    %Can  she  ex --  cuse   my    wrongs  with   Vir --  tue’s  cloak?
    Was   I    so     base,  that  I       might  not     a --   spire

    %Shall  I   call   her   good  when   she  proves  un --  kind?
    Un --   to  those  high  joys  which  she  holds   from   me?

    \set stanza = "2. "
    %No,  no;  where  sha --  dows  do    for    bo --   dies  stand,
    If    she  will   yield   to    that  which  Rea --  son   is,

    %That  may’st  be      ab --  us’d  if    thy   sight   be  dim.
    It     is      Rea --  son’s  will  that  Love  should  be  just.

    \set stanza = "2. "
    %Wilt   thou  be  thus     ab --  us --  ed  still,
    Bet --  ter   a   thou --  sand   times  to  die,

    %See --  ing  that  she   will  right  thee    ne --   ver?
    Than     for  to    live  thus  still  tor --  ment -- ed:

    %If    thou  cans’t  not     o’er --  come  her  will,
    Dear,  but   re --   mem --  ber      it    was  I

    %Thy  love  will  be    thus  fruit --  less    e --    ver.
    Who   for   thy   sake  did   die       con --  tent -- ed.
}
sopranoVerseIIRepeatsII = \lyricmode {
    %Are  those  clear  fires  which  va --  nish  in --  to     smoke?
    As    they   are    high,  so     high   is    my     de --  sire:

    %Must  I    praise  the    leaves  where  no       fruit    I   find?
    If     she  this    de --  ny,     what   can      grant -- ed  be?


    %Cold  love  is  like    to  words  writ --  ten      on    sand,
    Dear,  make  me  hap --  py  still  by       gran --  ting  this,

    %Or  to   bub --  bles   which  on  the   wa --  ter  swim.
    Or   cut  off     de --  lays   if  that  I      die  must.
}


altoVerseIRepeatsI = \lyricmode {
    \set stanza = "1. "
    Can she ex -- cuse my wrongs with Vir -- tue’s cloak?
    Shall I call her good when she proves un -- kind?

    % 2nd repeat
    \set stanza = "1. "
    No, no; where __ sha -- dows do, where sha -- dows do for bo -- dies stand,
    That may’st be ab -- us’d, ab -- us’d if thy sight be dim.

    % 3rd repeat
    \set stanza = "1. "
    Wilt thou be thus ab -- us -- ed still, __
    See -- ing that she will right thee ne -- ver?
    If thou cans’t not o’er -- come her will,
    Thy love will be thus fruit -- less e -- ver.
}
altoVerseIRepeatsII = \lyricmode {
    Are those clear fires which va -- nish in -- to smoke?
    Must I praise the leaves where no fruit I find?

    Cold love is __ like to words, is like to words writ -- ten on sand,
    Or to bub -- bles which on the wa -- ter, wa -- ter swim.
}

tenorVerseIRepeatsI = \lyricmode {
    \set stanza = "1. "
    Can she ex -- cuse my wrongs with Vir -- tue’s cloak?
    Shall I call her good when she proves un -- kind?

    \set stanza = "1. "
    No, __ no, no; where sha -- dows do for bo -- dies, for bo -- dies stand,
    That may’st be ab -- us’d if thy __ sight, thy sight be __ dim.

    \set stanza = "1. "
    Wilt thou be thus ab -- us -- ed still,
    See -- ing that she will right thee ne -- ver?
    If thou cans’t not o’er -- come her will,
    Thy love will be thus fruit -- less e -- ver.
}
tenorVerseIRepeatsII = \lyricmode {
    Are those clear __ fires which va -- nish in -- to smoke?
    Must I praise the leaves where no fruit I find?

    Cold __ love, love is like to words, to words __ \skip 8 writ -- ten on sand,
    Or to bub -- bles which on the __ wa -- ter, wa -- ter __ swim.
}

bassVerseIRepeatsI = \lyricmode {
    \set stanza = "1. "
    Can she ex -- cuse, __ ex -- cuse my wrongs with Vir -- tue’s cloak?
    Shall I call her good when she proves un -- kind?

    \set stanza = "1. "
    No, no; __ where sha -- dows do for bo -- dies __ stand,
    That may’st be ab -- us’d if thy sight be dim.

    \set stanza = "1. "
    Wilt thou be thus ab -- us -- ed still,
    See -- ing that she will right thee ne -- ver?
    If thou cans’t not o’er -- come her will,
    Thy love will be thus fruit -- less e -- ver.
}
bassVerseIRepeatsII = \lyricmode {
    Are those clear fires, __ clear fires which va -- nish in -- to smoke?
    Must I praise the leaves where no fruit I find?

    Cold love __ is like to words writ -- ten on __ sand,
    Or to bub -- bles which on the wa -- ter swim.
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
        \time 3/2

        \upstep
        \repeat volta 2 {
            d'4 a' d''  |
            c''4. b'8 a'4 a' g' f'  |
            e'2. c''4 a'8 bes'4 g'8  |
            a'2 f'4 g' e' e'  |
            d'2.
        }
      \break
        \repeat volta 2 {
            a'4 a' a'  |
            a'4 a'8 a'4 b'8 c''2 bes'4  |
            a'2 r4 c'' a'8 bes'4 g'8  |
            a'2 bes'4 a' d'' d''  |
            cis''2.
        }
      \break
        \repeat volta 2 {
            a'8. a'16 a'8 a'4 a'8  |
            a'4 a'8 a'4. b'8. b'16 b'8 b'4 b'8  |
            b'4 b'8 b'4 b'8 a'4 a'8 a' a' a'  |
            a'4 a' a'8 g' fis'8. g'16 a'8 b' g' a'  |
            fis'2 d'4
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
        \time 3/2

        \upstep
        \repeat volta 2 {
            f'4 f'4. g'8  |
            a'4. g'8 f'4 f' e' d'  |
            cis'2. e'4 f'8 g'4 e'8  |
            f'4. e'8 d'4 d'2 cis'4  |
            d'2.
        }
        \repeat volta 2 {
            e'4 cis'! d'8[ e' ]  |
            f'4 e'8 d'4 d'8 e'8. f'16 g'8 a' g'8. f'16  |
            e'2 r4 e' f'8 g'4 e'8  |
            f'4. a'8 g'4. f'4 d'8 f'8 g'8  |
            a'2.
        }
        \repeat volta 2 {
            a8. b16 c'8 d'4 c'8  |
            f'4 e'8 d'4( c'8 ) b8. c'16 d'8 e'4 d'8  |
            g'4 f'8 e'4 d'8 cis'8. d'16 e'4 f'8 g'  |
            e'8. g'16 f'8 d' cis'8. cis'16 d'4 a8 d'4 cis'!8  |
            d'2 d'4
        }
    } % Voice
    \addlyrics { \altoVerseIRepeatsI }
    \addlyrics { \altoVerseIRepeatsII }
    %\addlyrics { \altoVerseIIRepeatsI }
    %\addlyrics { \altoVerseIIRepeatsII }
} % alto


tenor = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelTenor
        \set Staff.instr          = \shortTenor

        \clef "treble_8"
        \time 3/2

        \upstep
        \repeat volta 2 {
            a4 d'8. e'16( f'4 )  |
            f'4. d'8 c'4 c' c' a  |
            a2. a4 a8 d'4 c'8  |
            c'2 bes4 bes a4. g8  |
            fis2.
        }
        \repeat volta 2 {
            cis'8.[ d'16 ] e'4 d'8 cis'  |
            d'4 a8 f4 f8 g8.[ f16 ] e8 f  d d'  |
            cis'2 r4 a a8 d'4 c'8  |
            c'4. f'8 e'[ d' ] cis'4 d'8 f'4 e'16[ d' ]  |
            e'2.
        }
        \repeat volta 2 {
            r4 r8 a8. b16 c'8  |
            d'4 c'8 f'4 e'8 d'4. b8. c'16 d'8  |
            e'4 d'8 g'4 f'8 e'8. d'16 cis'8. cis'16 d'16 d'16 e'8  |
            cis'8 cis' d' f' e'4 r8 d'8. cis'16 b8 e' e'  |
            a4 a2
        }
    } % Voice
    \addlyrics { \tenorVerseIRepeatsI }
    \addlyrics { \tenorVerseIRepeatsII }
} % tenor


bass = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelBass
        \set Staff.instr          = \shortBass

        \clef bass
        \time 3/2

        \upstep
        \repeat volta 2 {
            d4 d4. e8  |
            f( f,4 ) g,8 a, f, a, b, c4 d  |
            a,2. a,4 d8 g,4 c8  |
            f,2 bes,4 g, a, a,  |
            d2.
        }
        \repeat volta 2 {
            a4. g8[ f ] e  |
            d4 cis8 d4 d8 c4. f,8( g,4 )  |
            a,2 r4 a,4 d8 g,4 c8  |
            f,2 g,4 a, bes,4. bes,8  |
            a,2.
        }
        \repeat volta 2 {
            f,8. f,16 f,8 f,4 f,8  |
            f,4 f,8 f,4. g,8. g,16 g,8 g,4 g,8  |
            g,4 g,8 g,4 g,8 a,8. a,16 a,8 a, a,4  |
            a,4 a, a,8 a,8 d8. e16 fis8 g e e  |
            d4 d2
        }
    } % Voice
    \addlyrics { \bassVerseIRepeatsI }
    \addlyrics { \bassVerseIRepeatsII }
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


compTreble = \new Staff {
    \set Staff.autoBeaming     = ##f
    \set Staff.midiInstrument  = \midiCompInstrument
    \set GrandStaff.instrument = \labelComp
    \set GrandStaff.instr      = \shortComp

    \clef treble
    \time 3/2

    \new Voice {
        \upstep
        \repeat volta 2 {
            f'4 f'8[ e' f' g' ]  |
            < a' f' >4. g'8 f'4 < c'' f' > < c'' e' > < a' d' >  |
            < a' e' cis' >2. < a' e' >8.[ g'16 f'8 ] < g' d' bes >8.[ f'16 e'8 ]  |
            < f' a >4. e'8 d'4 < d' bes > d' cis'  |
            < d' a >2 < d' a >4
        }
        \repeat volta 2 {
            cis'!8.[ d'16 ] e'4 d'8[ cis' ]  |
            d'4 e'8 f'4 d'8 e'8[ f' g' a' < g' d' bes > f' ]  |
            < cis' e' >2. <<{ a'8.[ g'16 f'8 ]} e'8 >> <<{ g'8.[ f'16 e'8 ]} d'8 >>  |
            <<
                { \tieDown f'4. a'8 g'4. f'8 ~ f'8[ d' f' g' ] | } \\
                { c'2 e'8[ d'8 ] cis'4 }
            >> |
            r8 < a' e' cis' >8 a4 < a' e' cis'>4
        }
        \repeat volta 2 {
            s4*3  |
            f'4 e'8 d'4 c'8 b8.[ c'16 d'8 ] e'4 d'8  |
            g'4 f'8 e'4 d'8 cis'8.[ d'16 ] e'4 f'8[ g' ]  |
            < cis' e' >8.[ g'16 f'8 d' cis' e' ] < d' a >4. < d' b >4 cis'8  |
            r8 d' a4 < d' a >4
        }
    }
} % compTreble


compBass = \new Staff {
    \set Staff.autoBeaming    = ##f
    \set Staff.midiInstrument = \midiCompInstrument

    \clef bass
    \time 3/2

    \new Voice {
        \upstep
        \repeat volta 2 {
            < a d >4 < a d >4. e8  |
            < c' f >2 < c' f >4 < a f > < c' c > < a d >  |
            a,2. < a a, >4 < a d >8 g,4 c8  |
            f,2 bes,4 < g g, >4 < e a, >2  |
            d4 d,2
        }
        \repeat volta 2 {
            a4. g8 f[ e ]  |
            < a d >4 < a cis >8 < a d >4. < c' c > f,8 g,4  |
            < a a, >2. < a a, >4 < a d >8 < g g, >4 c8  |
            f,2 < bes g, >4 a, bes,2  |
            a,4. a,
        }
        \repeat volta 2 {
            <<
                { a8.[ b16 c'8 ] d'4 c'8 | } \\
                { f2 f4 | }
            >> |
            f2 f4 g2 g4  |
            g2 g4 a4. a,  |
            a,2 a,4 d8.[ e16 fis8 g ] e4  |
            d4. d
        }
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
