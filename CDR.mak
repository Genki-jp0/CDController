# Microsoft Developer Studio Generated NMAKE File, Based on CDR.dsp
!IF "$(CFG)" == ""
CFG=CDR - Win32 Debug
!MESSAGE No configuration specified. Defaulting to CDR - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "CDR - Win32 Release" && "$(CFG)" != "CDR - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CDR.mak" CFG="CDR - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CDR - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "CDR - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "CDR - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\CDR.exe"


CLEAN :
	-@erase "$(INTDIR)\CDR.obj"
	-@erase "$(INTDIR)\CDR.pch"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\CDR.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\CDR.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CDR.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\CDR.pdb" /machine:I386 /out:"$(OUTDIR)\CDR.exe" 
LINK32_OBJS= \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CDR.obj"

"$(OUTDIR)\CDR.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "CDR - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\CDR.exe"


CLEAN :
	-@erase "$(INTDIR)\CDR.obj"
	-@erase "$(INTDIR)\CDR.pch"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\CDR.exe"
	-@erase "$(OUTDIR)\CDR.ilk"
	-@erase "$(OUTDIR)\CDR.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\CDR.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ  /c 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\CDR.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib winmm.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\CDR.pdb" /debug /machine:I386 /out:"$(OUTDIR)\CDR.exe" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\CDR.obj"

"$(OUTDIR)\CDR.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("CDR.dep")
!INCLUDE "CDR.dep"
!ELSE 
!MESSAGE Warning: cannot find "CDR.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "CDR - Win32 Release" || "$(CFG)" == "CDR - Win32 Debug"
SOURCE=.\CDR.cpp

"$(INTDIR)\CDR.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\CDR.pch"


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "CDR - Win32 Release"

CPP_SWITCHES=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\CDR.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CDR.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "CDR - Win32 Debug"

CPP_SWITCHES=/nologo /MLd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /Fp"$(INTDIR)\CDR.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ  /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\CDR.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 


!ENDIF 

