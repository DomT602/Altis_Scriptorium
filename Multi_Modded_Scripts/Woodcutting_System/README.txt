This folder contains the scripts needed for the woodcutting system. This allows you to cut down any tree (currently supporting A3 Vanilla trees) and recieve a virtual item log.

Setup:
Download files from github
From fn_onFired take the code and put it in your version of the file
Put fn_treeHandleDamage into life_server in Systems folder, add it to config.cpp, and add;
	F(TON_fnc_treeHandleDamage,SERVER)
to your CfgRemoteExec.

You will need to create a virtual item. This item can then be put in fn_treeHandleDamage. Additionally in fn_treeHandleDamage you can customise how many hits a tree takes to fall.
You will also need a hatchet/axe model, and then you will need to put the classname of this weapon into fn_onFired in place of 'YourAxeClassnameHere'.