This is a simple powershell script to generate commands to add Address Objects to a Fortigate firewall, then add those address objects to a group.

It takes a file of IP Address subnets in CIDR notation, one subnet per line, and outputs a file of commands that can be copied and pasted into the Fortigate CLI

Usage:

.\FortigateAddressObject.ps1 -InFile <Input File> -OutFile <OutputFile> -Prefix <Prefix> -GroupName <Group Name>

InFile - The file to be read from
OutFile - The file to write to
Prefix - The desired prefix for the address objects. All objects will be created with the name <Prefix>-<IP Address>
GroupName - The desired group name.

Credit to Computer_Dad_in_IT for the regex used to create this (https://www.reddit.com/r/fortinet/comments/dloiv0/add_multiple_address_objects_via_cliscript/)