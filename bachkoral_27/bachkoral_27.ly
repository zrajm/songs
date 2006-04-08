\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 27"
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
    \context { \Staff
        \consists Ambitus_engraver
    }

    \context { \Lyrics
        %%\override LyricSpace #'minimum-distance = #0.6  % doesn't work?
        %\override LyricText #'font-shape = #'italic
        %\override LyricText #'font-size = #-5
        \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 5)
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
    Ack Her -- re, hur skall jag väl rätt dig
    lo -- va
    och tac -- ka för en så ko -- nung -- slig gå -- va:
    vad ing -- en män -- skas hjär -- ta kun -- nat
    tän -- ka,
    än min -- dre skän -- ka!
} lyricSvTwo = \lyricmode {
    Om tan -- ken fam -- lar då den sö -- ker fin -- na
    ett verk som kun -- de ditt, o Ko -- nung,
    hin -- na,
    hur skul -- le jag med skän -- ker än så
    skö -- na
    din kär -- lek lö -- na?
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Ach, grosser König, gross zu allen
    Zeiten,
    wie kann ich g'nugsam diese Treu'
    ausbreiten?
    Kein's Menschen Herze mag indes
    ausdenken, was dir zu schenken.
} lyricDeTwo = \lyricmode {
    Ich kann's mit meinen Sinnen nicht
    erreichen,
    womit doch dein Erbarmen zu
    vergleichen.
    Wie kan ich dir denn deine Liebstaten
    im Werk erstatten?
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
        \time 4/4

        \repeat volta 2 {
            \partial 4 a'4  |
            a'4 a' gis' e'  |
            a'4 b' c'' c''  |
            d''4( c''16[ b' c''8 ]) b'4\fermata b'  |
          \break
            c''4 d''8[ e''16 f'' ] e''4 c''  |
            %% 5
            f''4 f'' e''8[ d'' ] c''[ d'' ]  |
            d''2 c''4\fermata c''  |
            b'4 a' g'8[ fis' ] e'[ fis' ]  |
          \break
            g'4 g' a' g'  |
            f'2 e'4\fermata e''  |
            %% 10
            d''4 c''8[ b' ] b'2  |
            a'2.\fermata
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
        \time 4/4

        \repeat volta 2 {
            \partial 4 c'8[ d' ]  |
            e'4 e' e' b  |
            e'8[ fis' ] gis'4 a' a'  |
            a'2 gis'4\fermata gis'  |
            a'4 g' g' f'  |
            %% 5
            a'4 a' a' e'  |
            a'4( g' ) g'\fermata a'  |
            a'8[ g' ] g'[ fis' ] e'4 e'  |
            e'8[ d' ] cis'[ d' ] e'4 e'  |
            e'4( d' ) cis'\fermata a'  |
            %% 10
            a'8[ b' ] e'[ d' ] f'4( e'8[ d' ])  |
            cis'2.\fermata
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
        \time 4/4

        \repeat volta 2 {
            \partial 4 a8[ b ]  |
            c'4 c' b gis  |
            a4 d' e' e'  |
            \stemDown f'4( a ) e'\fermata e' \stemNeutral  |
            e'4 b c' a  |
            %% 5
            d'4 d' c' c'  |
            c'4( b ) e'\fermata e'  |
            fis'8[ e' ] c'4 b b  |
            % b4 ais _#'(italic "b") a a  |   %% as saved by rosegarden
            % b4 ais ^\markup\flat   a a  |   %% correct lilypond 2.6.x code
              b4 bes         a a  |   %% actually flattened
            a2 a4\fermata c'  |
            %% 10
            c'8[ b ] a4 a( gis )  |
            e2.\fermata
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
        \time 4/4

        \repeat volta 2 {
            \partial 4 g,4  |
            a,8[ b, ] c[ d ] e[ f ] e[ d ]  |
            c8[ d ] c[ b, ] a,[ e ] a[ g ]  |
            f8[ e f d ] e4\fermata e  |
            a8[ g ] f[ g ] c[ d ] e[ f ]  |
            %% 5
            d8[ e ] f[ g ] a[ b ] a[ g ]  |
            f8[ e f g ] c4\fermata a  |
            dis8[ e ] fis[ dis ] e[ fis ] g[ fis ]  |
            e8[ f ] e[ d ] cis[ a, ] b,[ cis ]  |
            d8[ e f g ] a4\fermata a8[ g ]  |
            %% 10
            fis8[ gis ] a[ f ] \stemUp d([ b, ] e4 ) \stemNeutral  |
            a,2.\fermata
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
    \score { \applymusic #unfold-repeats << \choir %{ \piano %} >> \midi {} } % SATB
    \score { \applymusic #unfold-repeats    \soprano         \midi {} } % S
    \score { \applymusic #unfold-repeats    \alto            \midi {} } % A
    \score { \applymusic #unfold-repeats    \tenor           \midi {} } % T
    \score { \applymusic #unfold-repeats    \bass            \midi {} } % B
    \score { \applymusic #unfold-repeats    \piano           \midi {} } % piano
}

%[[eof]]
