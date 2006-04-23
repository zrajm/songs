\version "1.9.6"
% incipit for bassus.abc
% written by writeincipit.sh on Fri Sep  7 10:09:43 EDT 2001
originalclef=\notes{\clef "mensural_f"}
firstnote=\notes{   b,2    }
range=\notes{<g, g>4}
modernclef=\notes{\clef "bass"}
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
	footnotes = "\\\\(1)Rest is editorial."
	origin = "From The First Booke of songs or Ayres of foure parts, with Tableture for the Lute"
	tagline = "Lily was here 1.5.3.lec1 -- automatically converted from ABC"
	title = "IIII. If my complaints\\\\Bassus"
}
wordsdefaultVA = \lyrics  {
\incipitwords
\property LyricsVoice . StanzaNumber \override #'break-visibility = #all-visible
\property LyricsVoice . stz = "1."
If
\property LyricsVoice . StanzaNumber \revert #'break-visibility
 my com- plaints could pas- sions move, _  
or make love see  _  where-  _  in I suf-  fer wrong:   
O love, I live and  die in thee, thy griefe thy   
griefe in my deepe sighes still speakes:   
and when I hope, thou makst, thou makst, me   hope in vaine.  
}
wordsdefaultVB = \lyrics  {
\incipitwords
My pas-  sions were e-  nough to prove,   _  
that my de-  spaires  _  had  _  go-  vernd mee too long.    
Thy wounds doe fresh-  ly  bleed in mee, my heart my  
heart for thy un-  kind-  nesse breakes:   
yet for re-  dresse, thou letst, thou letst, me   still com-  plaine.  
}
wordsdefaultVC = \lyrics  {
\incipitwords
\property LyricsVoice . StanzaNumber \override #'break-visibility = #all-visible
\property LyricsVoice . stz = "2."
Can
\property LyricsVoice . StanzaNumber \revert #'break-visibility
 love be rich, and yet I want? _  
Thou plen-  ty hast,  _  yet  _  me  _  dost scant:  _   
That I do live, it is thy power: If love, if love, doth  
make mens lives too sowre,  That you that of my fall, my fall may  
hear-  ers be  
}
wordsdefaultVD = \lyrics  {
\incipitwords
Is love my Judge,_and yet I am con-  demnd? 
Thou made a God,  _  and  _  yet thy power con-  temnd.  
That I de-  sire it is thy worth: Let me, let me,  not  
love, not live hence-  forth.  I was more true to love, to love, than  
love to me.  
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
\time 3/2 % %MIDI transpose -24
 % %MIDI nobarlines
 \key g \dorian \clef bass
   \repeat volta 2 {   g,2    g,2    g,2    g,1.    g,2    bes,2    ees2    d2. 
   c4      b,2    c2    a,1    g,4.    a,8    bes,4    c4    d2    ees!2    d2  
  d2    g,1.    } \repeat volta 2 {     d2    d2    c2    bes,1    ees2    g2   
 f1    bes,1.    bes,2    a,2    d2      g,2    g2.    g4    f2    ees!2.    e4 
   d1.    } \repeat volta 2 {     r\longa     r\breve ^"(1)"   bes,2    f2    
d2    g4    g,4    bes,4    c4    d2    ees2      d2    d2    g,1.    }   
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
