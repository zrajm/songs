\version "1.9.6"
% incipit for cantus.abc
% written by writeincipit.sh on Fri Sep  7 10:09:36 EDT 2001
originalclef=\notes{\clef "mensural_g"}
firstnote=\notes{\key g \dorian   g'2    }
range=\notes{<fis' f''>4}
modernclef=\notes{\clef "treble"}
keysignature=\notes{\key g \dorian }
timesignature=\notes{\time 3/2  }
%incipit template /home/lconrad/incipit.ly 
incipitwords=\lyrics{ _ _ }
%use this only if necessary
%\property Score.barAlways=##t
incipit = \notes {
\property Voice.NoteHead \override #'style = #'mensural
\originalclef
    \property Staff.TimeSignature \override #'style = #'neo_mensural
\keysignature
\property Staff.TimeSignature \override #'style = #'1style
\timesignature
\firstnote
\bar "|"
% now draw modern clef and key signature in normal font
\property Voice.NoteHead \override #'style = #'baroque
\modernclef
\keysignature
\property Staff.fontSize = #-1
\property Voice.Stem \override #'transparent = ##t
\range
\property Staff.fontSize \unset
\property Voice.Stem \revert #'transparent
\property Staff.barCheckNoSynchronize=##f
\bar "|."
%\property Staff.barCheckNoSynchronize=##t
\context Staff \outputproperty #(make-type-checker 'clef-interface) #'full-size-change = ##t
\property Staff.forceClef = ##t
\modernclef
}

%end incipit
\header {
	composer = "John Dowland"
	crossRefNumber = "1"
	footnotes = "\\\\(1) original has quarter note"
	origin = "From The First Booke of songs or Ayres of foure parts, with Tableture for the Lute"
	tagline = "Lily was here 1.5.3.lec1 -- automatically converted from ABC"
	title = "IIII. If my complaints\\\\Cantus"
}
wordsdefaultVA = \lyrics  {
\incipitwords
\property LyricsVoice . StanzaNumber \override #'break-visibility = #all-visible
\property LyricsVoice . stz = "1."
If
\property LyricsVoice . StanzaNumber \revert #'break-visibility
 my com- plaints could pas- si- ons move,  
or make love see where-  in I suf-  fer wrong:   
O love, I live and  _  die in thee,   
my heart for thy un-  kind-  nesse breakes:   
thou saist thou canst my harmes re-  paire,   
and when I hope, thou makst me hope in vaine.  
}
wordsdefaultVB = \lyrics  {
\incipitwords
My pas-  sions were e-  nough  _  to prove,  
that my de-  spaires had go-  vernd mee too long.    
Thy wounds doe fresh-  ly  _  bleed in mee,  
thy griefe in my deepe sighes still speakes:   
Yet thou dost  hope when I de-  spaire,   
yet for re-  dresse, thou letst me still com-  plaine.  
}
wordsdefaultVC = \lyrics  {
\incipitwords
\property LyricsVoice . StanzaNumber \override #'break-visibility = #all-visible
\property LyricsVoice . stz = "2."
Can
\property LyricsVoice . StanzaNumber \revert #'break-visibility
 love be rich, and yet _ I want?  
Thou plen-  ty hast, yet  _  me dost  _  scant:  
That I do live, it  _  is thy power:  If love doth make mens lives too sowre,  
Die shall my hopes, but not my faith,  
That you that of my fall may hear-  ers be  
}
wordsdefaultVD = \lyrics  {
\incipitwords
Is love my Judge, and yet I am condemnd? 
Thou made a God, and yet thy power con-  temnd.  
That I de-  sire it  _  is thy worth:  
Let me not love, not live hence-  forth.  
May heere des-  paire, which true-  ly faith,  
I was more true to love than love to me.  
}
voicedefault = \notes {
\property Staff.autoBeaming = ##f
\property Staff.minimumVerticalExtent = #'(-4 . 4)
\forgetAccidentals
\property Voice.NoteHead \override  #'style = #'baroque
\property Staff.Custos \override #'style = #'mensural
\property Score.RehearsalMark \set #'extra-offset = #'( -3 . 0 )
\property Score.RehearsalMark \override #'break-visibility = #begin-of-line-invisible
\property Score.defaultBarType="empty"
\incipit

\property Staff.TimeSignature \override #'style = #'1style
\time 3/2 % %MIDI nobarlines
 \key g \dorian   \repeat volta 2 {   g'2    bes'2    ees''2    \bar "|"   d''1 
   c''2    bes'2.    a'4    g'2    \bar "|"   fis'1    r2   \bar "|"     g'2    
a'2    c''2    \bar "|"   bes'2.    bes'4    a'2    \bar "|"   g'2    g'2    
fis'2    \bar "|"   g'1.    }     \repeat volta 2 {   a'2    bes'2    c''2    
\bar "|"   d''1    c''4    bes'4    \bar "|"   bes'1    a'2    \bar "|"   bes'1 
   r2   \bar "|"     d''2    c''2    a'2    bes'1.      a'2 ^"(1)"   g'2.    
g'4    \bar "|"   fis'1.    }     \repeat volta 2 {   d''2    f''2    ees''2    
\bar "|"   d''1    ees''2    \bar "|"   d''1    c''2    \bar "|"   d''1    r2   
\bar "|"     d''2    c''2    d''2    bes'2.    bes'4    a'2    \bar "|"   g'2   
 g'2    fis'2    \bar "|"   g'1.    }   
}\score{
        \notes <<

        \addlyrics
	\context Staff="default"
	{
	    \voicedefault 
	}

	\context Lyrics="default" 
	<<	
	\context LyricsVoice = "default-1"	
	  { \wordsdefaultVA }
	  { \wordsdefaultVB }
	\context LyricsVoice = "default-2"	
	  { \wordsdefaultVC }
	  { \wordsdefaultVD }
	>>

    >>
	\paper {
	   \translator{
\StaffContext
\consists Custos_engraver
}	}
	\midi {}
}
