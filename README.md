# AWS Terraform Resources

This Terraform configuration deploys AWS resources for a Jenkins server. It includes the following components:

1. **Security Group**: It creates a security group for Jenkins, allowing incoming traffic on ports 8080 and 22, and outgoing traffic to all ports.

2. **EC2 Instance**: Launches an EC2 instance using the specified Amazon Machine Image (AMI), key pair, and security group. The instance type is set to t2.micro.

3. **Elastic IP**: Associates an Elastic IP address with the EC2 instance.

## Prerequisites

Before using this Terraform configuration, make sure you have:

- AWS CLI configured with your credentials.
- Terraform installed on your local machine.

## Usage

1. Clone this repository to your local machine.

2. Create a `terraform.tfvars` file in the same directory with your custom variables. For example:

```hcl
aws_region = "us-east-1"
key_name = "your-ssh-key-name"
instance_type = "t2.micro"
