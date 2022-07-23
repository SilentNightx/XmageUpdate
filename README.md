# XmageUpdate
A bash script to update Xmage server without losing server settings.

Download and edit updateXmage.sh and replace the following with your settings:  
{YOUR SERVER ADDRESS}  
{YOUR SERVER NAME}  
{YOUR SECONDARY BIND PORT}  
{YOUR MAX SECONDS IDLE}  
{YOUR MAX AI OPPONENTS}  

Then:  
`chmod 755 updateXmage.sh` to set execution permissions  
`./updateXmage.sh` to run  

If you don't have Xmage installed yet this will install it fresh for you.

Wherever you run updateXmage.sh is where the mage-server folder will end up.  

If you want to keep the setting the same as default you can just delete the whole sed command.  
If you want to use settings in xmage config.xml I don't have here just examine my sed commands and write commands for those settings.  
