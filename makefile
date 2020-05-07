include config.mk


allObjs = $(allSrcs:.c=.o)
allDeps = $(allSrcs:.c=.d)

$(FinalTargetName) : CFLAG = 
$(allObjs): CFLAG =-c
$(allDeps): CFLAG =-MM


$(FinalTargetName) :
	@$(CC) -MM $(fileSrc1) -o $(fileDep1)
	@call progress.bat
	@call progress.py 13
	@$(CC) -MM $(fileSrc2) -o $(fileDep2)
	@call progress.bat
	@call progress.py 13
	@$(CC) -MM $(fileSrc3) -o $(fileDep3)
	@call progress.bat
	@call progress.py 13
	@$(CC) -MM $(fileSrc4) -o $(fileDep4)
	@call progress.bat
	@call progress.py 13
	@$(CC) -MM $(fileSrc5) -o $(fileDep5)
	@call progress.bat
	@call progress.py 13
	@$(CC) -MM $(fileSrc6) -o $(fileDep6)
	@call progress.bat
	@call progress.py 13
	@mkdir Dependencies  
	@copy /y $(fileDep1) Dependencies\ > nul  
	@copy /y $(fileDep2) Dependencies\ > nul  
	@copy /y $(fileDep3) Dependencies\ > nul  
	@copy /y $(fileDep4) Dependencies\ > nul
	@copy /y $(fileDep5) Dependencies\ > nul
	@copy /y $(fileDep6) Dependencies\ > nul    
	@$(CC) -c $(fileSrc1) -o $(fileObj1)
	@call progress.bat
	@call progress.py 13
	@$(CC) -c $(fileSrc2) -o $(fileObj2)
	@call progress.bat
	@call progress.py 13
	@$(CC) -c $(fileSrc3) -o $(fileObj3)
	@call progress.bat
	@call progress.py 13
	@$(CC) -c $(fileSrc4) -o $(fileObj4)
	@call progress.bat
	@call progress.py 13
	@$(CC) -c $(fileSrc5) -o $(fileObj5)
	@call progress.bat
	@call progress.py 13
	@$(CC) -c $(fileSrc6) -o $(fileObj6)
	@call progress.bat
	@call progress.py 13
	@$(CC) $(allObjs) -o $(FinalTargetName)
	@call progress.bat
	@call progress.py 13


$(allObjs) : %.o : %.c 
	@$(CC) $(CFLAG)  $< -o $@
	@call progress.bat
	@call progress.py 6


$(allDeps) : %.d : %.c | Dependencies
	@$(CC) $(CFLAG)  $< -o $@
	@call progress.bat
	@call progress.py 6
	@copy /y $@ Dependencies\ > nul



Dependencies:
	@mkdir $@

.PHONY: clean link onlyCompile depend all

clean:  $(file >progress.txt,0)
	@DEL /Q $(FinalTargetName) $(allObjs) $(allDeps) Dependencies\* > nul
	@rmdir Dependencies > nul

link: 
	@$(CC) $(allObjs) -o $(FinalTargetName)
	@call progress.bat
	@call progress.py 1  
  

onlyCompile: $(allObjs)

depend: $(allDeps)

all:  
	@$(MAKE) $(FinalTargetName)

