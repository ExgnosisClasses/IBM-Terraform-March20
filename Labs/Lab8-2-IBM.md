# Lab 8-2 OBM  - Working with State

## Part 2

---

## Overview

In this lab, you are going to experiment with `terraform state` commands

For this lab and several that follow, the emphasis will not be on writing terraform code but on understanding how terraform uses state

### Depends On

The starting code for this lab is in the solution folder for lab 8-1

## Step One - Setting up

Using the same code you started the last lab with

Run `terraform apply` and verify that you have the two instances "X" and "Y" running

## Step Two - Removing a resource from terraform control

Run the `terraform state list` command to see that you have two instances under Terraform control

```console
$ terraform state list
ibm_is_instance.X
ibm_is_instance.Y
ibm_is_ssh_key.my_ssh_key
ibm_is_subnet.my_subnet
ibm_is_vpc.my_vpc
ibm_resource_group.my_rg
```

Run the command `terraform state show ibm_is_instance.X` to see a full specification of the resource

Run the command `terraform state rm ibm_is_instance.X`

Run the command `terraform state list` to verify that "X" is no longer under terraform control

Check the IBM console to verify that the compute resource was _not_ destroyed

Run `terraform plan` to see that terraform no longer can see the running resource and will now create a new one to satisfy the requirement of the `*tf` file

__Don't run apply just yet -- only plan__

## Step Three - Importing the resource

The `terraform import` command allows us to bring any existing resource under terraform control

We do need to have a terraform specification that matches the attributes of the resource
- We have that in ibm_is_instance.X

Go to the IBM console and copy the instance ID of "X"

Execute the command _terraform import aws_instance.X <<instance id of X>>_

Run `terraform state list` to verify the instance is now under Terraform management.


## Step Four - Renaming a resource

Create a copy of the Terraform code for the ibm_is_instance.X and call it `ibm_is_instance.Z`

Also change the Name of the new `Z` instance from "myvmx" to "myvmy"

Run the `terraform state list` command to see what is under Terraform control

Enter the command `terraform state mv ibm_is_instance.X ibm_is_instance.Z` to rename the instance.

The goal of this is to continue manging the instance but under a different Terraform name.

RUn the `terraform state list command` to confirm the state.

Since you no longer need the `X` instance, delete its definition from the Terraform code.

Run  `terraform plan` to see the changes that will take place.

Run `terraform apply` to see the renamed resource

## Step Four - Tainting

At the command line, run `terraform plan` to see that no changes are needed.

Taint the `X` instance by executing `terraform taint ibm_is_instance.Y`

Rerun `terraform plan` to see that now the resource needs to be recreated

Untaint the `Y` instance by executing `terraform untaint ibm_is_instance.Y`

Rerun `terraform plan` to see that now the resource is no longer tainted and the configuration is up-to-date.

### Cleanup

Run `terraform destroy`

