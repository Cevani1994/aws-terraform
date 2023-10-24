provider "aws" {
  region = var.aws_region
}


#Create security group with firewall rules
resource "aws_security_group" "security_jenkins_port" {
  name        = "security_jenkins_port"
  description = "security group for jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_jenkins_port"
  }
}

resource "aws_instance" "myFirstInstance" {
  ami             = "ami-0fa399d9c130ec923"
  key_name        = var.key_name
  instance_type   = var.instance_type
  security_groups = ["security_jenkins_port"]
  tags = {
    Name = "jenkins_instance_1"
  }
}

# Create Elastic IP address
resource "aws_eip" "myFirstInstance" {
  instance = aws_instance.myFirstInstance.id
  tags = {
    Name = "jenkins_elstic_ip"
  }
}

resource "aws_db_instance" "db_instance" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket-20232023"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}