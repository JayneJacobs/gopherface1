export GOPHERFACE_APP_ROOT="home/gopherface/gopherface"

gopherface@gopherface:~/gopherface$ ./gopherface
127.0.0.1 - - [04/Feb/2019:02:52:26 +0000] "GET / HTTP/1.1" 200 0

When I use /login 

``` 
2019/02/04 02:38:00 Error encountered while parsing the template: %!(EXTRA *os.PathError=openhome/gopherface/gopherface/templates/loginform.html: no such file or directory)
2019/02/04 02:38:00 Encountered panic: runtime error: invalid memory address or nil pointer dereference
home page handler reached
127.0.0.1 - - [04/Feb/2019:02:38:06 +0000] "GET / HTTP/1.1" 200 0
```

getting error

```sh gopherface@gopherface:~/gopherface$ ls -la templates/
total 96
drwxr-xr-x 3 gopherface gopherface 4096 Jan 24 13:42 .
drwxrwxr-x 5 gopherface gopherface 4096 Feb  4 02:15 ..
-rw-r--r-- 1 gopherface gopherface 1225 Jan 24 13:42 feed_content.html
-rw-r--r-- 1 gopherface gopherface   91 Jan 24 13:42 feed_page.html
-rw-r--r-- 1 gopherface gopherface   16 Jan 24 13:42 footer.html
-rw-r--r-- 1 gopherface gopherface  413 Jan 24 13:42 friends_content.html
-rw-r--r-- 1 gopherface gopherface   94 Jan 24 13:42 friends_page.html
-rw-r--r-- 1 gopherface gopherface 1031 Jan 24 13:42 gatedheader.html
-rw-r--r-- 1 gopherface gopherface  695 Jan 24 13:42 gopherprofile_content.html
-rw-r--r-- 1 gopherface gopherface  100 Jan 24 13:42 gopherprofile_page.html
-rw-r--r-- 1 gopherface gopherface  361 Jan 24 13:42 header.html
-rw-r--r-- 1 gopherface gopherface  280 Jan 24 13:42 imagepreview.html
-rw-r--r-- 1 gopherface gopherface    0 Jan 24 13:42 index.html
-rw-r--r-- 1 gopherface gopherface  896 Jan 24 13:42 loginform.html
```
