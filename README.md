Create Ubuntu EC2 on AWS using Terraform

Terraform Steps:

1. Intsall Terraform CLI

2. Create providers.tf file

# Which containes the provider information


3. Initialize the directory

# Make sure you are in the directory that contains the tf files then do the follosing:
terraform init


4. Create main.tf file

# That containes the resources that you will build ex: EC2 instence specs


5. Create security.tf file

# That containes the security group attached to the ec2 instence 
# Also the keypair that will be used to connect on the ec2 instence


6. Create variables.tf file

# That containes all the variables with the data that will be shared on the version control


7. Create terraform.tfvars file

# That contains the variables that you will not share it on the version control
# Add your public ssh key to the terraform.tfvars
# Remember to add the tfvars file to .gitignore file


8. Check what will be created before applying

# This command is to check and show if there is an error before applying it 
terraform plan


9. Build the Infrastructure

# This command is start building the infrastructure on the cloud  
terraform apply # It will first show your the plan then you have to type yes to build
# OR 
terraform apply -auto-approve # To plan and apply changes without confirming


10. Connect to the created EC2 instence

# Make sure you are in the directory where the keypair was downloaded   
ssh -i "file.pem" <ubuntu@PublicIP>


11. Destroy created resources

# This command will show you first what it will destroy then ask you to type yes to confirm
terraform destroy
# OR
terraform destroy -auto-approve # To immediately destroy all the created resources without confirming 
EC2 Provisioning:

1. Use the script.sh

Create a script.sh file on the EC2 which will install docker, add docker to sudo group and create docker volumes

vim scipt.sh
Copy and Past the data inside the script.sh in the current directory

Make sure the created script has executable permission using the following command:

chmod +x script.sh
Run the Script:

./script.sh
Run the Application

Option 1:

Use either the following command to run a container without volumes exposing the application to port 8080:

docker run -it -p 80:80 -p 3306:3306 appertaopeneyes/web-allin1
Option 2:

Or the following command using the created docker volumes:

docker run -it --name "openeyes" -v oe-web:/var/www/openeyes -v oe-db:/var/lib/mysql -p 80:80 -p 3306:3306 appertaopeneyes/web-allin1
Accessing Application

Replace the PublicIP with the real EC2 PublicIP you get from the following command:

terraform output
Navigate to the browser and open the following URL : http://EC2_PublicIP