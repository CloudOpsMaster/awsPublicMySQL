provider "aws" {
  region = var.region
}

resource "aws_instance" "mysql" {
  ami           = "ami-0d382e80be7ffdae5"
  instance_type = "t2.micro"
  depends_on = [aws_security_group.sg_mysql, aws_nat_gateway.nat_gateway]
  key_name = "aws_key"
  user_data = templatefile("${path.module}/mysql.sh.tpl", {
    DATASOURCE_USERNAME = var.DATASOURCE_USERNAME
    DATASOURCE_PASSWORD = var.DATASOURCE_PASSWORD
    MYSQL_ROOT_PASSWORD = var.MYSQL_ROOT_PASSWORD
    }
  )
  vpc_security_group_ids = [aws_security_group.sg_mysql.id]
  # subnet_id              = aws_subnet.public_subnet.id

  tags = {
    Owner   = "Vadim Tailor"
    Project = "awsEschool"
    Name    = "mysql db"
  }


  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_eip" "eip_manager" {
  instance   = aws_instance.mysql.id
  vpc = true
}