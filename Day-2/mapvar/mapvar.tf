variable "users" {
    type = map
    default={
    gaurav=20
    anurag=21
    }
}

variable "name"{
    type = string
}

output "result"{
    value="Hello, Anurag your age is ${lookup(var.users,"anurag")}"
}


//To perform the same operation dynamically
output "dynamic"{
    value="Hello, ${var.name} your age is ${lookup(var.users,"${var.name}")}"
}