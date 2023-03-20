

# Windows Domain
- Windows Domain is a group of users and computers under the administration of a given business.
- [AD]      To centralise the administration of common components of a Windows computer network in a single repository called Active Directory (AD).
- [DC]      The server that runs the Active Directory services is known as a Domain Controller (DC).
- The main advantages of having a configured Windows domain are:
    - Centralised identity management
    - Managing security policies
- [systeminfo]      Check Windows machine is part of the AD environment or not?  <systeminfo | findstr Domain>

# Active Directory Domain Service ADDS
- OUs                 Organizational Units=
- Users               People/Services
- Machines
- SGs                 Security Groups


# Managing Users in AD
- Reset password in PS         <Set-ADAccountPassword sophie -Reset -NewPassword (Read-Host -AsSecureString -Prompt 'New Password') -Verbose>
- Force change password        <Set-ADUser -ChangePasswordAtLogon $true -Identity sophie -Verbose>
- A.D Administrators Accounts
    - BUILTIN\Administrator	            Local admin access on a domain controller
    - Domain Admins	                    Administrative access to all resources in the domain
    - Enterprise Admins	                Available only in the forest root
    - Schema Admins	                    Capable of modifying domain/forest; useful for red teamers
    - Server Operators	                Can manage domain servers


# Managing Computers in AD
- Servers 
- Laptops
- PCs

#  Group Policies > Group Policy Management tool
- Different policies for each OU individually
- To configure GPOs, you can use the Group Policy Management tool


# Authentication Methods 
- Kerberos: Used by any recent version of Windows. This is the default protocol in any recent domain.
- NetNTLM: Legacy authentication protocol kept for compatibility purposes.
- Kerberos Authentication:
    - [KDC]     Key Distribution Center
    - [TGT]     Ticket Granting Ticket

# Active Directory (AD) Enum
- PowerShell
    Get-ADUser -Filter *
    Get-ADUser -Filter * -SearchBase "CN=Users,DC=THMREDTEAM,DC=COM"