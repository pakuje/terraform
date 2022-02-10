    resource_group_name  = "terraform_test"
    storage_account_name = "stopkjterraform"
    container_name       = "teraformstate"
    key                  = "terraform.tfstate" // blob file 이름
    /* Service Principal에 기여자로 등록해놨기에 access_key가 필요 없음
    access_key = ""   */   
