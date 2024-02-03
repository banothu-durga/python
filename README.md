END TO END DEPLOYMENT DOCUMENT
Installation of Kubernets Cluster with Minikube
Prerequisites to Install Kubernetes
•	Ubuntu 20.04 desktop installed on your system
•	A root password set up on your system
Step 1 – Updating the system
1) Make sure that the system is running on the latest versions.
apt-get update -y
apt-get upgrade -y
2) Restart the computer to have the modifications take effect.

3) Then, download a few packages that would be useful.
apt-get install curl wget apt-transport-https -y
Step 2 – Install VirtualBox Hypervisor
1) Since both KVM and VirtualBox Hypervisor are supported by Minikube, you can select which one to install. The following command can be used to install the VirtualBox Hypervisor:
apt-get install virtualbox virtualbox-ext-pack
Step 3 – Install Minikube
1) Download the latest version of Minikube with the help of the following command:
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
2) You need to copy the downloaded file to /usr/local/bin.
cp minikube-linux-amd64 /usr/local/bin/minikube
3) After that, give execution permission to Minikube.
chmod 755 /usr/local/bin/minikube
4) Then check the version of Minikube using the following command:
minikube version
5) You'll be able to see the following output:
minikube version: v0.34.1
Step 4 – Install Kubectl
1) Kubectl, a tool, is used to deploy and manage applications on Kubernetes. You must download them and add them to your system's repository because it is not included in the Ubuntu 20.04 repositories.
2) Download the GPG key, then add it.
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
3) Then, add Kubernetes apt repository with the following command:
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
4) Update the repository and install Kubectl.
apt-get update -y
apt-get install kubectl -y
5) You can then check the version of Kubectl installed with the help of the following command:
kubectl version -o json
6) You'll be seeing the following output:
Output
{
  "clientVersion": {
    "major": "1",
    "minor": "13",
    "gitVersion": "v1.13.4",
    "gitCommit": "c27b913fddd1a6c480c229191a087698aa92f0b1",
    "gitTreeState": "clean",
    "buildDate": "2019-02-28T13:37:52Z",
    "goVersion": "go1.11.5",
    "compiler": "gc",
    "platform": "linux/amd64"
  }
}
Step 5 – Start Minikube
1) Now, you can start the Minikube:
minikube start
2) The VirtualBox image will be downloaded, and the Kubernetes cluster will be set up as described below:
o   minikube v0.34.1 on linux (amd64)
>   Creating virtualbox VM (CPUs=2, Memory=2048MB, Disk=20000MB) ...
@   Downloading Minikube ISO ...
 184.30 MB / 184.30 MB [============================================] 100.00% 0s
-   "minikube" IP address is 192.168.99.100
-   Configuring Docker as the container runtime ...
-   Preparing Kubernetes environment ...
@   Downloading kubeadm v1.13.3
@   Downloading kubelet v1.13.3

-   Pulling images required by Kubernetes v1.13.3 ...
-   Launching Kubernetes v1.13.3 using kubeadm ... 
-   Configuring cluster permissions ...
-   Verifying component health .....
+   kubectl is now configured to use "minikube"
=   Done! Thank you for using minikube!
3) You may also check the status of the cluster:
kubectl cluster-info
4) After that, you will get output like below:
Output


Kubernetes master is running at https://192.168.99.100:8443
KubeDNS is running at https://192.168.99.100:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
5) Additionally, you can examine the Kubectl default configuration:
kubectl config view
6) You will get output like below:
Output

apiVersion: v1
clusters:
- cluster:
    certificate-authority: /home/ubuntu/.minikube/ca.crt
    extensions:
    - extension:
        last-update: Mon, 18 Dec 2023 07:50:23 UTC
        provider: minikube.sigs.k8s.io
        version: v1.32.0
      name: cluster_info
    server: https://192.168.49.2:8443
  name: minikube
contexts:
- context:
    cluster: minikube
    extensions:
    - extension:
        last-update: Mon, 18 Dec 2023 07:50:23 UTC
        provider: minikube.sigs.k8s.io
        version: v1.32.0
      name: context_info
    namespace: default
    user: minikube
  name: minikube
current-context: minikube
kind: Config
preferences: {}
users:
- name: minikube
  user:
    client-certificate: /home/ubuntu/.minikube/profiles/minikube/client.crt
    client-key: /home/ubuntu/.minikube/profiles/minikube/client.key

7) The following command can be used to check the active nodes:
kubectl get nodes
Output

NAME       STATUS   ROLES    AGE     VERSION
minikube   Ready    master   2m45s   v1.13.3
8) You can then use Minikube VirtualBox:
minikube ssh

9) Now check the kuberenetes status
kubectl get pods --all-namespaces


Installation of Jenkins:
Step 1: Installation of Java
sudo apt update
sudo apt install openjdk-8-jdk –y
sudo apt install openjdk-11-jdk –y
Step 2: Add Jenkins Repository
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
Step 3: Install Jenkins
sudo apt update
sudo apt install jenkins –y
sudo systemctl status Jenkins
sudo systemctl enable --now Jenkins
Step 4: Modify Firewall to Allow Jenkins
sudo ufw allow 8080
sudo ufw status
sudo ufw enable
Step 5: Set up Jenkins
http://ip_address_or_domain:8080
http://localhost:8080
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
 
Containerization of Django web application with Docker
Step 1: Creating the Dockerfile
Write the Docker file which contains all the dependencies and frameworks
# base image  
FROM python:3.8   
# setup environment variable  
ENV DockerHOME=/home/app/webapp  

# set work directory  
RUN mkdir -p $DockerHOME  

# where your code lives  
WORKDIR $DockerHOME  

# set environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

# install dependencies  
RUN pip install --upgrade pip  

# copy whole project to your docker home directory. 
COPY . $DockerHOME  
# run this command to install all dependencies  
RUN pip install -r requirements.txt  
# port where the Django app runs  
EXPOSE 8000  
# start server  
CMD python manage.py runserver
Step 2: Now run the above Docker file to create an image
stage("Building Docker Image"){
            steps{
                script{
                    echo "========executing Building Docker Image========"
                    dockerImage = docker.build("$docker_repository:${BRANCH_NAME}-${BUILD_NUMBER}")
                }
            }
        }

Deployment Manifest for deploying the service with Kubernetes and Jenkins
Step1: Deployment file which contains deployment, service and ingress manifests.
apiVersion: apps/v1
kind: Deployment
metadata:
  name: docker-django
  labels:
    app: docker-django
spec:
  replicas: 2
  selector:
    matchLabels:
      app: docker-django
  template:
    metadata:
      labels:
        app: docker-django
    spec:
      containers:
      - name: docker-django
        image: kgowthamnk/docker-django-v0.0:latest
        ports:
        - containerPort: 8000

---

apiVersion: v1
kind: Service
metadata:
  name: docker-django
spec:
  selector:
    app: docker-django
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8000

---

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$1
spec:
  rules:
    - host: hello-world.info
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: docker-django
                port:
                  number: 80

Jenkins CI/CD setup for Django Python project:
Step 1: Jenkins file
Below Jenkins file contains multiple stages
Which includes creation of Docker images and storing the image in Docker hub and finally deploying the latest image on the kubernetes cluster.

pipeline{
    options{	
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '4'))
    }
    environment{
        BRANCH_NAME = "${GIT_BRANCH.split("/")[1]}"
        dockerImage=''
        credentialsId= "DOCKER_HUB"
        docker_repository= 'kgowthamnk/docker-django-v0.0'
    }
    agent any
    stages{   
        stage("Building Docker Image"){
            steps{
                script{
                    echo "========executing Building Docker Image========"
                    dockerImage = docker.build("$docker_repository:${BRANCH_NAME}-${BUILD_NUMBER}")
                }
            }
        }
        stage("Pushing Image to DockerHUB"){
            steps{
                script{
                    echo "========PUSHING IMAGE TO DOCKERHUB========"
                    withDockerRegistry(credentialsId: 'DOCKER_HUB', url: '') {
                    dockerImage.push()
                    }
                }
            }
        }
        stage("Deploy to K8s cluster"){
            when{
                branch 'main'
            }
            steps{
                script{
                    sh "chmod +x tag.sh"
                    sh "./tag.sh $BRANCH_NAME-${BUILD_NUMBER}"
                    echo "========DEPLOYING IMAGE TO M K8S========"
                    sh 'export KUBECONFIG=/home/test/.kube/config && kubectl apply -f /var/lib/jenkins/workspace/first_python/ks_deployment.yaml'
                }
            }
            post{
                success{
                    echo "Successfully deployed to k8s"
                }
                failure{
                    echo "Failed deployed to k8s"
                }
            }
        }
    }
}


Step 2: Additional files
Tag.sh which is used to get the latest image from the docker hub
#!/bin/bash
sed -e 's/latest/'${1}'/g' deployment.yaml > ks_deployment.yaml


Step 3: Jenkins Pipeline
 

Step4 : Jenkins Build Logs
Started by GitHub push by kgowthamnkgit
Obtained Jenkinsfile from git https://github.com/kgowthamnkgit/python.git
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/first_python
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
using credential git_crds
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/first_python/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/kgowthamnkgit/python.git # timeout=10
Fetching upstream changes from https://github.com/kgowthamnkgit/python.git
 > git --version # timeout=10
 > git --version # 'git version 2.34.1'
using GIT_ASKPASS to set credentials git hub creds
 > git fetch --tags --force --progress -- https://github.com/kgowthamnkgit/python.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/main^{commit} # timeout=10
Checking out Revision 51baf8959688d59a21b42385709fba8432824b71 (refs/remotes/origin/main)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 51baf8959688d59a21b42385709fba8432824b71 # timeout=10
Commit message: "added files"
 > git rev-list --no-walk 0061487b82877a6a4b95b0dae3e98d72bcc9b5b0 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] withEnv
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Building Docker Image)
[Pipeline] script
[Pipeline] {
[Pipeline] echo
========executing Building Docker Image========
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] sh
+ docker build -t kgowthamnk/docker-django-v0.0:main-17 .
#0 building with "default" instance using docker driver

#1 [internal] load .dockerignore
#1 transferring context: 2B done
#1 DONE 0.0s

#2 [internal] load build definition from Dockerfile
#2 transferring dockerfile: 641B done
#2 DONE 0.1s

#3 [internal] load metadata for docker.io/library/python:3.8
#3 DONE 0.2s

#4 [1/6] FROM docker.io/library/python:3.8@sha256:7264a50439679c2868a99f71a5c9b9831cc082b1d3f05c8643788e1d7914afeb
#4 DONE 0.0s

#5 [internal] load build context
#5 transferring context: 27.90kB 0.1s done
#5 DONE 0.1s

#6 [3/6] WORKDIR /home/app/webapp
#6 CACHED

#7 [2/6] RUN mkdir -p /home/app/webapp
#7 CACHED

#8 [4/6] RUN pip install --upgrade pip
#8 CACHED

#9 [5/6] COPY . /home/app/webapp
#9 DONE 0.9s

#10 [6/6] RUN pip install -r requirements.txt
#10 4.467 Collecting django-rest-framework==0.1.0 (from -r requirements.txt (line 1))
#10 4.540   Downloading django-rest-framework-0.1.0.tar.gz (969 bytes)
#10 4.558   Preparing metadata (setup.py): started
#10 5.516   Preparing metadata (setup.py): finished with status 'done'
#10 5.601 Collecting djangorestframework (from django-rest-framework==0.1.0->-r requirements.txt (line 1))
#10 5.606   Downloading djangorestframework-3.14.0-py3-none-any.whl (1.1 MB)
#10 5.673      ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.1/1.1 MB 17.2 MB/s eta 0:00:00
#10 5.858 Collecting django>=3.0 (from djangorestframework->django-rest-framework==0.1.0->-r requirements.txt (line 1))
#10 5.863   Downloading Django-4.2.8-py3-none-any.whl.metadata (4.2 kB)
#10 5.973 Collecting pytz (from djangorestframework->django-rest-framework==0.1.0->-r requirements.txt (line 1))
#10 5.978   Downloading pytz-2023.3.post1-py2.py3-none-any.whl.metadata (22 kB)
#10 6.047 Collecting asgiref<4,>=3.6.0 (from django>=3.0->djangorestframework->django-rest-framework==0.1.0->-r requirements.txt (line 1))
#10 6.052   Downloading asgiref-3.7.2-py3-none-any.whl.metadata (9.2 kB)
#10 6.091 Collecting sqlparse>=0.3.1 (from django>=3.0->djangorestframework->django-rest-framework==0.1.0->-r requirements.txt (line 1))
#10 6.097   Downloading sqlparse-0.4.4-py3-none-any.whl (41 kB)
#10 6.108      ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 41.2/41.2 kB 4.0 MB/s eta 0:00:00
#10 6.142 Collecting backports.zoneinfo (from django>=3.0->djangorestframework->django-rest-framework==0.1.0->-r requirements.txt (line 1))
#10 6.148   Downloading backports.zoneinfo-0.2.1-cp38-cp38-manylinux1_x86_64.whl (74 kB)
#10 6.163      ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 74.0/74.0 kB 7.0 MB/s eta 0:00:00
#10 6.215 Collecting typing-extensions>=4 (from asgiref<4,>=3.6.0->django>=3.0->djangorestframework->django-rest-framework==0.1.0->-r requirements.txt (line 1))
#10 6.220   Downloading typing_extensions-4.9.0-py3-none-any.whl.metadata (3.0 kB)
#10 6.259 Downloading Django-4.2.8-py3-none-any.whl (8.0 MB)
#10 6.412    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 8.0/8.0 MB 54.2 MB/s eta 0:00:00
#10 6.419 Downloading pytz-2023.3.post1-py2.py3-none-any.whl (502 kB)
#10 6.449    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 502.5/502.5 kB 18.6 MB/s eta 0:00:00
#10 6.454 Downloading asgiref-3.7.2-py3-none-any.whl (24 kB)
#10 6.469 Downloading typing_extensions-4.9.0-py3-none-any.whl (32 kB)
#10 6.559 Building wheels for collected packages: django-rest-framework
#10 6.561   Building wheel for django-rest-framework (setup.py): started
#10 7.799   Building wheel for django-rest-framework (setup.py): finished with status 'done'
#10 7.800   Created wheel for django-rest-framework: filename=django_rest_framework-0.1.0-py3-none-any.whl size=1376 sha256=8d6e1aec3670e7b2868877d95a2f6d5153ec8df63f7ac4e60d18ef07b1cb8b28
#10 7.801   Stored in directory: /root/.cache/pip/wheels/5f/6b/cc/126959a66b51f960094ee9ec7c5263d74d91b837341dfd0a59
#10 7.805 Successfully built django-rest-framework
#10 7.921 Installing collected packages: pytz, typing-extensions, sqlparse, backports.zoneinfo, asgiref, django, djangorestframework, django-rest-framework
#10 11.03 Successfully installed asgiref-3.7.2 backports.zoneinfo-0.2.1 django-4.2.8 django-rest-framework-0.1.0 djangorestframework-3.14.0 pytz-2023.3.post1 sqlparse-0.4.4 typing-extensions-4.9.0
#10 11.03 WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
#10 11.18 
#10 11.18 [notice] A new release of pip is available: 23.3.1 -> 23.3.2
#10 11.18 [notice] To update, run: pip install --upgrade pip
#10 DONE 11.4s

#11 exporting to image
#11 exporting layers
#11 exporting layers 1.2s done
#11 writing image sha256:06a7451363593c800dc414fe4830bb5611a6637d0afa5302218ba57f1182c8e9 done
#11 naming to docker.io/kgowthamnk/docker-django-v0.0:main-17 done
#11 DONE 1.2s
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Pushing Image to DockerHUB)
[Pipeline] script
[Pipeline] {
[Pipeline] echo
========PUSHING IMAGE TO DOCKERHUB========
[Pipeline] withDockerRegistry
$ docker login -u kgowthamnk -p ******** https://index.docker.io/v1/
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
WARNING! Your password will be stored unencrypted in /var/lib/jenkins/workspace/first_python@tmp/a2812e1e-511f-4f77-993b-df484a76a02d/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[Pipeline] {
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] sh
+ docker tag kgowthamnk/docker-django-v0.0:main-17 kgowthamnk/docker-django-v0.0:main-17
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] isUnix
[Pipeline] withEnv
[Pipeline] {
[Pipeline] sh
+ docker push kgowthamnk/docker-django-v0.0:main-17
The push refers to repository [docker.io/kgowthamnk/docker-django-v0.0]
5b74bb726070: Preparing
5561e293bdfa: Preparing
eadbcde6d49c: Preparing
5f70bf18a086: Preparing
fa65294e518a: Preparing
a82fe80861c4: Preparing
8466fd0ad95b: Preparing
954d23a79c94: Preparing
a04a14a911a5: Preparing
80bd043d4663: Preparing
30f5cd833236: Preparing
7c32e0608151: Preparing
7cea17427f83: Preparing
a04a14a911a5: Waiting
80bd043d4663: Waiting
30f5cd833236: Waiting
7c32e0608151: Waiting
7cea17427f83: Waiting
a82fe80861c4: Waiting
8466fd0ad95b: Waiting
954d23a79c94: Waiting
eadbcde6d49c: Layer already exists
fa65294e518a: Layer already exists
5f70bf18a086: Layer already exists
a82fe80861c4: Layer already exists
8466fd0ad95b: Layer already exists
954d23a79c94: Layer already exists
a04a14a911a5: Layer already exists
80bd043d4663: Layer already exists
30f5cd833236: Layer already exists
7c32e0608151: Layer already exists
7cea17427f83: Layer already exists
5561e293bdfa: Pushed
5b74bb726070: Pushed
main-17: digest: sha256:ce32db4ae851805df86a25919772f5569c866e7ec16ca6e169da0b2138fb0597 size: 3055
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // withDockerRegistry
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy to K8s cluster)
[Pipeline] script
[Pipeline] {
[Pipeline] sh
+ chmod +x tag.sh
[Pipeline] sh
+ ./tag.sh main-17
[Pipeline] echo
========DEPLOYING IMAGE TO M K8S========
[Pipeline] sh
+ export KUBECONFIG=/home/test/.kube/config
+ kubectl apply -f /var/lib/jenkins/workspace/first_python/ks_deployment.yaml
deployment.apps/docker-django configured
service/docker-django configured
[Pipeline] }
[Pipeline] // script
Post stage
[Pipeline] echo
Successfully deployed to k8s
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
REST APIJenkins 2.426.2




Step 5: Now Check the Deployments and pods in Kubernetes:

 
 



Code Snippets from GitHub and Image Details from Docker Hub:

Please find Django Python Basic code from the below repository
https://github.com/kgowthamnkgit/python.git
 
And also find the image deployed on kubernetes from docker hub

https://hub.docker.com/repository/docker/kgowthamnk/docker-django-v0.0/tags?page=1&ordering=last_updated

 


































																										


