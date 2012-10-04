/*
* Change/query the brightness of LCD screen.
*/

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
FILE *fp;
int bright = 0;
const char *kFileName = "/sys/class/backlight/acpi_video0/brightness";

fp = fopen(kFileName, "r");
fscanf(fp, "%d", &bright);
fclose(fp);

switch (argc) {
case 1:
printf("%d\n", bright);
break;
case 2:
fp = fopen(kFileName, "w");
bright += atoi(argv[1]);
fprintf(fp, "%d\n", bright);
fclose(fp);
break;
default:
fprintf(stderr, "Usage: lcd-brightness [value]\n");
return -1;
}

return 0;
}
