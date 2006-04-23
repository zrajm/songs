\version "1.9.6"
% incipit for altus.abc
% written by writeincipit.sh on Fri Sep  7 11:02:00 EDT 2001
originalclef=\notes{\clef "petrucci_c2"}
firstnote=\notes{\key g \minor   d'2.    }
range=\notes{<a bes'>4}
modernclef=\notes{\clef "treble"}
keysignature=\notes{\key g \minor }
timesignature=\notes{\time 3/2  }
%incipit template /home/lconrad/incipit.ly 
incipitwords=\lyrics{ _ _ }
%use this only if necessary
%\property Score.barAlways=##t
incipit = \notes {
\property Voice.NoteHead \override #'style = #'mensural
\originalclef
    \property Staff.TimeSignature \override #'style = #'1style
\keysignature
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
	footnotes = "\\\\Original clef C on second line\\\\Yes, he really has two flats for the altus and only one on the other parts."
	origin = "From The First Booke of songs or Ayres of foure parts, with Tableture for the Lute"
	tagline = "Lily was here 1.5.3.lec1 -- automatically converted from ABC"
	title = "IIII. If my complaints\\\\Altus"
}
wordsdefaultVA = \lyrics  {
\incipitwords
\property LyricsVoice . StanzaNumber \override #'break-visibility = #all-visible
\property LyricsVoice . stz = "1."
If
\property LyricsVoice . StanzaNumber \revert #'break-visibility
 my com- plaints could pas- si- ons move, or make love see where- in I  
suf-  fer wrong: O love, I live  _   _  I live  and die in thee, thy griefe in  _  my deepe  
sighes deepe sighs  still speakes: Yet thou dost hope dost hope when I de-  spaire, and when I   
hope, thou makst thou makst me hope in vaine.  
}
wordsdefaultVB = \lyrics  {
\incipitwords
My pas-  sions were e-  nough  _  to prove, that my de-  spaires had go-  vernd 
mee too long.  Thy wounds doe fresh-  _   _  ly fresh-  ly bleed in mee, my heart for  _  thy un-    
kind un-  kind-  nesse breakes: thou saist thou canst thou canst my harmes re-  paire, yet for re-    
dresse, thou letst thou letst me still com-  plaine.  
}
wordsdefaultVC = \lyrics  {
\incipitwords
\property LyricsVoice . StanzaNumber \override #'break-visibility = #all-visible
\property LyricsVoice . stz = "2."
Can
\property LyricsVoice . StanzaNumber \revert #'break-visibility
 love be rich, and yet I _ want? Thou plen- ty hast, yet _  
me dost  _  scant: That I do live,  _   _  it is  _  thy  _  power: If  _  love doth   
make  _  mens  _  lives too sowre, Die shall my hopes,  _  but  _  not my faith, That you that  
of my fall  _  may  _  hear-  ers be  
}
wordsdefaultVD = \lyrics  {
\incipitwords
Is love my Judge, and yet I am condemnd? Thou made a God, and yet thy  
power con-  temnd. That I de-  sire  _   _  it is  _  thy  _  worth: Let  _  me not love,  _   
not  _  live hence-  forth. May heere des-  paire,  _  which  _  true-  ly faith, I was more  
true to love  _  than  _  love to me.  
}
voicedefault = \notes {
\property Staff.autoBeaming = ##f
\forgetAccidentals
\property Voice.NoteHead \override  #'style = #'baroque
\property Staff.Custos \override #'style = #'mensural
\property Score.RehearsalMark \set #'extra-offset = #'( -3 . 0 )
\property Score.RehearsalMark \override #'break-visibility = #begin-of-line-invisible
\property Score.defaultBarType="empty"
\incipit
|
\property Staff.TimeSignature \override #'style = #'1style
\time 3/2 % %MIDI nobarlines
 \key g \minor   \repeat volta 2 {   d'2    g'2    g'2    g'1.    g'2    f'2    
bes4    c'4    d'1.    ees'2    c'2    a2    d'2    g'2    f'2    c'2      d'2. 
   c'4    b1.    } \repeat volta 2 {   f'2    d'2    ees'2    d'4.    ees'8    
f'4    d'4    g'2    ees'2    f'2.    ees'4    d'1.    r4   d'4    e'4    g'2   
 fis'4    g'2.    f'4      ees'4    d'4    d'1    c'2    d'1.    
} \repeat volta 2 {   f'2.    bes'2    a'4    bes'2.    a'4    g'2    f'2    
g'2.    g'4    fis'1.    r4   bes'4    a'2.    a'4      g'2.    g'4    f'4    
d'4    bes4    c'4    d'2.    c'4    b1.    }   
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
