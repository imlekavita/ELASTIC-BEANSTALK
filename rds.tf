#rds.tf
resource "aws_db_subnet_group" "mariadb" {
name = "mariadb-subnet"
description = "RDS subnet group "
subnet_ids = {"${aws_subnet.main-private-1.id}","${aws_subnet.main-private-2.id}"}
}
resource "aws_db_parameter_group" "mariadb-parameters(anydbname)"{
name ="mariadb-parameters"
family = "mariadb1 0.1"
description = "MariaDB parameter group"

parameter {

name = "max_allowed_packet"
value ="16777216"

}
}

#rds.tf
resource "aws_db_instance" "mariadb" {
 allocated_storage = 100  #100 G of storage

engine ="any databaselike mysql, mariadb"
engine_version = "which database use that letest version mention here"
instance_class = "db.t2.micro"
name = "  "/databasename
username = "username"
password = "pssword"
db_subnet_group_name = "if you created in aws mention here"
parameter_group_name = "parametername"

multi_az = "false" #set to true to have high availability: 2 instance synchronised with each other
vpc_security_group_ids =  "if you created vpc security in awss mention here" 

storage_type = "gp2"

backup_retention_period = 30 #how long you're going to keep your backups

availability_zone = "aws subnet availbility zone" 

tag{
name ="mariadb_instance"

}
}