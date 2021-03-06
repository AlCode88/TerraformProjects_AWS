resource "aws_db_instance" "terraform_rds" {
  allocated_storage         = 10      # storage size
  engine                    = "mysql" # engine of the db 
  engine_version            = "5.7"   # engine version
  instance_class            = "db.t3.micro"
  identifier                = "${var.env}-rds" # identifier is the name for the db in the console like tags
  name                      = "maindb"         # The actual database name inside of the db not the console name, and you can setup only one db creatinon
  username                  = "admin"          # it is the user name for the db inside 
  password                  = random_password.db_random_password.result
  skip_final_snapshot       = var.skip_snapshot                                            #false # this setting is either to keep the snapshot or not, by defualt it is set to true but we can use the variable and make it reusable
  final_snapshot_identifier = var.skip_snapshot == true ? null : "${var.env}-rds-snapshot" # "If" condition, true ? null : "name_snapshot" this value.
  vpc_security_group_ids = [ aws_security_group.RDS_security_group.id ]
  apply_immediately = true
  # parameter_group_name = "default.mysql5.7" - # it is a settings inside for he db  
}

resource "aws_security_group" "RDS_security_group" {
  name        = "${var.env}-rds-sg"
  description = "Allow from self and local laptop"

  tags = {
    Name = "${var.env}-WebeserverSecurityGroup"
  }
}

# RDS Security Group Rule
resource "aws_security_group_rule" "ingress-rds" {
  description       = "Allow from self and local laptop"
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.RDS_security_group.id
}
resource "aws_security_group_rule" "local_laptop" {
  description       = "ingress from local port"
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["76.245.14.60/32"] # you need to specify the ip from where you want to check the connection, it is a testing purpose.
  security_group_id = aws_security_group.RDS_security_group.id
}