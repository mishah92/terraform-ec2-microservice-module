# Terraform EC2 Service Module

This module deploys containerise service on EC2 machine with below and other more capabilities.

- [ASG](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html) 
- [TargetGroup](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html)
- [LauchTempalte](https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchTemplates.html) 
- [IAM](https://aws.amazon.com/iam/)
  
  
## Running Test

Test example is [here](test)

- `$ make validate`  

    Validate the Terraform modules and configurations with values. 
    
- `$ make apply`  

    Deploy the Terraform module.

- `$ make destroy`  

    Destroy the Terraform module. 


## Development

Check [here](terraform) to learn how to use this module.

### Overview

- **Maintainer**: mishalshah92@gmail.com
