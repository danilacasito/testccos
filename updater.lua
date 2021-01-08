print("Starting Version check...")
actual = fs.open("/os_version", "r")
actualcommit = actual.readAll()

shell.run("wget https://raw.githubusercontent.com/danilacasito/testccos/latest/os_version /temporal")
net = fs.open("/temporal","r")
nextcommit = net.readAll()
if actualcommit == nextcommit then
    print("No versions are available")
    shell.run("rm /temporal")
else
    print("A new Version is available")
    net.close()
    net = fs.open("/temporal", "r")
    print("Do you want to update? [Yes,No,Read]")
    e = read()
    if e == "yes" then
        print("Downloading latest installer")
        shell.run("wget https://raw.githubusercontent.com/danilacasito/testccos/latest/installer.lua /installer.lua")
        shell.run("rm /temporal")
        shell.run("/installer.lua update")
    elseif e == "read" then
        shell.run("edit /temporal")
        print("yes or no?")
        p = read()
        if p == "yes" then
            print("Downloading latest installer")
            shell.run("wget https://raw.githubusercontent.com/danilacasito/testccos/latest/installer.lua /installer.lua")
            shell.run("rm /temporal")
            shell.run("/installer.lua update")
        else
            print("Ok, Canceled")
            shell.run("rm /temporal")
        end
    else
        print("Ok, Canceled")
        shell.run("rm /temporal")
    end
end
