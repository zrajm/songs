# [2006-03-30, 11:37-15:19]
#
# [2006-03-31]
#
# [2006-04-01] v1.0 - Makefile is now fully functional


# TODO:
#
#   o Use variable LILYPONDFLAGS to pass args to lilypond -- and, if possible,
#     only generate the relevant files.
#
#   o Fix PNG stuff.
#
#   o add {soprano,alto,tenor,bass,comp} targets (from $(VOICE_NAMES) if
#     possible)
#
#   NB: Some command (namely `timidity' and `ecasound') does not set their
#   respective return values. This is bad, but below I use some awk-some
#   (awk-ward?) magic to parse for error messages/warnings in their respective
#   output. The use of make's `.DELETE_ON_ERROR' then makes sure that partial
#   and/or mangled output from these programs is removed.


###############################################################################
##                                                                           ##
##  Settings                                                                 ##
##                                                                           ##
###############################################################################


SHELL = /bin/ash

.SUFFIXES:
.SUFFIXES: .ly .midi .ogg .pdf .png .ps .wav


# When mixing voices together, one (primary voice) gets its $(PRI_VOICE_VOL),
# while all other voices get their respective $(SEC_VOICE_VOL).
FULL_NAME     :=     all
VOICE_NAMES   := soprano  alto  tenor  bass  comp  # voice/part name
VOICE_NUMBERS :=       1     2      3     4     5  # voice/part number
PRI_VOICE_VOL :=     100   100    100   100   100  # primary voice volume
SEC_VOICE_VOL :=      20    20     20    20    50  # secondary voices' volume


SRC  := $(basename $(wildcard *.ly))               # source file(s) w/o ext
FULL := $(addsuffix -0-$(FULL_NAME), $(SRC))


# list of separate parts' files to generate (*-1-soprano, *-2-alto etc.)
VOICES := $(foreach DOC, $(SRC), \
	$(foreach NUM, $(VOICE_NUMBERS), \
		$(DOC)-$(NUM)-$(word $(NUM), $(VOICE_NAMES)) \
	) \
)

# These files are created by lilypond, but we rename them to something a tad
# bit more informative; however should be removed when clean:ing (as they might
# remain if lilypond compilation step was interrupted).
LILYPOND_MIDI = $(foreach DOC, $(SRC), \
		$(DOC).midi \
		$(foreach NUM,$(VOICE_NUMBERS), \
			$(DOC)-$(NUM).midi \
		) \
	)


MIDI := $(addsuffix .midi,$(FULL) $(VOICES))
OGG  := $(addsuffix .ogg, $(FULL) $(VOICES) $(addsuffix -mixed, $(VOICES)))
PDF  := $(addsuffix .pdf, $(SRC))
PNG  := $(addsuffix .png, $(SRC)) # FIXME: PNG not correct in multipage documents!!
PS   := $(addsuffix .ps,  $(SRC))
WAV  := $(addsuffix .wav, $(FULL) $(VOICES) $(addsuffix -mixed, $(VOICES)))


# Function for finding the first instance of a program in environment's $PATH.
# (From: [http://www.gnu.org/software/make/manual/html_mono/make.html])
pathsearch = $(firstword $(wildcard $(addsuffix /$(strip $(1)),$(subst :, ,$(PATH)))))

NICE     := $(if $(call pathsearch, nice), nice -n99)# non-required command
ECASOUND := ecasound
TIMIDITY := timidity
OGGENC   := oggenc

# test availability of above commands
$(foreach PROGRAM, ECASOUND OGGENC TIMIDITY, \
	$(if $(call pathsearch, $(firstword $($(PROGRAM)))),, \
		$(error Missing required progam "$(firstword $($(PROGRAM)))") \
	) \
)




###############################################################################
##                                                                           ##
##  Suffix Rules                                                             ##
##                                                                           ##
###############################################################################


# Conversion of Lilypond MIDI filenames.
# (e.g.: src.midi -> src-0-all.midi, src-1.midi -> src-1-soprano.midi)
$(foreach I, 0-$(FULL_NAME) $(VOICE_NAMES), %-$I.midi): %.midi
	@mv -v "$<" "$@"


# FIXME: Currently touches any files that are missing after running Lilypond
# (likely to go missing are MIDI files for non-existant voices) -- this seems
# to allow the -mixed parts to be generated, but it's pretty ugly. Is there a
# way to make -mixing gracefully allow for missing parts instead (without
# fucking up dependencies and such)? /zrajm [2006-04-01]

# Create PDF, PostScript and PNG from Lilypond source.
$(foreach NUM,$(VOICE_NUMBERS), %-$(NUM).midi) %.midi %.pdf %.png %.ps: %.ly
	@echo "\033[1m$^ -> $@\033[0m"
	lilypond --pdf --ps --png "$?"
	@for x in $(foreach NUM, $(VOICE_NUMBERS), "$*-$(NUM).midi"); do \
		if [ ! -e "$$x" ]; then \
			touch "$$x"; \
		fi; \
	done;



# NB: The below include some awk-some magic to clean up after ecasound if it
# fails (ecasound does not return with non-zero exit status if it fails when
# writing a file; e.g. if disk space runs out). /zrajm [2006-04-01]
%-mixed.wav: $(addsuffix .wav, $(VOICES))
	@echo "\033[1m$^ -> $@\033[0m"
	$(NICE) $(ECASOUND) -z:mixmode,sum $(strip \
		$(foreach I, $(VOICE_NUMBERS), -a:$(I) \
			-i:"$(word $(I), $^)" \
			-ea:$(strip \
				$(if $(filter %-$(I)-$(word $(I),$(VOICE_NAMES)),$*), \
					$(word $(I), $(PRI_VOICE_VOL)), \
					$(word $(I), $(SEC_VOICE_VOL)) \
				) \
			) \
		) -a:all -o:"$@" | \
			awk '/WARNING:/ { BAD=1 }; { print }; END { exit BAD }' \
	)



%.ogg: %.wav
	@echo "\033[1m$^ -> $@\033[0m"
	$(OGGENC) "$?"


# NB: The below include some awk-some magic to clean up after timidity if it
# fails (timidity does not return with non-zero exit status if it fails during
# a write -- only if it initially fails to open the output file for writing --
# so output is parsed for timidity error messages). /zrajm [2006-04-01]
%.wav: %.midi
	@echo "\033[1m$^ -> $@\033[0m"
	$(strip $(NICE) $(TIMIDITY) "$^" -Ow -o "$@" | \
		awk '/^$@:/ { BAD=1 }; { print }; END { exit BAD }' \
	)



###############################################################################
##                                                                           ##
##  Main Rules                                                               ##
##                                                                           ##
###############################################################################


# Commands
.PHONY: all clean help midi mixed ogg score pdf png ps wav

# don't consider wav files important
.INTERMEDIATE: $(WAV) $(LILYPOND_MIDI)

.DELETE_ON_ERROR:

# build all .pdb files
all: midi ogg score


# Commands on the 2nd line below should made to work as intermediate files,
# which are auto-erased by make, and need not be erased here.
clean:
	@rm -fv $(MIDI) $(OGG) $(PDF) $(PNG) $(PS)
	@rm -fv $(LILYPOND_MIDI) $(WAV)

help:
	@echo 'You may use:'
	@echo '  all       - build all files (default)'
	@echo '  clean     - remove generated files'
	@echo '  help      - display this info'
	@echo '  midi      - build all MIDI files'
	@echo '  mixed     - build mixed MIDI files'
	@echo '  ogg       - build all Ogg files'
	@echo '  score     - build all scores (PDF, PNG and PostScript)'
	@echo '  pdf       - build PDF document'
	@echo '  png       - build PNG image'
	@echo '  ps        - build PostScript document'
	@echo '  wav       - build all wav (normally not kept after building)'
	@echo
	@echo 'FIXME: Should also make lilypond only generate requested parts, i.e. if you'
	@echo 'request PDF, then the PS shouldn'\''t be built (nor overwritten if already'
	@echo 'present).'


midi:  $(MIDI)
mixed: $(filter %-mixed.ogg, $(OGG))
ogg:   $(OGG)
score: $(PDF) $(PNG) $(PS)
pdf:   $(PDF)
png:   $(PNG)
ps:    $(PS)
wav:   $(WAV)


.PHONY: t
t:
	@echo $(OGG)|sed 's/ /\n/g'

#[[eof]]
