# Lab 8-3 IBM  - State Workspaces

## Part 3

---


## Overview

In this lab, you are going to experiment with terraform workspaces

For this lab and several that follow, the emphasis will not be on writing terraform code but on understanding how Terraform uses workspaces

## Step One - Creating the default deployment

To keep track of your machines, change the name of the EC2 instance to "Default" since it will be deployed in the default workspace


Run `terraform apply` and verify that you have the EC2 machine correctly created

Look in the local directory and note that you have a single state file.

### Step Two - Creating a new workspace

Use the `terraform workspace new dev` command to create a development workspace

To confirm you are in the dev workspace, run `terraform workspace list` and ensure the `*` appears next to `dev`

Also note that a new directory has appeared called `terraform.tfstate.d` Check inside this directory to confirm that there is a `dev` directory. This is empty because we haven't created anything in this workspace.

Change the name tag of the EC2 code so that the deployed machine will have the name "Development"

Run `terraform apply` and confirm that a new instance appears, and the one your previously deployed is unaffected. This is a parallel deployment

Check the local `terraform.tfstate.d/dev` directory and confirm there is a new state file. This records the state of the `dev` deployment

## Step Three - Removing the deployment from the dev workspace

If you switch workspaces back to the default workspace and run `terraform plan` Terraform will use the state file for the default workspace which is now out of sync with the source code

Switch back to the dev workspace and run `terraform plan` again. No changes are required because terraform is now using the dev workspace state file that _is_ in sync with the source code

Run `terraform destroy` and remove the dev workspace deployment

## Step Four - Remove the deployment from the default workspace

Switch back to the default workspace using `terraform workspace select default`

Run `terraform workspace delete dev`

Run `terraform destroy` to remove the default deployment


Confirm visually in the console that both deployments are now removed


## Using git

To avoid problems with unintentional overwriting of the Terraform code, the best practice is to save the code in a git repository and use a different git branch for each workspace

Remember that git is versioning the Terraform source code, _not the workspaces_. Terraform manages the versioning of the workspaces.

## Step One

In the lab directory you just used, add the following .gitignore file to avoid versioning the Terraform managed file. This file is also in the code directory for Lab 8-3.

Tag the VM with the name "production"

```gitignore
**/.terraform/*

*.tfstate
*.tfstate.*

.terraform.lock.hcl

```

Create a .git repository in the directory you are using and commit the .gitignore file and **only the `*tf` files that will be changed**.

Now run `terraform apply` to create the production deployment

## Part Two - Branch

The AWS solution does not work for the IBM Terraform code we have.

What is the solution to make it work?

## End Lab