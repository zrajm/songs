\version "2.10.10"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 68"
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
            \override VerticalAxisGroup #'minimum-Y-extent = #'(-.8 . 1.6)
                % default: '(-1.2 . 2.4)
                %
                % space lyrics closely (later add some extra space between
                % verses) 1st (negative) value is distance below, 2nd
                % (positive) is dist above
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
mBreak = { \break }   % retain line breaks from original score
%mBreak = { }          % don't keep line breaks from original score
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
swedishLyricsVerseIRepeatI = \lyricmode {
    \left
    Sänd | Her -- re, di -- na | äng -- lar ut,
    att | sjä -- len må vid | li -- vets slut
    av | dem till him -- len | fö -- | ras.
}
swedishLyricsVerseIRepeatII = \lyricmode {
    \left
    Och | låt min tröt -- ta | kropp i ro
    sig | vi -- la i sitt | tys -- ta bo,
    tills | där Din röst skall | hö -- | ras.

    Då | skall jag, klädd i | he -- lig skrud,
    med | mi -- na ö -- gon | skå -- da Gud
    och | av hans nåd och | här -- lig -- het
    % FIXME: Why does barchecks (commented below) stop to work here!?
    % /zrajm [2007-03-25]
    mig %{|%} fröj -- da i all %{|%} e -- vig -- het
    O %{|%} Je -- su Krist,
    ack, %{|%} bön -- hör mig, ack, %{|%} bön -- hör mig.
    I %{|%} liv och död jag %{|%} till -- hör %{|%} dig.
}
% Original German lyrics
germanLyricsVerseIRepeatI = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Ach Herr, lass dein lieb' Engelein
    am letzten End' die Seele mein
    in Abrahams Schoss tragen!
}
germanLyricsVerseIRepeatII = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Den Leib in sein'm Schlafkämmerlein
    gar sanft, ohn' ein'ge Qual und Pein,
    ruhn bis am jüngsten Tage!

    Alsdann vom Tod' erwecke mich,
    dass meine Augen sehen dich
    in aller Freud', o Gottes Sohn,
    mein Heiland und Genadenthron!
    Herr Jesu Christ,
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % The next line is sung twice in the Swedish version, %
    % so it'll probably need to be repeated here too?     %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    erhöre mich, erhöre mich,
    ich will dich preisen ewiglich!
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
        \time 4/4

        \repeat volta 2 {
            \partial 4 c'' 4            | % Sänd
            b'4 a' g' f'8[ e' ]         | % Herre, dina
            a'4 a' g'\fermata c''       | % änglar ut, / att
            b'4 a' g' f'8[ e' ]         | % själen må vid
            a'4 a' g'\fermata g'        | % livets slut / av
          \mBreak
            a'4 b' c''8[ d'' ] e''4     | % dem till himlen
            d''4( c''2 b'4 )            | % fö-
            c''2.                         % ras.
        }
        \partial 4 c''4                 | % Då
        c''4 d'' c''8[ b' ] a'[ b' ]    | % skall jag, klädd i
        c''4 c'' b'\fermata b'          | % helig skrud, / med
        c''4 d'' c''8[ b' ] a'[ b' ]    | % mina ögon
      \mBreak
        c''8[ e'' ] d''4 b'\fermata e'' | % skåda Gud / och
        e''4 e'' d'' c''                | % av hans nåd och
        c''4 b' c''\fermata b'          | % härlighet / mig
        c''4 b' a' g'                   | % fröjda i all
        g'4 fis' g'\fermata e''         | % evighet / O
      \mBreak
        d''4 c'' b'\fermata e''         | % Jesu Krist, / ack,
        f''8[ e'' ] d''4 e'' c''        | % bönhör mig, ack,
        c''4 b' c''\fermata c''         | % bönhör mig. / I
        c''4 c'' d'' c''                | % liv och död jag
        c''2. b'4                       | % tillhör
        c''2.\fermata                     % dig.
        \bar "|."
    } % Voice
    \addlyrics { \swedishLyricsVerseIRepeatI }
    \addlyrics { \swedishLyricsVerseIRepeatII }
} % soprano


alto = \new Staff {
    \new Voice {
        \set Staff.autoBeaming         = ##f
        \set Staff.midiInstrument      = \midiChoirInstrument
        \set Staff.instrumentName      = \labelAlto
        \set Staff.shortInstrumentName = \shortAlto

        \clef treble
        \time 4/4

        \repeat volta 2 {
            \partial 4 g'4                          | % Sänd
            g'4 e' e' d'8[ c' ]                     | % Herre, dina
            c'4 f' e'\fermata e'                    | % änglar ut, / att
            e'8[ d' ] c'[ d' ] e'[ d' ] c'[ b ]     | % själen må vid
            c'8[ d' ] d'4 e'\fermata e'             | % livets slut / av
          \mBreak
            f'8[ a' ] g'[ f' ] e'[ d' ] c'4         | % dem till himlen
            d'2( e'4 f' )                           | % fö-
            e'2.                                      % ras.
        }
        \partial 4 e'4                              | % Då
        f'4 f' e'4. e'8                             | % skall jag, klädd i
        d'8[ e' ] fis'4 g'\fermata g'               | % helig skrud, / med
        g'4 f' e' f'                                | % mina ögon
      \mBreak
        g'4 a' g' g'                                | % skåda Gud / och
        g'4 a' a' f'                                | % av hans nåd och
        e'4 d' e'\fermata f'                        | % härlighet / mig
        e'4 d'8[ g' ] e'4 e'                        | % fröjda i all
        e'4 d' d'\fermata c'                        | % evighet / O
      \mBreak
        d'8[ e'16 f' ] e'8[ fis' ] gis'4\fermata a' | % Jesu Krist, / ack,
        a'4 gis'8[ a' ] e'4 e'                      | % bönhör mig, ack,
        es'8[ d' ] d'4 e'\fermata e'                | % bönhör mig. / I
        f'4 f' f' e'                                | % liv och död jag
        d'2 d'                                      | % tillhör
        e'2.\fermata                                  % dig.
        \bar "|."
    } % Voice
    \addlyrics { \swedishLyricsVerseIRepeatI }
    \addlyrics { \swedishLyricsVerseIRepeatII }
} % alto


tenor = \new Staff {
    \new Voice {
        \set Staff.autoBeaming         = ##f
        \set Staff.midiInstrument      = \midiChoirInstrument
        \set Staff.instrumentName      = \labelTenor
        \set Staff.shortInstrumentName = \shortTenor

        \clef "treble_8"
        \time 4/4

        \repeat volta 2 {
            \partial 4 e'4  |
            d'4 c' b bes  |
            a8[ g ] a[ b ] c'4\fermata e8[ f ]  |
            g4 a8[ b ] c'4 f8[ g ]  |
            \stemUp a8[ c' ] b[ a ] \stemNeutral b4\fermata c'  |
            c'8[ f' ] e'[ d' ] c'[ g ] bes4  |
            a2( g )  |
            g2.
        }
        \partial 4 g4  |
        a4 a a8[ b ] c'[ b ]  |
        a4 d' d'\fermata d'  |
        g4 g g d'  |
        c'8[ b ] a4 d'\fermata c'  |
        c'4 c' d' d'  |
        g4 g g\fermata d'  |
        g8[ a ] b4 c' b  |
        c'8[ b ] a4 b\fermata g8[ a ]  |
        b4 c'8[ a ] e'4\fermata a  |
        d'8[ c' ] b[ a ] b4 a  |
        a4 g g\fermata bes  |
        a8[ b ] c'4 g g  |
        a2 g  |
        g2.\fermata
        \bar "|."
    } % Voice
    \addlyrics { \swedishLyricsVerseIRepeatI }
    \addlyrics { \swedishLyricsVerseIRepeatII }
} % tenor


bass = \new Staff {
    \new Voice {
        \set Staff.autoBeaming         = ##f
        \set Staff.midiInstrument      = \midiChoirInstrument
        \set Staff.instrumentName      = \labelBass
        \set Staff.shortInstrumentName = \shortBass

        \clef bass
        \time 4/4

        \repeat volta 2 {
            \partial 4 c4  |
            g4 a e g  |
            f4 f, c\fermata a,  |
            e4 f c8[ b, ] a,[ g, ]  |
            f,4 f e\fermata c  |
            f4 g a8[ b, ] c4  |
            f,4( fis, g,2 )  |
            c2.
        }
        \partial 4 c4  |
        f8[ e ] d4 a, a8[ g ]  |
        fis8[ e ] d4 g\fermata g8[ f ]  |
        e8[ d ] c[ b, ] c4 d  |
        e4 fis g\fermata c  |
        c'8[ b ] a[ g ] f[ g ] a[ f ]  |
        g4 g, c\fermata d  |
        e8[ fis ] g[ e ] c[ d ] e[ c ]  |
        a,4 d g,\fermata c  |
        g4 a e\fermata cis  |
        d8[ e ] f4 gis, a,  |
        fis4 g c\fermata c  |
        f8[ g ] a4 b, c  |
        fis,2 g,  |
        c,2.\fermata
        \bar "|."
    } % Voice
    \addlyrics { \swedishLyricsVerseIRepeatI }
    \addlyrics { \swedishLyricsVerseIRepeatII }
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
