# Create Ubuntu EC2 on AWS using Terraform


## EC2 Provisioning:


### Run the Application
Use either the following command to run a container without volumes exposing the application to port 8080:
```
docker run -it -p 80:80 -p 3306:3306 appertaopeneyes/web-allin1
```
Or the following command using the created docker volumes:
```
docker run -it --name "openeyes" -v oe-web:/var/www/openeyes -v oe-db:/var/lib/mysql -p 80:80 -p 3306:3306 appertaopeneyes/web-allin1
```

## Accessing Application



# project-openeye_test
