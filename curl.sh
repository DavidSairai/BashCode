#!/bin/bash

#Below is the scripts to get bulk URL status code on Linux box. 

#1.	Update the Linux instance – ‘sudo yum update’
#2.	Create a folder/file - ‘touch urls’
#3.	Type ‘ls’ to check if the folder/file is created
#4.	Open the folder – ‘vi urls’
#5.	Type ‘I’ to insert the content. In this case it will be all the URLs for which you need to check the status codes.
#6.	Press ‘esc’ key to exit the insert option
#7.	Save the contents typing - :wq!  and click on enter key
#8.	Now copy paste the below script and enter:

for i in $(cat urls);
do echo "$(curl -s -w" %{http_code}\\n" $i -o '/dev/null') - $i";
done

#Result – You’ll get the HTTP error codes for all the URLs. 
#You can use the same folder each time to check the HTTP error codes for different URLs.

#PS: Make sure to check the URLs in windows instances for HTTP 200 error code. This is to ensure that the content is removed/deleted. 

