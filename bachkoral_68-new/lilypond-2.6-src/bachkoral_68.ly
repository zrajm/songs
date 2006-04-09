\version "2.6.0"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                           %%
%%  Settings                                                                 %%
%%                                                                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\header {
    dedication = \markup \small "http://zrajm.klingonska.org/songs/"
    title = "Bachkoral nr. 68"
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
    Sänd Her -- re, di -- na äng -- lar ut,
    att sjä -- len må vid li -- vets slut
    av dem till him -- len fö -- ras.
}
lyricSvTwo = \lyricmode {
    Och låt min tröt -- ta kropp i ro
    sig vi -- la i sitt tys -- ta bo,
    tills där Din röst skall hö -- ras.

    Då skall jag, klädd i he -- lig skrud,
    med mi -- na ö -- gon skå -- da Gud
    och av hans nåd och här -- lig -- het
    mig fröj -- da i all e -- vig -- het
    O Je -- su Krist,
    ack, bön -- hör mig, ack, bön -- hör mig.
    I liv och död jag till -- hör dig.
}
% Original German lyrics
lyricDeOne = \lyricmode {
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% FIXME: Hyphenation needs to be fixed for German lyrics to work! %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Ach Herr, lass dein lieb' Engelein
    am letzten End' die Seele mein
    in Abrahams Schoss tragen!
}
lyricDeTwo = \lyricmode {
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
        \set Staff.autoBeaming    = ##f
        \set Staff.midiInstrument = \midiChoirInstrument
        \set Staff.instrument     = \labelSoprano
        \set Staff.instr          = \shortSoprano

        \clef treble
        \time 4/4

        \repeat volta 2 {
            \partial 4 c'' 4  |
            b'4 a' g' f'8[ e' ]  |
            a'4 a' g'\fermata c''  |
            b'4 a' g' f'8[ e' ]  |
            a'4 a' g'\fermata g'  |
          \break
            %%5
            a'4 b' c''8[ d'' ] e''4  |
            d''4( c''2 b'4 )  |
            c''2.
        }
        \partial 4 c''4  |
        c''4 d'' c''8[ b' ] a'[ b' ]  |
        c''4 c'' b'\fermata b'  |
        c''4 d'' c''8[ b' ] a'[ b' ]  |
      \break
        %% 10
        c''8[ e'' ] d''4 b'\fermata e''  |
        e''4 e'' d'' c''  |
        c''4 b' c''\fermata b'  |
        c''4 b' a' g'  |
        g'4 fis' g'\fermata e''  |
      \break
        %% 15
        d''4 c'' b'\fermata e''  |
        f''8[ e'' ] d''4 e'' c''  |
        c''4 b' c''\fermata c''  |
        c''4 c'' d'' c''  |
        c''2. b'4  |
        c''2.\fermata
        \bar "|."
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
            \partial 4 g'4  |
            g'4 e' e' d'8[ c' ]  |
            c'4 f' e'\fermata e'  |
            e'8[ d' ] c'[ d' ] e'[ d' ] c'[ b ]  |
            c'8[ d' ] d'4 e'\fermata e'  |
            %% 5
            f'8[ a' ] g'[ f' ] e'[ d' ] c'4  |
            d'2( e'4 f' )  |
            e'2.
        }
        \partial 4 e'4  |
        f'4 f' e'4. e'8  |
        d'8[ e' ] fis'4 g'\fermata g'  |
        g'4 f' e' f'  |
        %% 10
        g'4 a' g' g'  |
        g'4 a' a' f'  |
        e'4 d' e'\fermata f'  |
        e'4 d'8[ g' ] e'4 e'  |
        e'4 d' d'\fermata c'  |
        %% 15
        d'8[ e'16 f' ] e'8[ fis' ] gis'4\fermata a'  |
        a'4 gis'8[ a' ] e'4 e'  |
        es'8[ d' ] d'4 e'\fermata e'  |
        f'4 f' f' e'  |
        d'2 d'  |
        e'2.\fermata
        \bar "|."
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
            \partial 4 e'4  |
            d'4 c' b bes  |
            a8[ g ] a[ b ] c'4\fermata e8[ f ]  |
            g4 a8[ b ] c'4 f8[ g ]  |
            \stemUp a8[ c' ] b[ a ] \stemNeutral b4\fermata c'  |
            %% 5
            c'8[ f' ] e'[ d' ] c'[ g ] bes4  |
            a2( g )  |
            g2.
        }
        \partial 4 g4  |
        a4 a a8[ b ] c'[ b ]  |
        a4 d' d'\fermata d'  |
        g4 g g d'  |
        %% 10
        c'8[ b ] a4 d'\fermata c'  |
        c'4 c' d' d'  |
        g4 g g\fermata d'  |
        g8[ a ] b4 c' b  |
        c'8[ b ] a4 b\fermata g8[ a ]  |
        %% 15
        b4 c'8[ a ] e'4\fermata a  |
        d'8[ c' ] b[ a ] b4 a  |
        a4 g g\fermata bes  |
        a8[ b ] c'4 g g  |
        a2 g  |
        g2.\fermata
        \bar "|."
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
            \partial 4 c4  |
            g4 a e g  |
            f4 f, c\fermata a,  |
            e4 f c8[ b, ] a,[ g, ]  |
            f,4 f e\fermata c  |
            %% 5
            f4 g a8[ b, ] c4  |
            f,4( fis, g,2 )  |
            c2.
        }
        \partial 4 c4  |
        f8[ e ] d4 a, a8[ g ]  |
        fis8[ e ] d4 g\fermata g8[ f ]  |
        e8[ d ] c[ b, ] c4 d  |
        %% 10
        e4 fis g\fermata c  |
        c'8[ b ] a[ g ] f[ g ] a[ f ]  |
        g4 g, c\fermata d  |
        e8[ fis ] g[ e ] c[ d ] e[ c ]  |
        a,4 d g,\fermata c  |
        %% 15
        g4 a e\fermata cis  |
        d8[ e ] f4 gis, a,  |
        fis4 g c\fermata c  |
        f8[ g ] a4 b, c  |
        fis,2 g,  |
        c,2.\fermata
        \bar "|."
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
