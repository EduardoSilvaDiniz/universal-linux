//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

//	{" ", 	"~/.config/suckless/scripts/pacupdate",		3600,	10},

	{"", 	"~/.config/suckless/scripts/battery",		30,		0},

	{"", 	"~/.config/suckless/scripts/brightness",	1,		0},

//	{" ", 	"~/.config/suckless/scripts/weather",		3600,	0},

	{" ", 	"~/.config/suckless/scripts/volume",		1,		0},

	{" ", 	"~/.config/suckless/scripts/ram",			5,		0},
	
//	{" ", 	"~/.config/suckless/scripts/cpu",			5,		0},

	{"", 	"~/.config/suckless/scripts/disk",		    3600,	0},

    {" ", 	"~/.config/suckless/scripts/upt",		    1,      0},

	{" ", 	"~/.config/suckless/scripts/date",			30,		0},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
