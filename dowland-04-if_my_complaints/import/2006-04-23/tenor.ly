\version "1.9.6"
% incipit for tenor.abc
% written by writeincipit.sh on Fri Sep  7 10:09:41 EDT 2001
originalclef=\notes{\clef "petrucci_c3"}
firstnote=\notes{   d'2    }
range=\notes{<f f'>4}
modernclef=\notes{\clef "G_8"}
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
	footnotes = "\\\\Original clef C on third line"
	origin = "From The First Booke of songs or Ayres of foure parts, with Tableture for the Lute"
	tagline = "Lily was here 1.5.3.lec1 -- automatically converted from ABC"
	title = "IIII. If my complaints\\\\Tenor"
}
wordsdefaultVA = \lyrics  {
\incipitwords
\property LyricsVoice . StanzaNumber \override #'break-visibility = #all-visible
\property LyricsVoice . stz = "1."
If
\property LyricsVoice . StanzaNumber \revert #'break-visibility
 my com- plaints could pas- sions move, could pas- sions move, or make love see  
where-  in I suf-  fer wrong: O love, I live  _  and  _  die, I live and die in thee, thy griefe  
in my   _  deepe sighes deepe sighs  still  _  speakes: Yet thou dost hope when I de-  spaire, and when I   
hope, thou makst me hope in  _  vaine.   
}
wordsdefaultVB = \lyrics  {
\incipitwords
My pas-  sions were e-  nough  to prove, e-  nough to prove,  that my de-  spaires 
had go-  vernd mee too long.  Thy wounds doe fresh -  ly  bleed  _  do fresh-  ly bleed  in mee, my hart  
for thy  _  un-  kind un-  kind-  nesse  _  breakes: thou saist thou canst my harmes re-  paire, yet for re-    
dresse, thou letst me still com-  _  plaine.   
}
wordsdefaultVC = \lyrics  {
\incipitwords
\property LyricsVoice . StanzaNumber \override #'break-visibility = #all-visible
\property LyricsVoice . stz = "2."
Can
\property LyricsVoice . StanzaNumber \revert #'break-visibility
 love be rich, and yet I want? and yet I want, Thou plen- ty hast,  
yet me  _  dost  _  scant: That I do live,  _  it  _  is, I live it is thy power: If love  
doth make  _  mens lives, mens lives, too  _  sowre, Die shall my hopes, but not my faith, That you that  
of my fall may hear-  ers  _  be  
}
wordsdefaultVD = \lyrics  {
\incipitwords
Is love my Judge, and yet I am con-  demnd? con-  demned? Thou made a God, 
and yet thy power con-  temnd. That I de-  sire  _  it  _  is, I de-  sire it, thy worth: Let me  
not love,  _  not live, not live, hence-  _  forth. May heere des-  paire, which true-  ly faith, I was more  
true to love than love to  _  me.  
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
\time 3/2 % %MIDI transpose -12
 % %MIDI nobarlines
 \key g \dorian \clef "G_8"
   \repeat volta 2 {   bes2    d'2    c'2    bes4    g4    bes2    ees'2    d'2 
   d'4    d'2    g4    a1    r4   g4    g1    fis2    g2      d'2    d'2    g2  
  a2.    a4    g1.    } 

\repeat volta 2 {   f2.    bes2    a4    bes4.    c'8   
 d'4    f'4    ees'4    d'4    c'4    bes4    c'2.    c'4    bes1.    g2    c'2 
     d'2.    c'4    bes4    a4    g2    a2    bes2    a4    g4    a1.    
} \repeat volta 2 {   bes2    d'2    c'2    bes1    c'2    d'2    ees'1    d'1. 
   f'2    f'2.    f'4      d'1    r4   f4    g4    a4    bes4    g4    a2    
g1.    }   
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
