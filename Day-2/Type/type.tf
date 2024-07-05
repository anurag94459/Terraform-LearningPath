variable name{
    type=string
    default="Anurag"
}

variable Age{
    type=number
}

output ans{
    value="Hello, ${var.name} your Age is ${var.Age}"
}