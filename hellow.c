int hello()
{
 char *data;
 const char text[]="Hello world";

 data = (char*)text;
 printf(" %s", data);

 return 0;
}
