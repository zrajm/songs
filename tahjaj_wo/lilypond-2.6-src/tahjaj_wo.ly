\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    title = \markup \bold { taHjaj wo’. }
    subtitle = \markup \italic { An Imperial Anthem. }
    composer = \markup {
        Rich \bold { “HoD Qanqor” } Yampell, %(birth–death)
        %\italic { First Booke of Songes or Ayres, }
        1993
    }
    tagline = \markup \column { \center-align {
        \line { Zrajm C Akfohg, May 2006 }
        \line { http://zrajm.klingonska.org/songs/ }
    }}
}
midiChoirInstrument = #"woodblock" %#"drawbar organ"
upstep              = \partial 4*1
labelSoprano        = \markup I       % Cantus
shortSoprano        = \markup I       % C
labelAlto           = \markup II      % Altus
shortAlto           = \markup II      % A
labelTenor          = \markup III     % Tenor
shortTenor          = \markup III     % T

myStaffSize = #18
#(set-global-staff-size myStaffSize)
\paper {
    #(set-paper-size "a4") % 'landscape)  % A4 = 210mm × 297.9mm
    %raggedbottom   = ##t
    %raggedlast     = ##t
    printpagenumber = ##f  % turn on/off page number printing

    topmargin     = 12.5\mm                 %default: 5\mm
    %bottommargin = 6\mm                    %default: 6\mm
    %leftmargin   = #f      % (Que?)
    %%headsep       = 0\mm  %% no effect?   %default: 4\mm
    %%%footsep      = 4\mm                  %default: 4\mm

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
    betweensystemspace  = 0.1\mm
    betweensystempadding = 0.1\mm
        % between systems, and topmost system/title (overlapping with
        % `aftertitlespace', I think)

%    #(define fonts
%        (make-pango-font-tree
%         "Vera Serif" "Times New Roman" "Courier"
%         (/ myStaffSize 20)))
}
\layout {
    papersize = "a4"
    \context {
        \GrandStaff
            \consists Instrument_name_engraver
                % FIXME: turn off ambitus_engraver for the lute part (GrandStaff)!
    }
    \context {
        \Voice
            \remove "Dynamic_engraver"
    }
    \context {
        \Staff
            %\consists Ambitus_engraver
            minimumVerticalExtent = #'(-4.8 . 4) %default: #'(-4 . 4)
                % same as minimumVerticalExtent for lyrics below, but for staff
    }
    \context {
        \Lyrics
            fontSize = #-1
            minimumVerticalExtent = #'(-.8 . 1.6) %default: '(-1.2 . 2.4)
                % space lyrics closely (later add some extra space between verses)
                % 1st (negative) value is distance below, 2nd (positive) is dist above

            \override LyricExtender #'minimum-length = #0  %default: #1.5
                % allow extender lines (used in lyrics for melisma) to become
                % zero in length

            \override LyricHyphen   #'minimum-length = #0 %default: #0.3
            %\override LyricHyphen   #'padding        = #15 %default: #0.07
            %\override LyricHyphen   #'thickness      = #9  %default: #1.3
                % FIXME: allow hyphens to become zero in length (NOTE:
                % hyphenated syllables are still padded from each other, so
                % just setting minimum hyphen length to zero have no effect)

            \override LyricText #'word-space = #50 %default: #0.6
                % FIXME: how do you set minimum width of space in lyrics?
    }
}
\midi {
    \tempo 4 = 180
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Functions                                                                %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% for left-aligning a syllable of lyrics
% (appropriate at beginning of each line and page)
left = {
    \once \override LyricText #'self-alignment-X = #-1 %default: #0
}

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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Swedish lyrics
lyricTlhI = \lyricmode {
    %% 1:1
    taH -- jaj wo’
    %% 1:2
    ’ej taH -- jaj voD -- leH -- ma’
    %% 1:3
    wI -- toy’ -- mo’
    %% 1:4
    vaj nu -- quv -- moH -- jaj ta’
    %% 1:5
    Dun wo’ -- maj
    %% 1:6
    ’ej Qoch -- chugh vay’
    %% 1:7
    vaj DaS -- mey -- maj bIng -- Daq chaH
    %% 1:8
    DI -- beQ -- moH -- chu’ jay’!
}
lyricTlhII = \lyricmode {
    %% 2:1
    taH -- jaj taH -- jaj wo’ ’ej taH -- jaj maH!
    %% 2:2
    bech -- jaj jagh -- ma’; Hegh -- jaj chaH!
    %% 2:3
    wI -- toy’ wI -- toy’ -- bej net Sov net Sov!
    %% 2:4
    val ’ej may voD -- leH -- ma’ pov!
    %% 2:5
    Dun wo’ Dun wo’ -- vam, juH -- maj; not Dej
    %% 2:6
    Qoch -- chugh Qoch -- chugh vay’ vaj Dogh -- qu’ -- bej!
    %% 2:7
    DaS -- mey -- maj bIng -- Daq chaH DI -- beQ --
    %% 2:8
    moH -- chu’ jay’!
}
lyricTlhIII = \lyricmode {
    %% 3:1
    ma -- Sop -- nIS -- be’,
        ma -- tlhutlh -- nIS -- be’,
        ’ej ma -- Do’ -- chugh,
        ma -- tlhuH -- nIS -- be’
    %% 3:2
    Doch neH wI -- ta’ --
        nIS -- bogh ’oH tlhI --
        ngan wo’ -- ’a’ HoS --
        ghaj toy’ -- ghach -- ’e’
    %% 3:3
    may’ -- ’a’ -- mey -- Daq,
        veS -- ’a’ -- mey -- Daq,
        ’ej reH ’ej reH
        yay -- ’a’ -- mey -- Daq
    %% 3:4
    Qap -- la’ wI -- chav
        ’ej batlh wI -- Suq
        ’ej tlhI -- ngan wo’
        nIv -- ghach wI -- maq
    %% 3:5
    ma -- toy’ -- rup -- chu’,
        ma -- Suv -- laH -- chu’,
        ma -- Hegh -- qang -- chu’
        ’ut -- chugh ’ut -- mo’
    %% 3:6
    ’ach Hegh -- may yI --
        pIH -- Qo’ ghay -- tan
        wa’ -- DIch jagh -- ’e’
        wI -- Hegh -- moH -- mo’
    %% 3:7
    vaj taH -- jaj wo’,
        vaj taH -- jaj wo’,
        ’u’ HeH -- Daq tlhI --
        ngan juH -- qo’ -- vo’
    %% 3:8
    vaj taH -- jaj taH --
        jaj taH -- jaj taH --
        jaj taH -- jaj tlhI --
        ngan wo’
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Choir Notes                                                              %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


soprano = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = #"drawbar organ"
        \set Staff.instrument     = \labelSoprano
        \set Staff.instr          = \shortSoprano

        \clef "treble_8"
        \time 4/4

        \upstep
%       \transpose a e {
        \relative c' {
            r4          |
            a1          | % A2      taH-
            b1          | % B2      jaj
            c1          | % C3      wo’
            r2 e,4 ~      % (E2)    (’ej..)
          \bar "" \break
            e4          | % E2      ..’ej
            a2  c2      | % A2 C3   taHjaj
            b2  a2      | % B2 A2   voDleH-
            gis1 ~      | % G#2     ma’
            gis2 r4       %
          \bar "" \break
            r4          | %
            b1          | % B2      wI’-
            c1          | % C3      toy’-
            d1          | % D3      mo’
            r2 e,4 ~      % (E2)    (vaj..)
          \bar "" \break
            e4          | % E2      ..vaj
            b'2 d2      | % B2 D3   nu-quv-
            c2 b2       | % C3 B2   moH-jaj
            a1 ~        | % A2      ta’
            a2 r4         %
          \bar "" \break
            r4          | %
            a1          | % A2      Dun-
            b1          | % B2      wo’-
            c1          | % C3      maj
            r2 a4 ~       % (A2)    (’ej..)
          \bar "" \break
            a4          | % A2      ..’ej
            c1          | % C3      Qoch-
            d1          | % D3      chugh
            dis1        | % D#3     vay’
            r2 c4 ~       % (C3)    (vaj..)
          \bar "" \break
            c4          |% C3      ..vaj
            dis2 dis2   |% D#3 D#3 DaS-mey-
            d2 d2       |% D3 D3   maj bIng-
            c2 c2       |% C3 C3   Daq chaH
            b2 b4 ~      % B2 B2   DI-beQ..
          \bar "" \break
            b4          | % (B2)    (..beQ)
            a1          | % A2      moH-
            gis1        | % G#2     chu’
            a1 ~        | % A2      jay’
            a2 r4         %
          \bar "|."
        } % relative
%       } % transpose
    } % Voice
    \addlyrics { \lyricTlhI }
} % soprano


alto = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = #"drawbar organ"
        \set Staff.instrument     = \labelAlto
        \set Staff.instr          = \shortAlto

        \set shapeNoteStyles  = ##(xcircle)

        \clef treble
        \time 4/4

        \upstep
        \set Staff.midiInstrument = #"breath noise"
        \relative c'' {
            r4\ppppp    |
            r2 b4 r4    | % D#3     taH-
            r2 b4 r4    | % E3      jaj
            b b b b     | % A2      taH-jaj wo’ ’ej
            b b b         %         taH-jaj maH!
          \bar ""
            r4          |
            r1          |
            r1          |
            b4 b b b    | % bech-jaj jagh-ma’;
            b b b         % Hegh-jaj chaH!
          \bar ""
            r4          |
            r2 b4 r4    | % wI-
            r2 b4 r4    | % toy’
            b b b b     | % wI-toy’-bej net
            b b b         % Sov net Sov!
          \bar ""
            r4          |
            r1          |
            r1          |
            b4 b b b    | % val ’ej may voD-
            b b b         % leH-ma’ pov!
          \bar ""
            r4          |
            r2 b4 r4    | % Dun
            r2 b4 r4    | % wo’
            b b b b     | % Dun wo’-vam, juH-
            b b b         % maj; not Dej
          \bar ""
            r4          |
            r2 b4 r4    | % Qoch-
            r2 b4 r4    | % chugh
            b b b b     | % Qoch-chugh vay’ vaj
            b b b         % Dogh-qu’-bej!
          \bar ""
            r4          |
            b2 b2       | % DaS-mey-
            b2 b2       | % maj bIng-
            b2 b2       | % Daq chaH
            b2 b4 ~       % DI-beQ-
          \bar ""
            b4          | % (..beQ-)
            r2 b4 r4    | % moH-
            r2 b4 r4    | % chu’
            b1 ~        | % jay’!
            b2 r4
          \bar "|."
        }
    } % Voice
    \addlyrics { \lyricTlhII }
} % alto


tenor = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = #"woodblock"
        \set Staff.instrument     = \labelTenor
        \set Staff.instr          = \shortTenor

        \clef treble
        \time 4/4

        %\dynamicUp
        \upstep
        \relative c'' {
            b4\p                    | % ma-
            b\sf  b\p  b\ff  b\p    | % Sop-nIS-be’, ma-
            b\sf  b\p  b\ff  b\p    | % tlhutlh-nIS-be’, ’ej
            b\sf  b\p  b\ff  b\p    | % ma-Do’-chugh, ma-
            b\sf  b\p  b\ff           % tlhuH-nIS-be’
          \bar ""
            b\p                     | % Doch
            b\sf  b\p  b\ff  b\p    | % neH wI-ta’-nIS-
            b\sf  b\p  b\ff  b\p    | % bogh ’oH tlhI-ngan
            b\sf  b\p  b\ff  b\p    | % wo’-’a’ HoS-ghaj
            b\sf  b\p  b\ff           % toy’-ghach-’e’
          \bar ""
            b\p                     | % may’-
            b\sf  b\p  b\ff  b\p    | % ’a’-mey-Daq, veS-
            b\sf  b\p  b\ff  b\p    | % ’a’-mey-Daq, ’ej
            b\sf  b\p  b\ff  b\p    | % reH ’ej reH yay-
            b\sf  b\p  b\ff           % ’a’-mey-Daq
          \bar ""
            b\p                     | % Qap-
            b\sf  b\p  b\ff  b\p    | % la’ wI-chav ’ej
            b\sf  b\p  b\ff  b\p    | % batlh wI-Suq ’ej
            b\sf  b\p  b\ff  b\p    | % tlhI-ngan wo’ nIv-
            b\sf  b\p  b\ff           % ghach wI-maq
          \bar ""
            b\p                     | % ma-
            b\sf  b\p  b\ff  b\p    | % toy’-rup-chu’, ma-
            b\sf  b\p  b\ff  b\p    | % Suv-laH-chu’, ma-
            b\sf  b\p  b\ff  b\p    | % Hegh-qang-chu’ ’ut-
            b\sf  b\p  b\ff           % chugh ’ut-mo’
          \bar ""
            b\p                     | % ’ach
            b\sf  b\p  b\ff  b\p    | % Hegh-may yI-pIH-
            b\sf  b\p  b\ff  b\p    | % Qo’ ghay-tan wa’-
            b\sf  b\p  b\ff  b\p    | % DIch jagh-’e’ wI-
            b\sf  b\p  b\ff           % Hegh-moH-mo’
          \bar ""
            b\p                     | % vaj
            b\sf  b\p  b\ff  b\p    | % taH-jaj wo’, vaj
            b\sf  b\p  b\ff  b\p    | % taH-jaj wo’, ’u’
            b\sf  b\p  b\ff  b\p    | % HeH-Daq tlhI-ngan
            b\sf  b\p  b\ff           % juH-qo’-vo’
          \bar ""
            b\p                     | % vaj
            b\sf  b\p  b\ff  b\p    | % taH -- jaj taH -- jaj
            b\sf  b\p  b\ff  b\p    | % taH -- jaj taH -- jaj
            b\sf  b\p  b\ff  b\p    | % taH -- jaj tlhI -- ngan
            b\sf(  b\p  b\ff )        % wo’
          \bar "|."
        }
    } % Voice
    \addlyrics { \lyricTlhIII }
} % tenor


choir = {
    \new ChoirStaff <<
        \soprano
        \alto
        \tenor
    >>
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Score                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\book {
    \score {                                \choir                   } % notes
    \score { \applymusic #unfold-repeats    \choir          \midi {} } % all
    \score { \applymusic #unfold-repeats    \soprano        \midi {} } % S
    \score { \applymusic #unfold-repeats    \alto           \midi {} } % A
    \score { \applymusic #unfold-repeats    \tenor          \midi {} } % T
}

%[[eof]]
