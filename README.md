# Inception-of-Things

# ( IoT )

_Summary: This document is a System Administration related exercise._

```
Version: 2.
```

## Contents

- I Preamble
- II Introduction
- III General guidelines
- IV Mandatory part
   - IV.1 Part 1: K3s and Vagrant
   - IV.2 Part 2: K3s and three simple applications
   - IV.3 Part 3: K3d and Argo CD
- V Bonus part
- VI Submission and peer-evaluation


# Chapter I

# Preamble


# Chapter II

# Introduction

This project aims to deepen your knowledge by making you use K3d and K3s with
Vagrant.

You will learn how to set up a personal virtual machine with Vagrant and the
distribution of your choice. Then, you will learn how to useK3sand itsIngress.
Last but not least, you will discoverK3dthat will simplify your life.

```
These steps will get you started withKubernetes.
```
```
This project is a minimal introduction to Kubernetes. Indeed, this
tool is too complex to be mastered in a single subject.
```

# Chapter III

# General guidelines

- The whole project has to be done in a **virtual machine**.
- You have to put all the configuration files of your project in folders located at the
    root of your repository (go to Submission and peer-evaluation for more information).
    The folders of the mandatory part will be named: p1,p2andp3. And the bonus
    one:bonus.
- This topic requires you to apply concepts that, depending on your background, you
    may not have covered yet. We therefore advise you not to not be afraid to read a
    lot of documentation to learn how to useK8swithK3s, as well asK3d.

```
You can use any tools you want to set up your host virtual machine as
well as the provider used in Vagrant.
```

# Chapter IV

# Mandatory part

This project will consist of setting up several environments under specific rules.

```
It is divided into three parts you have to do in the following order:
```
- Part 1: K3s and Vagrant
- Part 2: K3s and three simple applications
- Part 3: K3d and Argo CD


Inception-of-Things
( IoT )

### IV.1 Part 1: K3s and Vagrant

To begin, you have to set up 2 **machines**.

Write your firstVagrantfileusing the **latest stable version** ofthe distribution
of your choiceas your operating system. It is STRONGLY advised to allow only the
bare minimum in terms of resources: 1 CPU, 512 MB of RAM (or 1024). The machines
must be run usingVagrant.

```
Here are the expected specifications:
```
- The machine names must be the login of someone of your team. The hostname
    of the first machine must be followed by the capital letter S (like _Server_ ). The
    hostname of the second machine must be followed by SW (like _ServerWorker_ ).
- Have a dedicated IP on the eth1 interface. The IP of the first machine ( _Server_ )
    will be192.168.56.110, and the IP of the second machine ( _ServerWorker_ ) will be
    192.168.56.111.
- Be able to connect with SSH on both machines with no password.

```
You will set up your Vagrantfile according to modern practices.
```
```
You must installK3son both machines:
```
- In the first one ( _Server_ ), it will be installed in controller mode.
- In the second one ( _ServerWorker_ ), in agent mode.

```
You will have to use kubectl (and therefore install it too).
```

Inception-of-Things
( IoT )

```
Here is an example basicVagrantfile:
$> cat Vagrantfile
Vagrant.configure(2) do |config|
[...]
config.vm.box = REDACTED
config.vm.box_url = REDACTED
config.vm.define "wilS" do |control|
control.vm.hostname = "wilS"
control.vm.network REDACTED, ip: "192.168.56.110"
control.vm.provider REDACTED do |v|
v.customize ["modifyvm", :id, "--name", "wilS"]
[...]
end
config.vm.provision :shell, :inline => SHELL
[...]
SHELL
control.vm.provision "shell", path: REDACTED
end
config.vm.define "wilSW" do |control|
control.vm.hostname = "wilSW"
control.vm.network REDACTED, ip: "192.168.56.111"
control.vm.provider REDACTED do |v|
v.customize ["modifyvm", :id, "--name", "wilSW"]
[...]
end
config.vm.provision "shell", inline: <<-SHELL
[..]
SHELL
control.vm.provision "shell", path: REDACTED
end
end
```

Inception-of-Things
( IoT )

```
Here is an example when the virtual machines are launched:
```
```
Here is an example when the configuration is not complete:
```
```
Here is an example when the machines are correctly configured:
```

Inception-of-Things
( IoT )

### IV.2 Part 2: K3s and three simple applications

You now understand the basics ofK3s. Time to go further! To complete this part, you
will need only one virtual machine withthe distribution of your choice ( **latest
stable version** ) andK3sin server mode installed.
You will set up 3 web applications of your choice that will run in yourK3sinstance.
You will have to be able to access them depending on theHOSTused when making a
request to the IP address 192.168.56.110. The name of this machine will be your login
followed by S (e.g., _wilS_ if your login is _wil_ ).
Here is a small example diagram:

When a client inputs the ip 192.168.56.110 in his web browser with theHOST _app1.com_ ,
the server must display the app1. When theHOST _app2.com_ is used, the server must dis-
play the app2. Otherwise, the app3 will be selected by default.

```
As you can see, application number 2 has 3 replicas. Adapt your
configuration to create the replicas.
```

Inception-of-Things
( IoT )

```
First, here is an expected result when the virtual machine is not configured:
```

Inception-of-Things
( IoT )

```
Here is an expected result when the virtual machine is correctly configured:
```
```
The Ingress is not displayed here on purpose. You will have to show
it to your evaluators during your defense.
```

Inception-of-Things
( IoT )

### IV.3 Part 3: K3d and Argo CD

You now master a minimalist version of K3S! Time to set up everything you have just
learnt (and much more!) but withoutVagrantthis time. To begin, installK3Don your
virtual machine.

```
You will need Docker for K3d to work, and probably some other
softwares too. Thus, you have to write a script to install every
necessary packages and tools during your defense.
```
```
First of all, you must understand the difference betweenK3SandK3D.
```
Once your configuration works as expected, you can start to create your first **con-
tinuous integration**! To do so, you have to set up a small infrastructure following the
logic illustrated by the diagram below:

```
You have to create twonamespaces:
```
- The first one will be dedicated toArgo CD.
- The second one will be named _dev_ and will contain an application. This application
    will be automatically deployed byArgo CDusing your online Github repository.

```
Yes, indeed. You will have to create a public repository on Github
where you will push your configuration files.
You are free to organize it the way you like. The only mandatory
requirement is to put the login of a member of the group in the name
of your repository.
```

Inception-of-Things
( IoT )

The application that will be deployed must have **two different versions** (read about
tagging if you don’t know about it).

```
You have two options:
```
- You can use the ready-made application created by Wil. It’s available on Docker-
    hub.
- Or you can code and use your own application. Create a public Dockerhub repos-
    itory to push a Docker image of your application. Also, tag its two versions this
    way: **v1** and **v**.

```
You can find Wil’s application on Dockerhub here:
https://hub.docker.com/r/wil42/playground.
The application uses the port 8888.
Find the two versions in the TAG section.
```
```
If you decide to create your own application, it must be made
available thanks to a public Docker image pushed into a Dockerhub
repository. The two versions of your application must also have a
few differences.
```
You must be able to change the version from your public Github repository, then
check that the application has been correctly updated.

Here is an example showing the twonamespacesand the _POD_ located in the _dev_
namespace:

```
$> k get ns
NAME STATUS AGE
[..]
argocd Active 19h
dev Active 19h
$> k get pods -n dev
NAME READY STATUS RESTARTS AGE
wil-playground-65f745fdf4-d2l2r 1/1 Running 0 8m9s
$>
```

Inception-of-Things
( IoT )

```
Here is an example of launchingArgo CDthat was configured:
```
```
We can check that our application uses the version we expect (in this case, the v1 ):
```
```
$> cat deployment.yaml | grep v
```
- image: wil42/playground:v
$> curl [http://localhost:8888/](http://localhost:8888/)
{"status":"ok", "message": "v1"}

```
Here is a screenshot ofArgo CDwith our v1 application using Github:
```
```
Below, we update our Github repository by changing the version of our application:
```
```
$>sed -i's/wil42\/playground\:v1/wil42\/playground\:v2/g'deploy.yaml
$>g up "v2" # git add+commit+push
[..]
a773f39..999b9fe master -> master
$> cat deployment.yaml | grep v
```
- image: wil42/playground:v


Inception-of-Things
( IoT )

```
You can see thanks toArgo CDthat the application is synchronized:
```
```
The application was updated with success:
```
```
We check that the new version is available:
$> curl http://localhost:8888/
{"status":"ok", "message": "v2"}
```
```
During the evaluation process, you will have to do this operation
with the app you chose: Wil’s or yours.
```

# Chapter V

# Bonus part

The following extra is intended to be useful: add **Gitlab** in the lab you did in Part 3.

```
Beware this bonus is complex. The latest version available of Gitlab
from the official website is expected.
```
You are allowed to use whatever you need to achieve this extra. For example,helm
could be useful here.

- Your Gitlab instance must run locally.
- Configure Gitlab to make it work with your cluster.
- Create a dedicatednamespacenamed _gitlab_.
- Everything you did in Part 3 must work with your local Gitlab.

Turn this extra work in a new folder namedbonusand located at the root of your
repository. You can add everything needed so your entire cluster works.

```
The bonus part will only be assessed if the mandatory part is
PERFECT. Perfect means the mandatory part has been integrally done
and works without malfunctioning. If you have not passed ALL the
mandatory requirements, your bonus part will not be evaluated at all.
```

# Chapter VI

# Submission and peer-evaluation

Turn in your assignment in yourGitrepository as usual. Only the work inside your repos-
itory will be evaluated during the defense. Don’t hesitate to double check the names of
your folders and files to ensure they are correct.

```
Reminder:
```
- Turn the mandatory part in three folders located at the root of your repository:
    p1,p2andp3.
- Optional: Turn the bonus part in a located at the root of your repository:bonus.

```
Below is an example of the expected directory structure:
$> find -maxdepth 2 -ls
424242 4 drwxr-xr-x 6 wandre wil42 4096 sept. 17 23:.
424242 4 drwxr-xr-x 3 wandre wil42 4096 sept. 17 23:42 ./p
424242 4 -rw-r--r-- 1 wandre wil42 XXXX sept. 17 23:42 ./p1/Vagrantfile
424242 4 drwxr-xr-x 2 wandre wil42 4096 sept. 17 23:42 ./p1/scripts
424242 4 drwxr-xr-x 2 wandre wil42 4096 sept. 17 23:42 ./p1/confs
424242 4 drwxr-xr-x 3 wandre wil42 4096 sept. 17 23:42 ./p
424242 4 -rw-r--r-- 1 wandre wil42 XXXX sept. 17 23:42 ./p2/Vagrantfile
424242 4 drwxr-xr-x 2 wandre wil42 4096 sept. 17 23:42 ./p2/scripts
424242 4 drwxr-xr-x 2 wandre wil42 4096 sept. 17 23:42 ./p1/confs
424242 4 drwxr-xr-x 3 wandre wil42 4096 sept. 17 23:42 ./p
424242 4 drwxr-xr-x 2 wandre wil42 4096 sept. 17 23:42 ./p3/scripts
424242 4 drwxr-xr-x 2 wandre wil42 4096 sept. 17 23:42 ./p3/confs
424242 4 drwxr-xr-x 3 wandre wil42 4096 sept. 17 23:42 ./bonus
424242 4 -rw-r--r-- 1 wandre wil42 XXXX sept. 17 23:42 ./bonus/Vagrantfile
424242 4 drwxr-xr-x 2 wandre wil42 4096 sept. 17 23:42 ./bonus/scripts
424242 4 drwxr-xr-x 2 wandre wil42 4096 sept. 17 23:42 ./bonus/confs
```
```
Any scripts you need will be added in a scripts folder. The
configuration files will be in a confs folder.
```
```
The evaluation process will happen on the computer of the evaluated
group.
```



