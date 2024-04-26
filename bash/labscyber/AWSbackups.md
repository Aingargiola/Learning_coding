# AWS Snapshot Lab
# Objective
Create backups of EC2 instances using AMIs and snapshots.

Demonstrate the import and export of EC2 instances.

Utilize AWS management tools to maintain and restore system configurations.
# Resources

AWS Management Console

[Documentation on EC2, AMIs, Snapshots: AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
# Tasks
# Part 1: Backup & Restore an EC2 Instance
Setup an EC2 Instance:

Launch a Windows 10 EC2 instance using the AWS Management Console. 

Choose an appropriate instance type and configure it with at least 120 GB of storage.

Create an AMI (Amazon Machine Image):

After setting up your instance, create an AMI. This AMI serves as a backup and can be used to launch new instances with the same configuration.

Data Management:

Demonstrate how you manage and name AMIs, ensuring they are clearly labeled with class code or purpose.

Create a Snapshot:

Take a snapshot of the instance’s EBS volume. This snapshot can be used to restore the original data on any new or existing instance.

Instance Deletion and Restoration:

Delete your original EC2 instance.

Restore it by launching a new instance from the AMI you created.

Verify if the "testfile.txt" is present on the desktop and discuss why it is or isn't.

Virtual Hard Drive Management:

Identify and describe the EBS volume associated with your Windows 10 instance.

Discuss the significance of the volume’s ID and the extensions used by AWS compared to .ova or VMware files.
# Part 2: Using AWS Snapshots
Operate with Snapshots:

Take a snapshot while the instance is running.

Add a new file to the desktop.

Restore the instance to the previous snapshot and check if the new file still exists. Explain the result.

Snapshot for Lab Scenarios:

Utilize snapshots at the start of lab scenarios to allow quick reversion if needed.
# Part 3: Lab Documentation

Documenting System Configurations:

Describe how you will document:

EC2 instance details (type, ID, AMI used, etc.)

Network configurations

Security settings (IAM roles, security groups)

Installed software and configurations

Backup strategies (AMI and snapshot schedules)