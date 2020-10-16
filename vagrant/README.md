From: https://github.com/heidemn/vagrant-bionic-desktop

# How to run it

```
vagrant plugin install vagrant-disksize

vagrant up 2>&1 | tee log.txt
vagrant reload
```

After the reboot, the VM screen should show the LightDM login screen. Log in as user "ubuntu", password "ubuntu".

Then run `startx`? (or restart the VM and GYI should load automatically)

Re-running the provisioners:

```
# When VM is running:
vagrant provision 2>&1 | tee log.txt

# When VM is powered off:
vagrant up --provision 2>&1 | tee log.txt
```
