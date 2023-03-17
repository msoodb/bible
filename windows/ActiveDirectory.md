
Active Directory components
- Domain Controllers
- Organizational Units
- AD objects
- AD Domains
- Forest
- AD Service Accounts: Built-in local users, Domain users, Managed service accounts
- Domain Administrators


check Windows machine is part of the AD environment or not?         systeminfo | findstr Domain

# Users and Groups Management
Active Directory Administrators accounts:
- BUILTIN\Administrator	            Local admin access on a domain controller
- Domain Admins	                    Administrative access to all resources in the domain
- Enterprise Admins	                Available only in the forest root
- Schema Admins	                    Capable of modifying domain/forest; useful for red teamers
- Server Operators	                Can manage domain servers
- Account Operators	                Can manage users that are not in privileged groups

# Active Directory (AD) Enum
- PowerShell
    Get-ADUser -Filter *
    Get-ADUser -Filter * -SearchBase "CN=Users,DC=THMREDTEAM,DC=COM"