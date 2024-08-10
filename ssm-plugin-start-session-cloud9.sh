### https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html
### The Cloud9 instance must have an SSM IAM policy that allows starting a session

Admin:~/environment $ uname -a
Linux ip-172-31-64-57 6.5.0-1023-aws #23~22.04.1-Ubuntu SMP Fri Jun 21 19:23:45 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

Admin:~/environment $ curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 3728k  100 3728k    0     0  38.0M      0 --:--:-- --:--:-- --:--:-- 38.3M

Admin:~/environment $ sudo dpkg -i session-manager-plugin.deb
Selecting previously unselected package session-manager-plugin.
(Reading database ... 77292 files and directories currently installed.)
Preparing to unpack session-manager-plugin.deb ...
Preparing for install
Unpacking session-manager-plugin (1.2.650.0-1) ...
Setting up session-manager-plugin (1.2.650.0-1) ...
Creating symbolic link for session-manager-plugin

Admin:~/environment $ kubectl get node
NAME                             STATUS   ROLES    AGE     VERSION
ip-172-31-148-193.ec2.internal   Ready    <none>   3h59m   v1.29.6-eks-1552ad0
ip-172-31-151-219.ec2.internal   Ready    <none>   3h53m   v1.29.6-eks-1552ad0
ip-172-31-152-24.ec2.internal    Ready    <none>   169m    v1.29.6-eks-1552ad0
ip-172-31-156-11.ec2.internal    Ready    <none>   3h52m   v1.29.6-eks-1552ad0

Admin:~/environment $ kubectl describe node ip-172-31-148-193.ec2.internal | grep ProviderID
ProviderID:                   aws:///us-east-1d/i-063eb2f1e23588223
Admin:~/environment $ 

Admin:~/environment $ aws ssm start-session --target i-063eb2f1e23588223
Starting session with SessionId: i-0c9fe2ee9c90db8c6-ags4ieyoutxtbjbon3ea44socy
sh-5.2$ 
