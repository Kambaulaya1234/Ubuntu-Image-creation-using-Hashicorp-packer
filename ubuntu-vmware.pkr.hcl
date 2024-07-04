packer {
  required_plugins {
    vmware = {
      version = ">= 1.0.11"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

source "vmware-iso" "ubuntu" {
  iso_url        = "file://K:/SetUps/Operating systems/Linux/ubuntu-22.04.3-desktop-amd64.iso"
  iso_checksum   = "a435f6f393dda581172490eda9f683c32e495158a780b5a1de422ee77d98e909"
  communicator   = "ssh"
  ssh_username   = "packer"
  ssh_password   = "packer"
  vm_name        = "packer-ubuntu"
  disk_size      = 20000
  memory         = 4096
  cpus           = 2
  ssh_timeout    = "50m"  # Increased timeout

  boot_wait = "5s"
  boot_command = [
    "<esc><wait>",
    "<esc><wait>",
    "<enter><wait>",
    "/install/vmlinuz<wait>",
    " auto<wait>",
    " console-setup/ask_detect=false<wait>",
    " console-setup/layoutcode=us<wait>",
    " console-setup/modelcode=pc105<wait>",
    " debconf/frontend=noninteractive<wait>",
    " debian-installer=en_US<wait>",
    " fb=false<wait>",
    " initrd=/install/initrd.gz<wait>",
    " kbd-chooser/method=us<wait>",
    " locale=en_US<wait>",
    " netcfg/get_hostname=ubuntu<wait>",
    " netcfg/get_domain=vm<wait>",
    " -- <wait>",
    "<enter><wait>"
  ]

  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
}

build {
  sources = ["source.vmware-iso.ubuntu"]

  provisioner "shell" {
    inline = [
      "echo 'Provisioning...'",
      "sudo apt-get update",
      "sudo apt-get install -y open-vm-tools",   # Install open-vm-tools
      "sudo apt-get install -y vim",             # Install vim editor
      "sudo timedatectl set-timezone Africa/Nairobi"  # Set timezone to UTC+03:00 Nairobi
    ]
  }
}

