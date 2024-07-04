# Ubuntu-Image-creation-using-Hashicorp-packer
HashiCorp Packer is an open-source tool for creating identical machine images for multiple platforms from a single source configuration. Packer is lightweight, runs on every major operating system, and is highly performant, creating machine images for multiple platforms in parallel

#Key Features of Packer:
        Automated Image Creation: Automates the creation of machine images for multiple platforms, such as VMware, AWS, Google Cloud, and more.
        Configuration as Code: Uses configuration files to define the entire image creation process, making it easy to version and manage.
        Idempotency: Ensures that repeated executions result in the same machine image, leading to consistent environments.

#Using Packer to Create a VM Image on VMware Workstation
Here's a step-by-step guide to creating a VM image on VMware Workstation using HashiCorp Packer:

#Prerequisites
        Install Packer: Download and install Packer from the HashiCorp website.
        Install VMware Workstation: Ensure you have VMware Workstation installed on your machine.
        Obtain an ISO File: Have the ISO file for the operating system you want to install (e.g., Ubuntu).
1. Install Packer:
       Download and install Packer from the official download page.
       Add Packer to your system's PATH.
2. Create a Packer Configuration File:
       Create a new directory for your Packer configuration.
       Create a Packer template file (ubuntu-vmware.pkr.hcl) just as the template i've created.
3.Run Packer Build:
       Open a terminal or command prompt.
       Navigate to the directory containing your Packer template file.
       Run the following command to start the build process:

#PS C:\Users\Emmanuel\Desktop\monday> packer init ubuntu-vmware.pkr.hcl
#PS C:\Users\Emmanuel\Desktop\monday> packer validate ubuntu-vmware.pkr.hcl
#PS C:\Users\Emmanuel\Desktop\monday> packer build ubuntu-vmware.pkr.hcl 
