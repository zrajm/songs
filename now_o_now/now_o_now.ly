\version "2.6.0"
\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "VI. Now, O Now, I Needs Must Part."
    subtitle = \markup \italic { (First Booke of Songes or Ayres) }
    composer = "John Dowland (1562-1638)"
    copyright = "Zrajm C Akfohg, February 2006"
    tagline = ""
}
#(set-global-staff-size 18)
\paper {
    raggedbottom = ##t
    printpagenumber = ##f  % turn on/off page number printing
}

soprano   = \markup Sopran
alto      = \markup Alt
tenor     = \markup Tenor
basso     = \markup Bas
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


lyricRefrain = \lyricmode {
    Sad de -- spair doth drive me hence,
    This de -- spair un -- kind -- ness sends.
    If that part -- ing be off -- ence,
    It is she which then off -- ends.
} lyricVerseOnePtOne = \lyricmode {
    \set stanza = "1. "
    Now, O now, I needs must part,
    Part -- ing though I ab -- sent mourn
    Ab -- sence can no joy im -- part:
    Joy once fled can -- not re -- turn.
} lyricVerseOnePtTwo = \lyricmode {
    While I live I needs must love,
    Love lives not when Hope is gone.
    Now at last De -- spair doth prove,
    Love di -- vi -- ded love -- th none.
    \lyricRefrain
}
% Hides the \time it's next to, and all subsequent \time:s in that context.
hideTimes = \override Staff.TimeSignature #'break-visibility = #all-invisible



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Notes                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


sopranoStaff = \new Staff {
    \new Voice { % (Soprano)
        \set Staff.midiInstrument = \midiInstr
        \set Staff.instrument = \markup \instrFix \soprano
        \set Staff.instr = \markup \instrFix S

        \clef treble
        \time 3/2

        \repeat volta 2 {
            b' 1 a' 2  |
            g' 1 fis' 2  |
            e' 1 g' 2  |
            a' 1 r2  |
            %% 5
            b' 1 d'' 2  |
            c'' 1 \stemDown b' 2 \stemNeutral  |
            \stemDown a' 1 b' 2 \stemNeutral  |
            \stemDown a' 1 r2 \stemNeutral  |
            b' 1 a' 2  |
            %% 10
            g' 1 fis' 2  |
            e' 1 g' 2  |
            a' 1 r2  |
            \time 6/2\hideTimes
            \stemDown b' 2 d'' c'' 2. c'' 4 b' 2 \stemNeutral a'  |
            \stemDown g' 1. ~ g' 1 r2 \stemNeutral  |
        }
        \time 3/2
        c'' 1 c'' 2  |
        %% 30
        c'' 1 e'' 2  |
        d'' 1 e'' 2  |
        d'' 1 r2  |
        \time 6/2
        \stemDown c'' 2. c'' 4 b' 2 \stemNeutral a' \stemDown c'' b' \stemNeutral  |
        \stemDown a' 1. ~ a' 1 r2 \stemNeutral  |
        \time 3/2
        %% 35
        b' 1 a' 2  |
        g' 1 fis' 2  |
        e' 1 g' 2  |
        a' 1 r2  |
        \time 6/2
        \stemDown b' 2 d'' c'' 2. c'' 4 b' 2 \stemNeutral a'  |
        %% 40
        \stemDown g' 1. ~ g' 1 r2 \stemNeutral  |
        \bar "|."
    } % Voice
    \addlyrics { \lyricVerseOnePtOne }
    \addlyrics { \lyricVerseOnePtTwo }
} % Staff (Soprano)


altoStaff = \new Staff {
    \new Voice { % (Alto)
        \set Staff.midiInstrument = \midiInstr
        \set Staff.instrument = \markup \instrFix \alto
        \set Staff.instr = \markup \instrFix A

        \clef treble
        \time 3/2

        \repeat volta 2 {
            g' 1 fis' 2  |
            e' 1 d' 2  |
            c' 1 b 2  |
            d' 1 r2  |
            %% 5
            d' 1 g' 2  |
            g' 1 g' 2  |
            fis' 1 g' 2  |
            fis' 1 r2  |
            g' 1 fis' 2  |
            %% 10
            e' 1 d' 2  |
            c' 1 b 2  |
            d' 1 r2  |
            \time 6/2\hideTimes
            d' 2 g' e' 4 ( fis' ) g' 2 g' fis'  |
            \stemDown g' 1. ~ g' 1 r2 \stemNeutral  |
        } % repeat

        \time 3/2
        e' 1 g' 2  |
        %% 30
        e' 2. d' 4 ( e' fis' )  |
        g' 1 g' 2  |
        g' 1 r2  |
        \time 6/2
        e' 2. e' 4 g' 2 a' a' gis'  |
        \stemDown a' 1. ~ a' 1 r2 \stemNeutral  |
        \time 3/2
        %% 35
        g' 1 fis' 2  |
        e' 1 d' 2  |
        c' 1 b 2  |
        d' 1 r2  |
        \time 6/2
        d' 2 g' e' 4 ( fis' ) g' 2 g' fis'  |
        %% 40
        \stemDown g' 1. ~ g' 1 r2 \stemNeutral  |
        \bar "|."
    } % Voice
    \addlyrics { \lyricVerseOnePtOne }
    \addlyrics { \lyricVerseOnePtTwo }
} % Staff (Alto)

tenorStaff = \new Staff {
    \new Voice { % (Tenor)
        \set Staff.midiInstrument = \midiInstr
        \set Staff.instrument = \markup \instrFix \tenor
        \set Staff.instr = \markup \instrFix T

        \clef "treble_8"
        \time 3/2

        \repeat volta 2 {
            \stemDown d' 1 d' 2 \stemNeutral  |
            \stemDown b 1 b 2 \stemNeutral  |
            g 1 g 2  |
            fis 1 r2  |
            %% 5
            g 1 d' 2  |
            e' 1 d' 2  |
            d' 1 d' 2  |
            \stemDown d' 1 r2 \stemNeutral  |
            d' 1 d' 2  |
            %% 10
            \stemDown b 1 b 2 \stemNeutral  |
            g 1 g 2  |
            fis 1 r2  |
            \time 6/2\hideTimes
            \stemUp g 2 \stemDown b c' 4 ( d' ) e' 2 d' 2. c' 4 \stemNeutral  |
            \stemDown b 1. ~ b 1 r2 \stemNeutral  |
        }
        \time 3/2
        c' 1 e' 2  |
        %% 30
        c' 1 c' 2  |
        \stemDown d' 2 ( b ) c' \stemNeutral  |
        b 1 r2  |
        \time 6/2
        c' 2. c' 4 e' 2 c' e' 2. d' 4  |
        cis' 1. ~ cis' 1 r2  |
        \time 3/2
        %% 35
        d' 1 d' 2  |
        \stemDown b 1 b 2 \stemNeutral  |
        g 1 g 2  |
        fis 1 r2  |
        g 2 \stemDown b c' 4 ( d' ) e' 2 d' 2. c' 4 \stemNeutral  |
        %% 40
        \stemDown b 1. ~ b 1 r2 \stemNeutral  |
        \bar "|."
    } % Voice
    \addlyrics { \lyricVerseOnePtOne }
    \addlyrics { \lyricVerseOnePtTwo }
} % Staff (Tenor)

bassoStaff = \new Staff {
    \new Voice { % (Basso)
        \set Staff.midiInstrument = \midiInstr
        \set Staff.instrument = \markup \instrFix \basso
        \set Staff.instr = \markup \instrFix B

        \clef bass
        \time 3/2

        \repeat volta 2 {
            \stemDown g 1 d 2 \stemNeutral  |
            e 1 b, 2  |
            c 1 e 2  |
            d 1 r2  |
            %% 5
            g 1 b 2  |
            c' 1 g 2  |
            d' 1 g 2  |
            d' 1 r2  |
            \stemDown g 1 d 2 \stemNeutral  |
            %% 10
            e 1 b, 2  |
            c 1 e 2  |
            d 1 r2  |
            \time 6/2\hideTimes
            g 2 g c 2. c 4 \stemDown d 2 d \stemNeutral  |
            \stemDown g 1. ~ g 1 r2 \stemNeutral  |
            \time 3/2
        }
        \time 3/2
        c 1 c 2  |
        %% 30
        c 1 c' 2  |
        b 2 ( g ) c'  |
        g 1 r2  |
        \time 6/2
        a 2. a 4 e 2 f e e  |
        a 1. ~ a 1 r2  |
        \time 3/2
        %% 35
        \stemDown g 1 d 2 \stemNeutral  |
        e 1 b, 2  |
        c 1 e 2  |
        d 1 r2  |
        \time 6/2
        g 2 g c 2. c 4 d 2 d  |
        %% 40
        g 1. ~ g 1 r2  |
        \bar "|."
    } % Voice
    \addlyrics { \lyricVerseOnePtOne }
    \addlyrics { \lyricVerseOnePtTwo }
} % Staff (Bass)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Score                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\score {
     \new ChoirStaff <<
        \sopranoStaff
        \altoStaff
        \tenorStaff
        \bassoStaff
    >> % ChoirStaff

    \layout {
        papersize = "a4"
        \context {
            \Voice \consists Ambitus_engraver
        }
    }
    \midi {
        \tempo 4 = 225
        %TEST
        %\applyoutput #unfold-repeats
        %% or \unfoldRepeats
    }
} % score
\markup {
    %%TODO: make \verse markup.
    \fill-line {
        \line {
            "2. "
            \column {
                \line {Dear, when I am from thee gone, }
                \line {Gone are all my joys at once. }
                \line {I loved thee and thee alone, }
                \line {In whose love I joyed once. }
                \line {And although your sight I leave, }
                \line {Sight wherein my joys do lie, }
                \line {Till that death do sense bereave, }
                \line {Never shall affection die. }
                \line {}
                \line {Sad despair doth drive me hence, }
                \line {This despair unkindness sends. }
                \line {If that parting be offence, }
                \line {It is she which then offends. }
            }
        }
    }
}
\markup {
    \fill-line {
        \line {
            "3. "
            \column {
                \line {Dear, if I do not return, }
                \line {Love and I shall die together. }
                \line {For my absence never mourn, }
                \line {Whom you might have joyed ever: }
                \line {Part we must though now I die, }
                \line {Die I do to part with you. }
                \line {Him Despair doth cause to lie, }
                \line {Who both liv'd and dieth true }
                \line {}
                \line {Sad despair doth drive me hence, }
                \line {This despair unkindness sends. }
                \line {If that parting be offence, }
                \line {It is she which then offends. }
            }
        }
    }
}


% Now, O now, I needs must part,
% Parting though I absent mourn
% Absence can no joy impart:
% Joy once fled cannot return.
% While I live I needs must love,
% Love lives not when Hope is gone.
% Now at last Despair doth prove,
% Love divided loveth none.
%
% Sad despair doth drive me hence,
% This despair unkindness sends.
% If that parting be offence,
% It is she which then offends.
%
% Dear, when I am from thee gone,
% Gone are all my joys at once.
% I loved thee and thee alone,
% In whose love I joyed once.
% And although your sight I leave,
% Sight wherein my joys do lie,
% Till that death do sense bereave,
% Never shall affection die.
%
% Sad despair doth drive me hence,
% This despair unkindness sends.
% If that parting be offence,
% It is she which then offends.
%
% Dear, if I do not return,
% Love and I shall die together.
% For my absence never mourn,
% Whom you might have joyed ever:
% Part we must though now I die,
% Die I do to part with you.
% Him Despair doth cause to lie,
% Who both liv'd and dieth true
%
% Sad despair doth drive me hence,
% This despair unkindness sends.
% If that parting be offence,
% It is she which then offends.

%[[eof]]
