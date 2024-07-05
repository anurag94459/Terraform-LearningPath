variable "users"{
    type = list
}

output result{
    value="Hello, ${var.users[1]}"
}

output upper1 {
  value=upper(var.users[0])
}
output lower1 {
  value=lower(var.users[1])
}
output title1 {
  value=title(var.users[2])
}