# o365beat

This repository is to maintain an o365beat Docker image. To pull the image down (assuming you have Docker installed) run the command below.

```bash
docker pull hasecuritysolutions/o365beat
```

The following environmental variables are available to use with this image:

O365BEAT_TENANT_DOMAIN

O365BEAT_CLIENT_SECRET

O365BEAT_CLIENT_ID

O365BEAT_DIRECTORY_ID

The easiest way to configure o365beat is to overwrite /etc/o365beat/o365beat.yml with your own configuration file. Below is an example of running o365beat with a custom configuration file.

```bash
docker run -it --rm --name o365beat -v /path/to/your/o365beat.yml:/etc/o365beat/o365beat.yml hasecuritysolutions/o365beat
```

Before using o365beat, you need to enable Office 365 audit logging:

https://docs.microsoft.com/en-us/microsoft-365/compliance/turn-audit-log-search-on-or-off?view=o365-worldwide#turn-on-audit-log-search

You will also need to subscribe to the Office 365 Management API. Logs cannot be collected until this occurs. Below are PowerShell commands you can run to do this. H & A Security Solutions LLC does not maintain the PowerShell Gallery module referenced. If it breaks or does something it is not intended to do we are not liable.

```powershell
# The below PowerShell commands can be used to
# enable Office 365 Management API Subscriptions

# First, install the Exch-Rest Module from the PowerShell gallery
# If prompeted, select [A] Yes to All
Install-Module -Name Exch-Rest

# Next, connect to your tenant
Connect-EXRManagementAPI -UserName adminaccount@yourdomain.com

# When prompted select 5 - Management API Access Only

# Follow authentication prompts
# Lastly, enable audit Subscriptions
New-EXRMSubscription -AzureAD
New-EXRMSubscription -Exchange
New-EXRMSubscription -SharePoint
New-EXRMSubscription -DLP
New-EXRMSubscription -General

# Validate
Get-EXRMSubscriptions
```

Lastly, you will need to set up an enterprise application in Azure that has access to the Office 365 Management API. Documentation to follow. For now, more documentation on how to do this can be found here:

https://github.com/counteractive/o365beat
