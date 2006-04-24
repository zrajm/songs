SOUNDS: Finished.
SCORES: Finished.

TODO

    o Remove indentation of first system?

    o Hyphens and glissandos should be allowed to become zero in length in
      lyrics. (But this should never happen to spaces.)

        \context {
            \Lyrics
                % FIXME: allow hyphens to be removed when syllables are close together
                % [http://www.mail-archive.com/lilypond-user@gnu.org/msg15771.html]
                % [http://www.lilypond.org/doc/v2.6/Documentation/user/lilypond/
                %    Hyphens-and-extenders.html]
                % [http://www.lilypond.org/doc/v2.6/Documentation/user/lilypond-internals/
                %    lyric_002dhyphen_002dinterface.html]
                %\override SeparationItem #'padding = #0.1
                %\override LyricHyphen  #'minimum-length = #0.7
        }

    o Time signature should be a compound 2/3:6/4 (and respective measure
      should prolly be tagged with the apropriate \time 3/2 or \time 6/4), see
      also [http://www.lilypond.org/doc/v2.6/input/test/lily-1299846131.ly]
      (from [http://www.lilypond.org/doc/v2.6/input/test/collated-files.html])

      The font used by the compound time signature in the above reference web
      page does intclude '+', but not ':' so a time signature like 2/3 : 6/4
      must be produced some other way. (Using part of the :| barline maybe?)

    o Add a right arrow below the system(s) at end of page, if there are more
      pages. (Should be done automatically at each page break.)

    o Left align first word of lyrics on each page, and right align last (can
      it be done?)


HISTORY

24 April 2006: Added stanza numbers on all pages (not just first one) and
separated verses in lyrics with some extra whitespace. Changed title and pages
footer (making them more compact, and getting some more space for the scores
themselves). Top margin shold allow for binder holes, page footer should (if
one need to make holes on that side of the page) fit between holes (of the
Swedish four-hole standard, that is).

23 April 2006: Added second verse. And continued to tweak score layout,
smaller lyrics font, and smaller line height for the lyrics font makes
everything fit.

22 April 2006: Fixed score layout. Changed score to landscape format, tweaked
lyrics font size to make last repeat fit onto the last page. Now there's
exactly one repeat per page, which is nice when singing. Increased tempo
somewhat -- sounds more natural now.

21 April 2006: Had forgot to specify that the lute part also should be in E
flat major. Added \key, and added `es' to a bunch of E's and B's. (And
suddenly it sounds good too!) Turned relevant hyphens and apostrophes into
unicode dito.

20 April 2006: Converted old score file to a strictly Lilypond/GNU make based
one, totally eliminating the need for Rosegarden. Transcribed lute part from
notes to lilypond source code, realized that << { VOICE1 } \\ { VOICE2 } >> is
the way to create multiple voices.

30 March 2006: Did something more.

28 March 2006: Did something.

23 March 2006: Copied SATB voices scores from paper using Rosegarden 4 (GUI),
and then exporting it to lilypond.

25 January 2006: Received the scores on paper.
