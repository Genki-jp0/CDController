#include "stdafx.h"

#define CD_DRIVE_OPEN	1
#define CD_DRIVE_CLOSE	2

void CD_OpenCloseDrive(BOOL bOpenDrive, TCHAR cDrive);
void CD_OpenCloseAllDrives(BOOL bOpenDrives); 

int ShowUsage()
{
	printf("2021 written by XP Pro.\n");
	printf("usage:\n");
	printf("    CDR </o|/c> [Drive|ALL]\n");
	printf("example:\n");
	printf("    CDR /o E:\n");
	printf("    CDR /c ALL\n");
	printf("Explanation:\n");
	printf("    /o : ejects cd tray\n");
	printf("    /c : closes cd tray\n");
	return(0);
}

BOOL ParseOptions(int argc, char* argv[], int& nOpenClose, TCHAR& cDrive)
{
	if(argc < 2) return(FALSE); 
	if(argc > 3) return(FALSE);	

	nOpenClose = 0;
	if(stricmp(argv[1], "/o") == 0) nOpenClose = CD_DRIVE_OPEN;
	if(stricmp(argv[1], "/c") == 0) nOpenClose = CD_DRIVE_CLOSE;
	if(nOpenClose == 0) return(FALSE);

	if(argc == 2)
	{
		cDrive = 1;
		return(TRUE);
	}

	// .:. argc == 3

	if((stricmp(argv[2], "all") == 0) || (strcmp(argv[2], "*") == 0))
	{
		// ALL drives
		cDrive = 0;
		return(TRUE);
	}

	LPCTSTR szDrive = argv[2];
	int nLen = strlen(szDrive);
	if(nLen > 2) return(FALSE);		// Not "D" or "D:"
	if((nLen == 2) && (szDrive[1] != ':')) return(FALSE); // 2 Chars, but second isn't a ":"
	
	// Get Drive Letter
	cDrive = szDrive[0];
	if((cDrive >= 'a') && (cDrive <= 'z'))
		cDrive = cDrive - 32;	


	if( (cDrive < 'A') || (cDrive > 'Z') )
		return(FALSE);


	return(TRUE);
}

int main(int argc, char* argv[])
{

	int   nOpenClose;	
	TCHAR cDrive;       

	if(!ParseOptions(argc, argv, nOpenClose, cDrive))
		return ShowUsage();

	if(cDrive == 0)
	{
		CD_OpenCloseAllDrives((nOpenClose == CD_DRIVE_OPEN));
	}
	else
	{
		switch(nOpenClose)
		{

		case CD_DRIVE_OPEN:
			CD_OpenCloseDrive(TRUE, cDrive);
			break;
		case CD_DRIVE_CLOSE:
			CD_OpenCloseDrive(FALSE, cDrive);
			break;
		}
	}

	return(0);
}

void CD_OpenCloseDrive(BOOL bOpenDrive, TCHAR cDrive)
{
	MCI_OPEN_PARMS op;
	MCI_STATUS_PARMS st;
	DWORD flags;

	TCHAR szDriveName[4];
	strcpy(szDriveName, "X:");

	::ZeroMemory(&op, sizeof(MCI_OPEN_PARMS));
	op.lpstrDeviceType = (LPCSTR) MCI_DEVTYPE_CD_AUDIO;
	
	if(cDrive > 1)
	{
		szDriveName[0] = cDrive;
		op.lpstrElementName = szDriveName;
		flags = MCI_OPEN_TYPE | MCI_OPEN_TYPE_ID | MCI_OPEN_ELEMENT | MCI_OPEN_SHAREABLE;
	}
	else flags = MCI_OPEN_TYPE | MCI_OPEN_TYPE_ID | MCI_OPEN_SHAREABLE;

	if (!mciSendCommand(0,MCI_OPEN,flags,(unsigned long)&op)) 
	{
		st.dwItem = MCI_STATUS_READY;

		if(bOpenDrive)
			mciSendCommand(op.wDeviceID,MCI_SET,MCI_SET_DOOR_OPEN,0);
		else
			mciSendCommand(op.wDeviceID,MCI_SET,MCI_SET_DOOR_CLOSED,0);

		mciSendCommand(op.wDeviceID,MCI_CLOSE,MCI_WAIT,0);
	}
}

void CD_OpenCloseAllDrives(BOOL bOpenDrives)
{
    int nPos = 0;
    UINT nCount = 0;
    TCHAR szDrive[4];
	strcpy(szDrive, "?:\\");

    DWORD dwDriveList = ::GetLogicalDrives ();

    while (dwDriveList) {
        if (dwDriveList & 1) 
		{
            szDrive[0] = 0x41 + nPos;
			if(::GetDriveType(szDrive) == DRIVE_CDROM)
				CD_OpenCloseDrive(bOpenDrives, szDrive[0]);
        }
        dwDriveList >>= 1;
        nPos++;
    }
}

