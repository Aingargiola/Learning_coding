---
marp: true
paginate: true
---



---

# Overview
Backup Your System

- Backing up your computer configuration and/or data is an essential part of establishing a working “baseline,” or known good configuration.
- Your client or employer’s data is sacred. Make a habit of proactively protecting that data and mitigating risks.

---
# Objectives
- Create a backup .ova of Windows 10 and demonstrate .ova import.
- In Windows 10, create a system restore point and perform a restore operation.


---
# Resources
https://www.maketecheasier.com/import-export-ova-files-in-VirtualBox/

# Tasks
# Part 1: Backup & Restore a Windows 10 VM with VirtualBox
1. By now, you’re familiar with installing Ubuntu Linux and Windows 10 from scratch using their source .iso disk images. Moving forward, we usually won’t be installing things from .iso; there are much more efficient methods such as exporting/importing VirtualBox’s .ova image file.
2. If you have not done so yet in Ops 102, create an .ova of your Windows 10 VM.
Demonstrate in your submission today how you’ll be sorting .ova image files and that you have enough storage. At minimum, 120 GB of space on a second disk is required, and .ova files should be organized and named with their class code or purpose.
3. Staying organized is vital to succeed in Ops, where you’re handling multiple computers and parts at any given time.
4. Create a file “testfile.txt” on the desktop within the Windows 10 VM.
5. Delete the VM (and all associated data) using VirtualBox Manager.
6. Import your .ova file as a new VM. The .ova file was created in Ops 102.
7. Access the VM; is your testfile.txt present on the desktop? Why/why not?
8. Identify in your system where the VM hard drive file is located that is associated with your Windows 10 VM.
9. What is this file?
10. What does the extension signify?
11. What extension would a VMware hard drive file use instead?
12. How is it different from your .ova file?

---

# Part 2: Using VirtualBox Snapshots
1. Take a snapshot of a running VM.
2. Add a new file to the desktop.
3. Restore the snapshot you created. Does the new file exist? Why/Why not?
4. Take a snapshot at the beginning of imported lab scenarios in Ops, to give yourself a quick way to restart the lab if things don’t go well.

---

# Part 3: System Restore
1. If you’re supporting Windows 10 endpoints for a company, you won’t always have access to a VM backup mechanism on the hosting platform. Thankfully, Windows 10 ships with System Restore.
2. Using System Restore in your Windows 10 VM, create a “restore point.”
3. Create “testfile.txt” on the desktop.
4. Install an application such as Google Chrome.
5. Perform a System Restore against the saved restore point.
6. Are testfile.txt and Google Chrome present on the restored VM? Why/why not?
7. If you’ve completed all the steps in the lab, you’re well-equipped to perform baseline backups of your operating systems and VirtualBox VMs. If anything goes haywire in class, restoring to a known good baseline is your “Plan B” option.

---
# Part 4: Lab Documentation
1. Answer the following in your submission:
2. How will you restore your Ubuntu system if something with the OS goes wrong?
3. How will you restore your Windows 10 VM if something with its OS goes wrong?
4. How are you documenting the following lab computer information: 
- Network configuration
- Passwords
- Installed software

