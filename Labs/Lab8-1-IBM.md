
# Lab 8-1 IBM  - Working with State

## Part 1

---

## Overview

In this lab, you are going to experiment with Terraform state

For this lab and several that follow, the emphasis will not be on writing terraform code but on understanding how terraform uses state to manage cloud resources

The starting code for this lab is in the Code directory for this lab the Code directory


## Step One - Setting up


Create two VM instances with terraform names "X" and "Y"
- Give each instance a unique `Name` tag value

Run `terraform apply` and verify that you have the two VM instances "X" and "Y" running

## Step Two - Removing a definition from terraform

Recall that your `*tf` files are __your__ directions to Terraform as to what actions to take

Comment out the definition of instance "X"

Run terraform apply and notice that terraform removes the instance from AWS to satisfy the requirements of the edited `*.tf` file 

Uncomment out the definition and run `terraform apply` again notice that terraform recreates the AWS resource to satisfy the requirements of the source code.

## Step Three - Removing a resource from the Cloud

For this step, go to the IBM console and terminate the instance "X" manually 

Run `terraform apply` and notice terraform sees the instance is missing and recreates it

## Step Four - Modifying an instance

Ensure that your instance "X" is up and running

Change the Name tag to something other that the original tag

Run `terraform apply` and notice that Terraform has realized that what is now running does not match what is in the source code

Terraform changes the Name tag back to what is in the `*tf` file


## Step Five - Non-destructive changes

In some cases, if we change the description of a resource in the *tf file, terraform can make the change "in place" by modifying the existing resource

Depending on a number of factors, Terraform may actually recreate the instance if it is unable to modify in place.

In your definition of instance "X", change the instance type to a "bx2d-2x8"

Run `terraform apply` and notice that Terraform changes the existing instance
- This is like terraform unplugging a hard drive from one computer and plugging it back into a different computer

## Step Six - Destructive Changes

In some cases, the changes specified cannot be applied to the existing resource. In this case Terraform destroys the old resource and creates a new one that matches the changed specification

The current ami in the example is a Debian instance with an image = r006-f259b449-f3d4-4924-8d67-61201f728068
Change the definition of instance "X" to use a Centos image with a image = r006-bb322b53-e1b2-4968-bc60-60c99ac50729

 Run `terraform apply` and notice that Terraform has to recreate the instance.


## Cleanup

Run `terraform destroy`

Change the image for instance X back to "ami-0c101f26f147fa7fd"

Change the instance type back to "b2d-2x8"

Save your work, you will be modifying it in the next lab

