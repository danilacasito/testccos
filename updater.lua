print("Starting Version check...")
actual = fs.open("/os_version", "r")
actual.readLine()
actualcommit = actual.readLine()
shell.run("wget https://raw.githubusercontent.com/danilacasito/testccos/latest/os_version /temporal")
net = fs.open("/temporal","r")
net.readLine()
nextcommit = net.readLine()
if actualcommit == nextcommit then
    print("No versions are available")
    shell.run("rm /temporal")
else
    print("A new Version is available")
    next.close()
    next = fs.open("/temporal", "r")
    for lines in next do
        print(lines)
    end
    print("Do you want to update?")
    e = read()
    if e == "yes" then
        print("Downloading latest installer")
        shell.run("wget https://raw.githubusercontent.com/danilacasito/testccos/latest/installer.lua /installer.lua")
        shell.run("rm /temporal")
        shell.run("/installer.lua update")
    else
        print("Ok, Canceled")
        shell.run("rm /temporal")
    end
end
