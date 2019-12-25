
resource"aws_security_group"app-prod"{
vpc_id = "from aws"
name = "anything"
description ="security group for app"
egress {

from_port =0
to_port = 0
protocol ="-1"
cidr_block=["0.0.0.0./0"]//anly allowing ip from the data

}


ingress {
//incoming traffic

from_port ="22"
to_port = "22"//tto connect ip address 
protocol ="tcp"
cidr_block=["{}"]//anly allowing ip from the data

}

tags {
Name = "myinstance"
}

}

resource"aws_security_group"app-prod"{
vpc_id = "from aws"
name = "anything"
description ="security group for app"
ingress {

from_port =3306
to_port =3306
protocol ="tcp"
security_group ="[{from aws_security_group.app-prod.id}]"
}


egress {

from_port =0
to_port = 0//tto connect ip address 
protocol ="-1"
cidr_block=["{}"]//anly allowing ip from the data
self= true
}

tags {
Name = "allow-mariadb"
}

}



