- reference https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
- Agenda, to provison different pieces of infra
<img width="209" alt="image" src="https://user-images.githubusercontent.com/75510135/130179689-d847e79d-f92f-4056-9893-884daa9fd6f7.png">

# Create VPC with cidr, create main.tf
          terraform {
           required_providers {
               aws = {
                   source = "hashicorp/aws"
                   version = "~>3.0"
               }
           }
          }

          # Configure the AWS provider

          provider "aws" {
              region = "us-east-2"
              access_key = ""
              secret_key = ""
          }


          # Create a VPC

          resource "aws_vpc" "MyLab-VPC"{
              cidr_block = var.cidr_block[0]

              tags = {
                  Name = "MyLab-VPC"
              }

          }
# Variables.tf
          variable "cidr_block" {
              type = list(string)
              default = ["172.20.0.0/16","172.20.10.0/24"]
          }

# Run below cmds to spin the infra
          terraform init
          terrform refresh
          terraform plan
          terraform apply

<img width="691" alt="image" src="https://user-images.githubusercontent.com/75510135/130159828-7b275f45-babe-4227-9851-d6ab9820414f.png">
- below provider/plugin were downloaded into root directory
<img width="593" alt="image" src="https://user-images.githubusercontent.com/75510135/130159883-c7d4325b-ec31-4958-8347-3d03f5ce016a.png">
<img width="507" alt="image" src="https://user-images.githubusercontent.com/75510135/130159984-bffb5377-181e-42e9-af06-4c4c1379de50.png">
<img width="732" alt="image" src="https://user-images.githubusercontent.com/75510135/130160140-59ddf68b-6a7c-43bb-9f25-57bbc80c01c0.png">
<img width="741" alt="image" src="https://user-images.githubusercontent.com/75510135/130160186-b218522e-3c14-4d9b-8b36-0370f101da55.png">
<img width="747" alt="image" src="https://user-images.githubusercontent.com/75510135/130160280-25727dfd-3ebd-4783-9193-1adddfd111dd.png">
- terraform apply 
<img width="613" alt="image" src="https://user-images.githubusercontent.com/75510135/130160398-b81ab35f-ff73-4c3f-b091-cb1fd2557a12.png">

- here is the changes in tfstate n tfstate backup file is created 
<img width="805" alt="image" src="https://user-images.githubusercontent.com/75510135/130160444-b5ca8011-56c7-43f3-8cb6-618e069c07f0.png">
<img width="971" alt="image" src="https://user-images.githubusercontent.com/75510135/130160473-07732c80-1576-46e2-813a-bab7fd13cfc8.png">
<img width="1333" alt="image" src="https://user-images.githubusercontent.com/75510135/130161048-842a4511-f94b-40b3-b48f-66258ffa2fbb.png">

# to destroy the infras
- perform below steps
```
          terraform refresh # to list all the available components
          terraform destroy
```
<img width="962" alt="image" src="https://user-images.githubusercontent.com/75510135/130161254-fbb91992-edc4-4fd1-bbc4-57be58f60ae3.png">
<img width="740" alt="image" src="https://user-images.githubusercontent.com/75510135/130161292-010064f6-b019-4f55-b31b-0005b7f6e6d6.png">

# Configure AWS credentials 
- avoid providing credentials in aws provider section in the code
- run below cmds
```
          aws --version # to confirm cli is installed
          aws configue
```
<img width="348" alt="image" src="https://user-images.githubusercontent.com/75510135/130163015-ef34d3ea-d286-42b9-8dfe-5ab4551e3b44.png">

<img width="756" alt="image" src="https://user-images.githubusercontent.com/75510135/130162748-73cfab61-00f7-4dc0-baf1-6c80ff1776ba.png">
- check below commands again if you can connect to AWS or not
         
                terraform init
                terrform refresh
                terraform plan
                terraform apply
 

# create subnet in vpc
<img width="919" alt="image" src="https://user-images.githubusercontent.com/75510135/130163127-c254f12f-449d-49e3-9027-dfeb992b756a.png">
- just supply 2 cmds here onwards

    terraform plan
    terraform apply --auto-approve # to avoid supply 'y' during run time

# create 04-subnet.tf
          #  Create Subnet
          resource "aws_subnet" "MyLab-Subnet1" {
              vpc_id = aws_vpc.MyLab-VPC.id
              cidr_block = var.cidr_block[1]

              tags = {
                  Name = "MyLab-Subnet1"
              }
          }
<img width="962" alt="image" src="https://user-images.githubusercontent.com/75510135/130163686-7c000556-b531-4f00-bb65-1a90f8ac3e96.png">
<img width="962" alt="image" src="https://user-images.githubusercontent.com/75510135/130163702-5d361a67-ea77-4d1a-b64e-f2729ef9fc72.png">

<img width="962" alt="image" src="https://user-images.githubusercontent.com/75510135/130163897-833e95ee-918c-4095-8a9f-a65468f87c02.png">

# Create an internet gateway (IGw)
<img width="914" alt="image" src="https://user-images.githubusercontent.com/75510135/130164056-87dbeec5-a403-4356-ae02-4d252290cc75.png">
- just supply 2 cmds here onwards

    terraform plan
    terraform apply --auto-approve 

# create 05-igw.tf
          # Create Internet Gateway

          resource "aws_internet_gateway" "MyLab-IntGW" {
              vpc_id = aws_vpc.MyLab-VPC.id

              tags = {
                  Name = "MyLab-InternetGW"
              }
          }
<img width="962" alt="image" src="https://user-images.githubusercontent.com/75510135/130164424-0a4a7733-f0a5-4eaf-a30d-865558245b44.png">
<img width="818" alt="image" src="https://user-images.githubusercontent.com/75510135/130164524-32d35614-19d8-4881-b6a0-f9ce6d80c24a.png">


# create security group ,
- ~ virtual firewall , 
- determine inbound/outbound traffic  like to access EC2 instance 
<img width="918" alt="image" src="https://user-images.githubusercontent.com/75510135/130165133-5a57cdf5-a3d8-49b8-a1f5-8ca35d4cef4d.png">

## update port block in 02-veriables.tf , for ingress/egress
```
variable "cidr_block" {
    type = list(string)
    default = ["172.20.0.0/16","172.20.10.0/24"]
}

variable "ports" {
    type = list(number)
    default = [22,80,443,8080,8081,9000]
}

```

## create 06-securityGroups.tf 
```
        # Create Secutity Group

        resource "aws_security_group" "MyLab_Sec_Group" {
          name = "MyLab Security Group"
          description = "To allow inbound and outbound traffic to mylab"
          vpc_id = aws_vpc.MyLab-VPC.id

          dynamic ingress {
              iterator = port
              for_each = var.ports
               content {
                    from_port = port.value
                    to_port = port.value
                    protocol = "tcp"
                    cidr_blocks = ["0.0.0.0/0"]
               }

          }
          egress {
              from_port = 0
              to_port = 0
              protocol = "-1"
              cidr_blocks = ["0.0.0.0/0"]
          } 

          tags = {
              Name = "allow traffic"
          }

        }
```
- just supply 2 cmds here
```
  terraform plan
  terraform apply --auto-approve 
```
<img width="741" alt="image" src="https://user-images.githubusercontent.com/75510135/130167063-d0aaa1c9-5c50-4feb-ab19-45b7a7b26df3.png">

# Create Route table with association
- RTable => contains route that define to & fro network traffic

<img width="810" alt="image" src="https://user-images.githubusercontent.com/75510135/130169469-2b38427f-a39e-4e9f-aef7-0df2e12e5f8b.png">

## create 07-routeTable.tf
```
  # Create route table and association
  resource "aws_route_table" "MyLab_RouteTable" {
      vpc_id = aws_vpc.MyLab-VPC.id

      route {
          cidr_block = "0.0.0.0/0"
          gateway_id = aws_internet_gateway.MyLab-IntGW.id
      }

      tags = {
          Name = "MyLab_Routetable"
      }
  }

  # Create route table association
  resource "aws_route_table_association" "MyLab_Assn" {
      subnet_id = aws_subnet.MyLab-Subnet1.id
      route_table_id = aws_route_table.MyLab_RouteTable.id
  }
```
- just supply 2 cmds here
```
  terraform plan
  terraform apply --auto-approve 
```
<img width="786" alt="image" src="https://user-images.githubusercontent.com/75510135/130170123-109e33b1-126f-4792-b7f7-46945944a5cd.png">

# create EC2 instance
- look for documentation
<img width="891" alt="image" src="https://user-images.githubusercontent.com/75510135/130170569-eac1996a-d64b-43f3-8a53-c17c684b4a16.png">

- identify AMI, ami-0443305dabd4be2bc
<img width="870" alt="image" src="https://user-images.githubusercontent.com/75510135/130170517-2089b4de-353c-4471-87e2-5fc0d4d06ec8.png">

## update, 02-variables.tf , with ami & instance type
```
                variable "ami" {
                    type = string
                    default = "ami-0443305dabd4be2bc"
                }

                variable "instance_type" {
                    type = string
                    default = "t2.micro"
                }
```

- create 08-ec2Instance.tf
```
                  # Create an AWS EC2 Instance

                  resource "aws_instance" "DemoResource" {
                    ami           = var.ami
                    instance_type = var.instance_type
                    key_name = "tf-deploy"
                    vpc_security_group_ids = [aws_security_group.MyLab_Sec_Group.id]
                    subnet_id = aws_subnet.MyLab-Subnet1.id
                    associate_public_ip_address = true

                    tags = {
                      Name = "Jenkins"
                    }
                  }
```
- just supply 2 cmds here
```
  terraform plan
  terraform apply --auto-approve 
```
<img width="671" alt="image" src="https://user-images.githubusercontent.com/75510135/130172357-85a21e60-ec3a-48e7-9774-7248bfbc681b.png">

# screenshot of all the components created above
<img width="1270" alt="image" src="https://user-images.githubusercontent.com/75510135/130172433-8ae959bc-92b0-4ae8-997b-a5af76507977.png">
<img width="1030" alt="image" src="https://user-images.githubusercontent.com/75510135/130172464-ccc123ae-8f55-4bba-bed0-e2f3bbbd7d83.png">
<img width="1002" alt="image" src="https://user-images.githubusercontent.com/75510135/130172516-3abc6efe-b077-438a-b03b-1a30f9ae6c19.png">
<img width="1016" alt="image" src="https://user-images.githubusercontent.com/75510135/130172544-b559ec97-158a-4481-b208-0ac1a1c450e6.png">
         
# In case , EC2 instance alone to be destroyed
<img width="537" alt="image" src="https://user-images.githubusercontent.com/75510135/130179508-c672673a-6d28-4f9d-bf16-afbf306f7095.png">

- run , terraform apply --auto-approve
