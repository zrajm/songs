\version "2.10.10"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 15"
    subtitle = ""
    composer = "J.S. Bach (1685–1750)"
    copyright = "Zrajm C Akfohg, mars 2006–mars 2007"
    tagline = ""
}
midiChoirInstrument = #"drawbar organ"
midiPianoInstrument = #"acoustic grand"
labelSoprano        = \markup { "Sopran " }
shortSoprano        = \markup { "S "      }
labelAlto           = \markup { "Alt "    }
shortAlto           = \markup { "A "      }
labelTenor          = \markup { "Tenor "  }
shortTenor          = \markup { "T "      }
labelBass           = \markup { "Bas "    }
shortBass           = \markup { "B "      }

#(set-global-staff-size 18)
\paper {
    #(set-paper-size "a4")  %'landscape)  % A4 = 210mm × 297.9mm
    ragged-bottom     = ##t
    print-page-number = ##f  % turn on/off page number printing
    top-margin        = 0\cm
}
\layout {
    papersize = "a4"
    \context {
        \Staff
            \consists Ambitus_engraver
    }
    \context {
        \Lyrics
            fontSize = #-1
            %\override LyricExtender #'minimum-length = #0
                % default: #1.5
                %
                % allow extender lines (used in lyrics for melisma) to become
                % zero in length
    }
}
\midi {
    \context {
        \Score
            tempoWholesPerMinute = #(ly:make-moment 70 4)
    }
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Functions                                                                %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Keep/remove original score linebreaks
%mBreak = { \break }   % retain line breaks from original score
mBreak = { }          % don't keep line breaks from original score
    % (see also Lilypond v2.10 Manual, "4.1.2 Typesetting existing music")
    % /zrajm [2007-03-15]

left = {
    \once \override LyricText #'self-alignment-X = #-1 %default: #0
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Lyrics                                                                   %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Swedish lyrics
swedishLyricsVerseI = \lyricmode {
    \set stanza = "1. "
    \left
    Vem | har så grymt dig | sla -- git,
    med | skymf -- ord e -- mot -- | ta -- git?
    Vad | ont har du väl | gjort?
    Du | lev -- de ej som | an -- dra,
    du | kun -- nat sorg -- fri | van -- dra
    din | väg till pa -- ra -- | di -- sets port.
}
swedishLyricsVerseII = \lyricmode {
    \set stanza = "2. "
    \left
    Hur | få -- vitskt jag kan | frå -- ga! % NOTE: Texten i Sveriges
    Vad | här dig vål -- lar | plå -- ga,   %   Radios program är här
    min | synd, mitt verk det | är.         %   "fåviskt" isf det
    I | sla -- gen som dig | drab -- bat,   %   korrekta "fåvitskt".
    i | rös -- ten som be -- | gab -- bat,  %   /zrajm [2007-03-15]
    där | var jag med, o | Her -- re kär.
}
% Original German lyrics
germanLyricsVerseI = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Wer hat dich so geschlagen,
    mein Heil, und dich mit Plagen
    so übel zugerich't?
    Du bist ja nicht ein Sünder,
    wie wir und unsre Kinder,
    von Missetaten weisst du nicht.
}
germanLyricsVerseII = \lyricmode {
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
        \set Staff.autoBeaming         = ##f
        \set Staff.midiInstrument      = \midiChoirInstrument
        \set Staff.instrumentName      = \labelSoprano
        \set Staff.shortInstrumentName = \shortSoprano

        \clef treble
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 a'4                          | % Vem
            f'4 g' a'8[ bes' ] c''4                 | % har så grymt dig
            bes'2 a'4\fermata a'                    | % slagit, / med
            c''4 c'' g' bes'8[ a' ]                 | % skymford emot-
            f'2 e'4\fermata c'                      | % tagit? / Vad
          \mBreak
            f'4 g' a'8[ bes'16 c'' ] bes'8[ a' ]    | % ont har du väl
            g'2.\fermata a'4                        | % gjort? / Du
            f'4 g' a'8[ bes' ] c''4                 | % levde ej som
            bes'2 a'4\fermata a'8[ bes' ]           | % andra, / du
          \mBreak
            c''4 c'' g' a'                          | % kunnat sorgfri
            f'2 e'4\fermata c'                      | % vandra / din
            f'4 g' a'8[ bes' ] c''[ bes' ]          | % väg till para-
            a'4 g' f'\fermata                         % disets port.
        }
    } % Voice
    \addlyrics { \swedishLyricsVerseI }
    \addlyrics { \swedishLyricsVerseII }
} % soprano


alto = \new Staff {
    \new Voice {
        \set Staff.autoBeaming         = ##f
        \set Staff.midiInstrument      = \midiChoirInstrument
        \set Staff.instrumentName      = \labelAlto
        \set Staff.shortInstrumentName = \shortAlto

        \clef treble
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 f'4                          | % Vem
            d'4 e' f'8[ g' ] a'4                    | % har så grymt dig
            a'4( g'8[ f' ]) e'4\fermata f'          | % slagit, / med
            f'4 f' e' g'8[ f' ]                     | % skymford emot-
            d'2 c'4\fermata g                       | % tagit? / Vad
          \mBreak
            c'4 d'8[ e' ] f'[ g'16 a' ] g'8[ f' ]   | % ont har du väl
            e'2.\fermata e'4                        | % gjort? / Du
            d'4 c' c' d'                            | % levde ej som
            d'4( cis' ) d'\fermata d'               | % andra, / du
          \mBreak
            c'4 f'8[ e' ] d'4 c'8[ b16 a ]          | % kunnat sorgfri
            d'2 c'4\fermata c'                      | % vandra / din
            c'4 bes a8[ c' ] f'4                    | % väg till para-
            f'4 e' c'\fermata                         % disets port.
        }
    } % Voice
    \addlyrics { \swedishLyricsVerseI }
    \addlyrics { \swedishLyricsVerseII }
} % alto


tenor = \new Staff {
    \new Voice {
        \set Staff.autoBeaming         = ##f
        \set Staff.midiInstrument      = \midiChoirInstrument
        \set Staff.instrumentName      = \labelTenor
        \set Staff.shortInstrumentName = \shortTenor

        \clef "treble_8"
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 c'4                          | % Vem
            bes4 bes c' f                           | % har så grymt dig
            f4( g ) a\fermata d'                    | % slagit, / med
            c'4 c' c' c'                            | % skymford emot-
            c'4( b ) e\fermata e                    | % tagit? / Vad
          \mBreak
            f4 bes c'8[ f ] e[ f ]                  | % ont har du väl
            c'2.\fermata a4                         | % gjort? / Du
            a4 g f8[ g ] a4                         | % levde ej som
            g4( e ) fis\fermata f                   | % andra, / du
          \mBreak
            f4 f f e                                | % kunnat sorgfri
            a4( g ) g\fermata a                     | % vandra / din
            a4 g c'4. d'8                           | % väg till para-
            c'4 bes a\fermata                         % disets port.
        }
    } % Voice
    \addlyrics { \swedishLyricsVerseI }
    \addlyrics { \swedishLyricsVerseII }
} % tenor


bass = \new Staff {
    \new Voice {
        \set Staff.autoBeaming         = ##f
        \set Staff.midiInstrument      = \midiChoirInstrument
        \set Staff.instrumentName      = \labelBass
        \set Staff.shortInstrumentName = \shortBass

        \clef bass
        \key f\major
        \time 4/4

        \repeat volta 2 {
            \partial 4 f4                           | % Vem
            bes4 a8[ g ] f4. ees8                   | % har så grymt dig
            d2 cis4\fermata d                       | % slagit, / med
            a,8[ g, ] a,[ bes, ] c4 f,              | % skymford emot-
            g,4( gis, ) a,\fermata bes,             | % tagit? / Vad
          \mBreak
            a,4 g, f, bes,                          | % ont har du väl
            c2.\fermata cis4                        | % gjort? / Du
            d4 e f fis                              | % levde ej som
            g2 d4\fermata d                         | % andra, / du
          \mBreak
            a,8[ g, ] a,4 b, c                      | % kunnat sorgfri
            c4( b, ) c\fermata a,                   | % vandra / din
            d8[ c ] d[ e ] f4 a,8[ bes, ]           | % väg till para-
            c4 c f,\fermata                           % disets port.
        }
    } % Voice
    \addlyrics { \swedishLyricsVerseI }
    \addlyrics { \swedishLyricsVerseII }
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
    \score { \applyMusic #unfold-repeats << \choir %{ \piano %} >> \midi {} } % SATB
    \score { \applyMusic #unfold-repeats    \soprano         \midi {} } % S
    \score { \applyMusic #unfold-repeats    \alto            \midi {} } % A
    \score { \applyMusic #unfold-repeats    \tenor           \midi {} } % T
    \score { \applyMusic #unfold-repeats    \bass            \midi {} } % B
    \score { \applyMusic #unfold-repeats    \piano           \midi {} } % piano
}

%[[eof]]
