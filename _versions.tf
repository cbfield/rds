terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.6"
    }
    random = {
      source  = "hashicorp/random"
      version = " ~>2.0"
    }
  }
}
