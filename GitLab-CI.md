
![https://gitlab.com/gitlab-com/gitlab-artwork/raw/master/logo/logo.png](https://gitlab.com/gitlab-com/gitlab-artwork/raw/master/logo/logo.png) 

In April 2018 we started to experiment more seriously with GitLab and GitLab-CI. 


# GitLab CI

Support for GitLab-CI was added in <a href="https://trac.sagemath.org/ticket/24655">https://trac.sagemath.org/ticket/24655</a>. 


## Free Runners with Google Compute Engine

Currently, Google gives everybody who signs up to Google Cloud Platform a free credit of 300 USD valid for 12 months. They won't charge you unless you explicitly upgrade, and there are a few limitations (e.g, at most 8 CPUs per regions.) By the way, if you do upgrade, they will only charge you once you run out of the free credit. 

1. Sign up at cloud.google.com (you might want to use an account that you don't use for anything else on cloud.google.com, so your quotas do not interfere with what we are doing here…) 
1. Go to "Compute Engine" → "VM Instance" → "Create Instance". 
      * Choose a name for your virtual machine instance, for example: sage-gitlabci-orchestrator 
      * Select the following: 
            * Zone: us-east1-b 
            * Machine Type: micro 
            * Boot Disk: Debian Stretch 
      * Select "Allow full access to all Cloud APIs" 
      * Keep defaults for everything else, and click "Create" 
1. Wait for your machine to boot and click the "SSH" button to connect. 
This opens a terminal in a browser window. Run the following commands there: 
```txt
sudo su
```

```txt
apt-get update
```

```txt
apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
```

```txt
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
```

```txt
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
```

```txt
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash
```

```txt
cat > /etc/apt/preferences.d/pin-gitlab-runner.pref <<EOF
Explanation: Prefer GitLab provided packages over the Debian native ones
Package: gitlab-runner
Pin: origin packages.gitlab.com
Pin-Priority: 1001
EOF
```

```txt
apt-get update
```

```txt
apt-get install -y gitlab-runner docker-ce
```

```txt
base=https://github.com/docker/machine/releases/download/v0.14.0
```

```txt
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine
```

```txt
install /tmp/docker-machine /usr/local/bin/docker-machine
```

```txt
REGIONS="us-east4-c us-central1-c us-west1-c europe-west4-c europe-west1-c europe-west2-c europe-west3-c asia-east1-c asia-southeast1-a australia-southeast1-c asia-south1-c" # for a maximum of 11*2+1 < 24 CPUs, the free tier limit
```

```txt
export REGISTRATION_TOKEN=CVMy_myijEx_Vs6yQvCf
```

```txt
NAME=gce-jrueth # a *short* name that contains gce and your username (and only lowercase characters and hyphens)
```

```txt
export REGISTER_LOCKED=false
```

```txt
PROJECT=tidy-scholar-202621 # the name of the google cloud project (click on "My First Project" to find out)
```

```txt
for region in $REGIONS;do gitlab-runner register --tag-list big,long,standard-2 --run-untagged --name $NAME-$region --limit 1 --executor docker+machine --env "DOCKER_DRIVER=overlay2" --docker-privileged --url https://gitlab.com --non-interactive --docker-image docker:latest --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" --docker-volumes "/dev/urandom:/dev/random" --docker-shm-size 2147483648 --machine-machine-driver google --machine-idle-time 600 --machine-machine-name "$NAME-%s" --machine-machine-options "google-project=$PROJECT" --machine-machine-options "google-machine-type=n1-standard-2" --machine-machine-options "google-machine-image=https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1804-lts" --machine-machine-options "google-tags=gitlab-ci-slave" --machine-machine-options "google-preemptible=false" --machine-machine-options "google-zone=$region" --machine-machine-options "google-use-internal-ip=true" --machine-machine-options "google-disk-type=pd-standard" --machine-machine-options "google-disk-size=64"; done
```

```txt
vim /etc/gitlab-runner/config.toml
```
That command entered the vim text editor. Type `i` to set vim to "insert mode". 

Replace `concurrent=1` with `concurrent=11` somewhere in that file (move to the correct location using the arrow keys if you don't know vim). 

Hit the "Escape" key to leave vim's "insert mode". 

Type `:wq` and hit the "Enter" or "Return" key to write the changes and quit vim. 

Three more commands to run. 


```txt
systemctl restart gitlab-runner
```

```txt
exit
```

```txt
exit
```
Finally, have somebody with Owner access on the gitlab.com/sage group check that your runners are enabled and working. 

TODO: There is some room for improvement here. These instances do not support caches (we do not use caching currently) and they always pull the sagemath-dev images from the registry which incurs quite a bit of ingress cost. 
