# kubectl
Kubectl for ARM

## Usage

Run the container and return the version:

```
$ docker run -it pistacks/kubectl version
Client Version: version.Info{Major:"1", Minor:"19", GitVersion:"v1.19.0", GitCommit:"e19964183377d0ec2052d1f1fa930c4d7575bd50", GitTreeState:"clean", BuildDate:"2020-08-26T14:30:33Z", GoVersion:"go1.15", Compiler:"gc", Platform:"linux/arm"}
```

Map the kubeconfig to the container and set the `KUBECONFIG` environment variable to inform the binary where to find the config:

```
$ docker run -it -v /tmp/kubeconfig.yml:/tmp/kubeconfig.yml -e KUBECONFIG=/tmp/kubeconfig.yml pistacks/kubectl get nodes
NAME     STATUS   ROLES    AGE   VERSION
rpi-05   Ready    master   28h   v1.18.8+k3s1
rpi-06   Ready    <none>   28h   v1.18.8+k3s1
rpi-07   Ready    <none>   28h   v1.18.8+k3s1
```

Set it as a alias:

```
$ alias kubectl="docker run --rm -it -v /tmp/kubeconfig.yml:/tmp/kubeconfig.yml -e KUBECONFIG=/tmp/kubeconfig.yml pistacks/kubectl"
$ kubectl get nodes
NAME     STATUS   ROLES    AGE   VERSION
rpi-06   Ready    <none>   28h   v1.18.8+k3s1
rpi-07   Ready    <none>   28h   v1.18.8+k3s1
rpi-05   Ready    master   28h   v1.18.8+k3s1
```
