\version "2.8.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    title = "Vitrum Nostrum Gloriosum"
    composer = \markup {
        Anonymous, from Georg Forster’s
        \italic { Frische teutsche Liedlein Vol.2, }
        1540
    }
    tagline = \markup \column { \center-align {
        \line { Zrajm C Akfohg, October 2006 }
        \line { http://zrajm.klingonska.org/songs/ }
    }}
}
midiChoirInstrument = #"electric piano 1" %"drawbar organ"
labelSoprano        = \markup Soprano
shortSoprano        = \markup S
labelAlto           = \markup Alto
shortAlto           = \markup A
labelTenor          = \markup Tenor
shortTenor          = \markup T
labelBass           = \markup Bass
shortBass           = \markup B

myStaffSize = #18
#(set-global-staff-size myStaffSize)
\paper {
    #(set-paper-size "a4" 'landscape)  % A4 = 210mm × 297.9mm
    %ragged-bottom   = ##t
    %ragged-last      = ##t
    %ragged-right     = ##t
    print-page-number = ##f  % turn on/off page number printing

%    top-margin     = 12.5\mm                 %default: 5\mm
    %bottom-margin = 6\mm                    %default: 6\mm
    %left-margin   = #f      % (Que?)
    head-separation       = 0\mm  %% no effect?   %default: 4\mm
    %foot-separation      = 4\mm                  %default: 4\mm

    %before-title-space = 50\mm
        % only useful if there's a title coming after some staves
    %between-title-space = 10\mm  % dist between titles
        %(e.g., the title of the book and the title of a piece)
    after-title-space = 0\mm
        % distance between title/composer header and fist system thereafter
        % If set to '0\mm', generates the somewhat bizarre error message:
        %    programming error: insane spring found, setting to unit
        %    continuing, cross fingers

    %indent = 10\mm
        % indent for 1st system (excluding any leftmost labels)
    between-system-space  = 0.1\mm
    between-system-padding = 0.1\mm
        % between systems, and topmost system/title (overlapping with
        % `after-title-space', I think)

    %annotate-spacing = ##t
        % DEBUG: show various distances on page
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
            \override VerticalAxisGroup #'minimum-Y-extent = #'(-4.8 . 4) %default: #'(-4 . 4)
                % same as \override VerticalAxisGroup #'minimum-Y-extent for lyrics below, but for staff
    }
    \context {
        \Lyrics
            fontSize = #-1
            \override VerticalAxisGroup #'minimum-Y-extent = #'(-.8 . 1.6) %default: '(-1.2 . 2.4)
                % space lyrics closely (later add some extra space between verses)
                % 1st (negative) value is distance below, 2nd (positive) is dist above

            \override LyricExtender #'minimum-length = #0  %default: #1.5
                % allow extender lines (used in lyrics for melisma) to become
                % zero in length
    }
}
\midi {
    \tempo 4 = 150
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Functions                                                                %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


left = {
    \once \override LyricText #'self-alignment-X = #-1 %default: #0
}

stemOff = {
    \override Stem #'transparent = ##t
    \stemDown
}

stemOn = {
    \override Stem #'transparent = ##f
    \stemNeutral
    %\revert Stem #'transparent
}


labelSoprano = \markup { \labelSoprano " " }
shortSoprano = \markup { \shortSoprano " " }
labelAlto    = \markup { \labelAlto    " " }
shortAlto    = \markup { \shortAlto    " " }
labelTenor   = \markup { \labelTenor   " " }
shortTenor   = \markup { \shortTenor   " " }
labelBass    = \markup { \labelBass    " " }
shortBass    = \markup { \shortBass    " " }



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This drinking song is a blatant parody of ecclesiastical chanting and comes
% from a collection compiled by Georg Foster, a friend of Martin Luther’s, who
% evidently supported Luther’s view that the Roman Catholic clergy had life far
% too good and deserved ridicule.

% Latin text
%
%     Vitrum nostrum gloriosum,
%     Deo gratissimum.
%     O, vitrum! Levate!
%     Fac, fac,
%       bibe totum extra, ut nihil maneat intra,
%     Depone!
%     Hoc est in visceribus meis.
%     Prosequamur laude!
%
% English translation
% (from: "http://www.cpdl.org/wiki/index.php/Vitrum_nostrum_gloriosum_(Anonymous)")
%
%     How glorious is our [drinking] glass
%     How pleasing to God.
%     Raise it up!  Come on,
%       Drink up till not a drop is left.
%     Down the hatch!
%     Now that’s all inside me.
%     Three cheers for our glass!
%



% Original lyrics in Latin
tenorVerse = \lyricmode {
    \left
    Vi -- trum nos -- trum glo -- ri -- o -- sum,
    E -- o gra -- tis -- si -- mum.
    O, __ vi __ trum!
    Le -- va __ te!

    Fac, fac, bi -- be to -- tum ex -- tra,
    ut ni -- hil ma -- ne -- at in -- tra,
    fac, __ bi -- be to -- tum ex -- tra, ut

    ni -- hil ma -- ne -- at in -- tra,
    De -- po __ ne.
    Hoc est in vi -- sce -- ri -- bus __ me --

    is. __ Pro -- se -- qua -- mur lau -- de! __
}

commonVerse = \lyricmode {
    \left
    %%% Vitrum nostrum gloriosum, %%%
    E -- o __ gra -- tis -- si -- mum.
    %%% O, vitrum! %%%
    Le -- va __ te!

    Fac, fac, bi -- be to -- tum ex -- tra,
    ut ni -- hil ma -- ne -- at in -- tra,
    fac, __ bi -- be to -- tum ex -- tra, ut

    ni -- hil ma -- ne -- at in -- tra,
    De -- po __ ne.
    %%% Hoc est in visceribus meis. %%%

    Pro -- se -- qua -- mur lau -- de,
    pro -- se -- qua -- mur lau -- de.
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

        \clef "treble"
        \key f\major
        \time 2/2

        \stemUp
        \relative g' {
            % rad ett
            \cadenzaOn r4*2 r1\fermata r4*2 \cadenzaOff  |
            %\cadenzaOn s4*2 r1\fermata s4*2 \cadenzaOff  |
            \partial 2  g2  |
            a g4( f8[ es? ]  |
            d4 ) g2 fis?4  |
            g1 \fermata  |
            \cadenzaOn s8 r1\fermata s8 \cadenzaOff  |
            f1  |
            f( d )  |
            d \fermata  |

            % rad två
            g2 g  |
            fis?4 fis g g  |
            fis?2 g4 g  |
            fis? fis g g8 g  |
            fis?2 g  |
            bes( a )  |
            a4 a bes a  |
            a( g ) a bes  |

            % rad tre
            g g f g8 g  |
            g2 f  |
            f1  |
            f( d )  |
            d  |
            \cadenzaOn s8*5 r1\fermata s8*5 \cadenzaOff  |

            % rad fyra
            g2 g  |
            g g  |
            f( g )  |
            g e ~  |
            e e  |
            e d  |
            e1  |
            d  |
            \bar "|."
        }
    } % Voice
    \addlyrics { \commonVerse }
} % soprano


alto = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelAlto
        \set Staff.instr          = \shortAlto

        \clef "treble"
        \key f\major
        \time 2/2

        \relative d' {
            % rad ett
            \cadenzaOn s4*2 r1\fermata s4*2 \cadenzaOff  |
            \partial 2  d2  |
            d d  |
            d d  |    % (NB: Whole note in original -- but contradicted by lyrics!)
            bes1 \fermata  |
            \cadenzaOn s4 s s s s \cadenzaOff  |
            a1  |
            a( a ) |
            bes \fermata  |

            % rad två
            d2 d  |
            d4 d d d  |
            d2 d4 d  |
            d d d d8 d  |
            d2 d  |
            d( f )  |
            f4 f f f  |
            d2 d4 d  |

            % rad tre
            d d d d8 d  |
            d2 d  |
            a1  |
            a( bes )  |
            bes  |
            \cadenzaOn s4 s s s s s s s s \cadenzaOff  |

            % rad fyra
            d2 d  |
            d d  |
            r4 d4.( c8[ bes a ]  |
            bes2 ) c  |
            c c  |
            c bes  |
            c1  |
            bes  |
            \bar "|."
        }
    } % Voice
    \addlyrics { \commonVerse }
} % alto


tenor = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelTenor
        \set Staff.instr          = \shortTenor

        \clef "treble_8"
        \key f\major
        \time 2/2

        \relative g {
            % rad ett
            \cadenzaOn \stemOff g4 g g f g bes a g \fermata \stemOn \cadenzaOff  |
            \partial 2  g2  |
            f g  |
            bes a  |
            g1 \fermata  |
            \cadenzaOn \stemOff g4( d' ) c( bes ) a \fermata \stemOn \cadenzaOff \bar "|"  |
            d,1  |
            f( g ) |
            g \fermata  |
        %\break
            % rad två
            g2 g  |
            a4 a g g  |
            a2 g4 g  |
            a a g g8 g  |
            a2 g  |
            \stemDown g( d' ) \stemNeutral  |
            c4 c d a  |
            bes2 a4 g  |
        %\break
            % rad tre
            bes bes a g8 g  |
            bes2 a  |
            d,1  |
            f( g )  |
            g  |
            \cadenzaOn \stemOff g4 g g g g f g( a ) f \stemOn \cadenzaOff \bar "|"  |
        %\break
            % rad fyra
            d1 ~ d  |
            bes'2 bes  |
            bes g  |
            a( g )  |
            g1 ~  |
            g ~  |
            g  |
            \bar "|."
        }
    } % Voice
    \addlyrics { \tenorVerse }
} % tenor


bass = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelBass
        \set Staff.instr          = \shortBass

        \clef "bass"
        \key f\major
        \time 2/2

        \relative g {
            % rad ett
            \cadenzaOn s4*2 r1\fermata s4*2 \cadenzaOff  |
            \partial 2  g2  |
            d g,  |
            g' d  |
            g,1 \fermata  |
            \cadenzaOn s4 s s s s \cadenzaOff  |
            d'1  |
            d( g, ) |
            g \fermata  |

            % rad två
            g2 g  |
            d'4 d g, g  |
            d'2 g,4 g  |
            d' d g, g8 g  |
            d'2 g,  |
            g'( d )  |
            f4 f bes, f'  |
            g2 d4 g,  |

            % rad tre
            g' g d g,8 g  |
            g'2 d  |
            d1  |
            d( g, )  |
            g  |
            \cadenzaOn s4 s s s s s s s s \cadenzaOff  |

            % rad fyra
            g2 g2  |
            g2 g2  |
            d'( g, )  |
            g c ~  |
            c c  |
            c g  |
            c1 g  |
            \bar "|."
        }
    } % Voice
    \addlyrics { \commonVerse }
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
%%  Score                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\book {
    \score {                             << \choir >>          } % notes
    \score { \applyMusic #unfold-repeats << \choir >>  \midi {} } % all
    \score { \applyMusic #unfold-repeats    \soprano   \midi {} } % S
    \score { \applyMusic #unfold-repeats    \alto      \midi {} } % A
    \score { \applyMusic #unfold-repeats    \tenor     \midi {} } % T
    \score { \applyMusic #unfold-repeats    \bass      \midi {} } % B
}

%[[eof]]
