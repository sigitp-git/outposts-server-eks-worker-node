To change your directory colors, open up your ~/.bashrc file with your editor

nano ~/.bashrc
and make the following entry at the end of the file:

LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
Some nice color choices (in this case 0;35 it is purple) are:

Blue = 34
Green = 32
Light Green = 1;32
Cyan = 36
Red = 31
Purple = 35
Brown = 33
Yellow = 1;33
Bold White = 1;37
Light Grey = 0;37
Black = 30
Dark Grey= 1;30
The first number is the style (1=bold), followed by a semicolon, and then the actual number of the color, possible styles (effects) are:

0   = default colour
1   = bold
4   = underlined
5   = flashing text (disabled on some terminals)
7   = reverse field (exchange foreground and background color)
8   = concealed (invisible)
The possible backgrounds:

40  = black background
41  = red background
42  = green background
43  = orange background
44  = blue background
45  = purple background
46  = cyan background
47  = grey background
100 = dark grey background
101 = light red background
102 = light green background
103 = yellow background
104 = light blue background
105 = light purple background
106 = turquoise background
107 = white background
All possible colors:

30  = black
31  = red
32  = green
33  = orange
34  = blue
35  = purple
36  = cyan
37  = grey
90  = dark grey
91  = light red
92  = light green
93  = yellow
94  = light blue
95  = light purple
96  = turquoise
97  = white
These can even be combined, so that a parameter like:

di=1;4;31;42
in your LS_COLORS variable would make directories appear in bold underlined red text with a green background!

To test all these colors and styles in your terminal, you can use one of:

for i in 00{2..8} {0{3,4,9},10}{0..7}
do echo -e "$i \e[0;${i}mSubdermatoglyphic text\e[00m  \e[1;${i}mSubdermatoglyphic text\e[00m"
done

for i in 00{2..8} {0{3,4,9},10}{0..7}
do for j in 0 1
   do echo -e "$j;$i \e[$j;${i}mSubdermatoglyphic text\e[00m"
   done
done
You can also change other kinds of files when using the ls command by defining each kind with:

bd = (BLOCK, BLK)   Block device (buffered) special file
cd = (CHAR, CHR)    Character device (unbuffered) special file
di = (DIR)  Directory
do = (DOOR) [Door][1]
ex = (EXEC) Executable file (ie. has 'x' set in permissions)
fi = (FILE) Normal file
ln = (SYMLINK, LINK, LNK)   Symbolic link. If you set this to ‘target’ instead of a numerical value, the color is as for the file pointed to.
mi = (MISSING)  Non-existent file pointed to by a symbolic link (visible when you type ls -l)
no = (NORMAL, NORM) Normal (non-filename) text. Global default, although everything should be something
or = (ORPHAN)   Symbolic link pointing to an orphaned non-existent file
ow = (OTHER_WRITABLE)   Directory that is other-writable (o+w) and not sticky
pi = (FIFO, PIPE)   Named pipe (fifo file)
sg = (SETGID)   File that is setgid (g+s)
so = (SOCK) Socket file
st = (STICKY)   Directory with the sticky bit set (+t) and not other-writable
su = (SETUID)   File that is setuid (u+s)
tw = (STICKY_OTHER_WRITABLE)    Directory that is sticky and other-writable (+t,o+w)
*.extension =   Every file using this extension e.g. *.rpm = files with the ending .rpm
A more complete list is available at Bigsoft - Configuring LS_COLORS.

On some distributions, you might also want to change the background color for ow "(OTHER_WRITABLE) whose default is non-readable" for example to non-bold blue text on green background.

You could use for instance LS_COLORS="$LS_COLORS:di=1;33" at the end of your .bashrc file, to get a nice readable bold orange text on black background.

After you alter your .bashrc file, to put the changes in effect you will have to restart your shell or run source ~/.bashrc.

Note: You can combine more commands with a colon, for example

LS_COLORS=$LS_COLORS:'di=1;33:ln=36' ; export LS_COLORS; ls
Source:

COLORS Lscolors - Linux StepByStep
Geek Gumbo - Changing the Directory Color in Bash
