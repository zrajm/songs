\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 15"
    subtitle = ""
    composer = "J.S. Bach (1685-1750)"
    copyright = "Zrajm C Akfohg, mars–april 2006"
    tagline = ""
}
midiChoirInstrument = #"drawbar organ"
midiPianoInstrument = #"acoustic grand"
labelSoprano        = \markup Sopran
shortSoprano        = \markup S
labelAlto           = \markup Alt
shortAlto           = \markup A
labelTenor          = \markup Tenor
shortTenor          = \markup T
labelBass           = \markup Bas
shortBass           = \markup B

#(set-global-staff-size 18)
\paper {
    #(set-paper-size "a4")  %'landscape)
    raggedbottom    = ##t
    printpagenumber = ##f  % turn on/off page number printing
}
\layout {
    papersize = "a4"
    \context {
        \Staff \consists Ambitus_engraver
    }
}
\midi {
    \tempo 4 = 70
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Swedish lyrics
lyricSvOne = \lyricmode {
    Vem har så grymt dig sla -- git,
    med skymf -- ord e -- mot -- ta -- git?
    Vad ont har du väl gjort?
    Du lev -- de ej som an -- dra,
    du kun -- nat sorg -- fri van -- dra
    din väg till pa -- ra -- di -- sets port.
} lyricSvTwo = \lyricmode {
    Hur få -- viskt jag kan frå -- ga!
    Vad här dig vål -- lar plå -- ga,
    min synd, mitt verk det är.
    I sla -- gen som dig drab -- bat,
    i rös -- ten som be -- gab -- bat,
    där var jag med, o Her -- re kär.
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Wer hat dich so geschlagen,
    mein Heil, und dich mit Plagen
    so übel zugerich't?
    Du bist ja nicht ein Sünder,
    wie wir und unsre Kinder,
    von Missetaten weisst du nicht.
} lyricDeTwo = \lyricmode {
    Ich, ich und meine Sünden
    die sich wie Körnlein finden
    des Sandes an dem Meer,
    die haben dir erreget
    das Elend, das dich schläget,
    und das betrübte Marterheer.
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
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 a'4  |
            f'4 g' a'8[ bes' ] c''4  |
            bes'2 a'4\fermata a'  |
            c''4 c'' g' bes'8[ a' ]  |
            f'2 e'4\fermata c'  |
          \break
            %% 5
            f'4 g' \stemUp a'8[ bes'16 c'' ] \stemNeutral bes'8[ a' ]  |
            g'2.\fermata a'4  |
            f'4 g' a'8[ bes' ] c''4  |
            bes'2 a'4\fermata a'8[ bes' ]  |
          \break
            c''4 c'' g' a'  |
            %% 10
            f'2 e'4\fermata c'  |
            f'4 g' a'8[ bes' ] c''[ bes' ]  |
            a'4 g' f'\fermata
        }
    } % Voice
    \addlyrics { \lyricSvOne }
    \addlyrics { \lyricSvTwo }
} % soprano


alto = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelAlto
        \set Staff.instr          = \shortAlto

        \clef treble
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 f'4  |
            d'4 e' f'8[ g' ] a'4  |
            a'4( g'8[ f' ]) e'4\fermata f'  |
            f'4 f' e' g'8[ f' ]  |
            d'2 c'4\fermata g  |
            %% 5
            c'4 d'8[ e' ] f'[ g'16 a' ] g'8[ f' ]  |
            e'2.\fermata e'4  |
            d'4 c' c' d'  |
            d'4( cis' ) d'\fermata d'  |
            c'4 f'8[ e' ] d'4 c'8[ b16 a ]  |
            %% 10
            d'2 c'4\fermata c'  |
            c'4 bes a8[ c' ] f'4  |
            f'4 e' c'\fermata
        }
    } % Voice
    \addlyrics { \lyricSvOne }
    \addlyrics { \lyricSvTwo }
} % alto


tenor = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelTenor
        \set Staff.instr          = \shortTenor

        \clef "treble_8"
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 c'4  |
            bes4 bes c' f  |
            f4( g ) a\fermata d'  |
            c'4 c' c' c'  |
            c'4( b ) e\fermata e  |
            %% 5
            f4 bes c'8[ f ] e[ f ]  |
            c'2.\fermata a4  |
            a4 g f8[ g ] a4  |
            g4( e ) fis\fermata f  |
            f4 f f e  |
            %% 10
            a4( g ) g\fermata a  |
            a4 g c'4. d'8  |
            c'4 bes a\fermata 
        }
    } % Voice
    \addlyrics { \lyricSvOne }
    \addlyrics { \lyricSvTwo }
} % tenor


bass = \new Staff {
    \new Voice {
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelBass
        \set Staff.instr          = \shortBass

        \clef bass
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 f4  |
            bes4 a8[ g ] f4. ees8  |
            d2 cis4\fermata d  |
            a,8[ g, ] a,[ bes, ] c4 f,  |
            g,4( gis, ) a,\fermata bes,  |
            %% 5
            a,4 g, f, bes,  |
            c2.\fermata cis4  |
            d4 e f fis  |
            g2 d4\fermata d  |
            a,8[ g, ] a,4 b, c  |
            %% 10
            c4( b, ) c\fermata a,  |
            d8[ c ] d[ e ] f4 a,8[ bes, ]  |
            c4 c f,\fermata
        }
    } % Voice
    \addlyrics { \lyricSvOne }
    \addlyrics { \lyricSvTwo }
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
%%  Piano Notes                                                              %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% FIXME: piano parts
pianoTreble = \new Staff {
    \set Staff.autoBeaming    = ##f
    \set Staff.midiInstrument = \midiPianoInstrument

    \clef treble
    \key f\major
    \time 4/4

    <<
        \new Voice {
        } % Voice
    >>
} % pianoTreble


pianoBass = \new Staff {
    \set Staff.autoBeaming    = ##f
    \set Staff.midiInstrument = \midiPianoInstrument

    \clef bass
    \key f\major
    \time 4/4

    <<
        \new Voice {
        } % Voice
    >>
} % pianoBass


piano = {
    \new PianoStaff <<
       \pianoTreble
       \pianoBass
    >>
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Score                                                                    %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\book {
    \score {                             << \choir %{ \piano %} >>    } % notes
    \score { \applymusic #unfold-repeats << \choir %{ \piano %} >> \midi {} } % SATB
    \score { \applymusic #unfold-repeats    \soprano         \midi {} } % S
    \score { \applymusic #unfold-repeats    \alto            \midi {} } % A
    \score { \applymusic #unfold-repeats    \tenor           \midi {} } % T
    \score { \applymusic #unfold-repeats    \bass            \midi {} } % B
    \score { \applymusic #unfold-repeats    \piano           \midi {} } % piano
}

%[[eof]]
