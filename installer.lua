e = {...}
if e[1] == "update" then
    shell.run("rm /os_version")
    shell.run("wget https://raw.githubusercontent.com/danilacasito/testccos/latest/os_version /os_version")
    shell.run("rm /updater.lua")
    shell.run("wget https://raw.githubusercontent.com/danilacasito/testccos/latest/updater.lua /updater.lua")
    shell.run("mkdir /bin")
    shell.run("wget https://raw.githubusercontent.com/danilacasito/testccos/latest/bin/uname.lua /bin/uname.lua")
elseif e[1] == "install" then
    shell.run("wget https://raw.githubusercontent.com/danilacasito/testccos/latest/os_version /os_version")
    shell.run("wget https://raw.githubusercontent.com/danilacasito/testccos/latest/updater.lua /updater.lua")
else
    print("Nothing to Do, use install [install/update]")
end