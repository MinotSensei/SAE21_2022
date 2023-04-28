### VARIABLES ###

JC = javac
JCFLAGS = -encoding UTF-8 -implicit:none
JVM = java
JVMFLAGS =

SRCDIR = ./src
OUTDIR = ./out
DOCDIR = ./doc
OFILES = $(subst src/,out/,$(subst .java,.class,$(shell find $(SRCDIR)/ -name *.java)))

### REGLES ESSENTIELLES ###

$(OUTDIR)/%.class : $(SRCDIR)/%.java
	@mkdir -p $(@D)
	${JC} ${JCFLAGS} -cp $(SRCDIR) -d $(@D) $<

$(OUTDIR)/Main.class : $(OFILES)

### REGLES OPTIONNELLES ###

run : $(OUTDIR)/Main.class
	${JVM} ${JVMFLAGS} -cp $(OUTDIR) Main

clean :
	-rm -rf $(OUTDIR)
	-rm -rf $(DOCDIR)

mrproper : clean $(OUTDIR)/Main.class

doc :
	javadoc -d $(DOCDIR) $(SRCDIR)/*.java

### BUTS FACTICES ###

.PHONY : run clean mrproper

### FIN ###
