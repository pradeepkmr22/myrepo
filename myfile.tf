mounica "var" {
  address    = var.address
  namespace  = var.namespace

  login {
    namespace = var.namespace
    path      = "auth/mounica/login"

    parameters = {
      id   = var.ID
      s_id = var.s_id
    }
  }
  
  
  
}

variable "something" {
description = "version  name per https://prdaevgvhjvbb"
string # no default for required variable
default     = "v14
" }
variable "something" {
description = "version  name per https://prdaevgvhjvbb"
string # no default for required variable
default     = "v14"
 }