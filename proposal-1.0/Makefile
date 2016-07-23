TARGET_PRE=libraryInfrastructure
TARGET=$(TARGET_PRE).sgml
TARGET_PS=$(TARGET_PRE).ps

output: pdf html ps him

html:
	docbook2html $(TARGET)

ps:
	docbook2ps $(TARGET)

pdf:
	docbook2ps $(TARGET)

upload:
	cd ../../ && tar -zcvf libraryInfrastructure.tgz libraryInfrastructure && scp libraryInfrastructure.tgz ijones@www.haskell.org:~/ && ssh ijones@www.haskell.org 'mv ~/libraryInfrastructure ~/libraryInfrastructure.old' && ssh ijones@www.haskell.org 'tar -zxvf ~/libraryInfrastructure.tgz'

view: ps
	gv $(TARGET_PS)

him:
	cd HIM2003Talk && latex LIP.tex && dvipdf LIP.dvi && dvips LIP.dvi
