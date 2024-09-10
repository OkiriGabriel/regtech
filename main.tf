
module "module" {
  source = "./modules"

  eks_cluster_name              = var.eks_cluster_name
  eks_node_group_desired_size   = var.eks_node_group_desired_size
  eks_node_group_max_size       = var.eks_node_group_max_size
  eks_node_group_min_size       = var.eks_node_group_min_size
  eks_node_group_instance_types = var.eks_node_group_instance_types
  eks_cluster_version = var.eks_cluster_version

  db_name = "regtech_db"
  db_username = var.db_username
  db_password = var.db_password

  s3_bucket_name =  var.s3_bucket_name

 

    vpc_cidr = "10.0.0.0/16"
    public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets = ["10.0.3.0/24", "10.0.4.0/24"] 

    db_instance_class = var.db_instance_class
   iam_role_name = var.iam_role_name
   instance_type = var.instance_type
   key_name = var.key_name
   log_retention_in_days = var.log_retention_in_days
 
}

