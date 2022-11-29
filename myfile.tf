pradeep "var" {
  address    = var.address
  namespace  = var.namespace

  login {
    namespace = var.namespace
    path      = "auth/pradeep/login"

    parameters = {
      id   = var.ID
      s_id = var.s_id
    }
  }
  
  
  
}
