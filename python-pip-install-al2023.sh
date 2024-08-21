[ec2-user@ip-172-31-156-11 ~]$ uname -r
6.1.102-108.177.amzn2023.x86_64
[ec2-user@ip-172-31-156-11 ~]$ sudo dnf search python3.11
Last metadata expiration check: 0:07:54 ago on Wed Aug 21 00:17:42 2024.
================================================================================================ Name Exactly Matched: python3.11 ================================================================================================
python3.11.x86_64 : Version 3.11 of the Python interpreter
==================================================================================================== Name Matched: python3.11 ====================================================================================================
python3.11-debug.x86_64 : Debug version of the Python runtime
python3.11-devel.x86_64 : Libraries and header files needed for Python development
python3.11-idle.x86_64 : A basic graphical development environment for Python
python3.11-libs.x86_64 : Python runtime libraries
python3.11-pip.noarch : A tool for installing and managing Python packages
python3.11-pip-wheel.noarch : The pip wheel
python3.11-setuptools.noarch : Easily build and distribute Python packages
python3.11-setuptools-wheel.noarch : The setuptools wheel
python3.11-test.x86_64 : The self-test suite for the main python3 package
python3.11-tkinter.x86_64 : A GUI toolkit for Python
python3.11-wheel.noarch : Built-package format for Python
python3.11-wheel-wheel.noarch : The Python wheel module packaged as a wheel
[ec2-user@ip-172-31-156-11 ~]$ sudo dnf install python3.11 -y
Last metadata expiration check: 0:09:20 ago on Wed Aug 21 00:17:42 2024.
Dependencies resolved.
==================================================================================================================================================================================================================================
 Package                                                          Architecture                                Version                                                      Repository                                        Size
==================================================================================================================================================================================================================================
Installing:
 python3.11                                                       x86_64                                      3.11.6-1.amzn2023.0.3                                        amazonlinux                                       28 k
Installing dependencies:
 mpdecimal                                                        x86_64                                      2.5.1-3.amzn2023.0.3                                         amazonlinux                                      101 k
 python3.11-libs                                                  x86_64                                      3.11.6-1.amzn2023.0.3                                        amazonlinux                                      9.3 M
 python3.11-pip-wheel                                             noarch                                      22.3.1-2.amzn2023.0.2                                        amazonlinux                                      1.4 M
 python3.11-setuptools-wheel                                      noarch                                      65.5.1-2.amzn2023.0.5                                        amazonlinux                                      718 k
Installing weak dependencies:
 libxcrypt-compat                                                 x86_64                                      4.4.33-7.amzn2023                                            amazonlinux                                       92 k

Transaction Summary
==================================================================================================================================================================================================================================
Install  6 Packages

Total download size: 12 M
Installed size: 47 M
Downloading Packages:
(1/6): python3.11-3.11.6-1.amzn2023.0.3.x86_64.rpm                                                                                                                                                 92 kB/s |  28 kB     00:00    
(2/6): mpdecimal-2.5.1-3.amzn2023.0.3.x86_64.rpm                                                                                                                                                  284 kB/s | 101 kB     00:00    
(3/6): libxcrypt-compat-4.4.33-7.amzn2023.x86_64.rpm                                                                                                                                              240 kB/s |  92 kB     00:00    
(4/6): python3.11-setuptools-wheel-65.5.1-2.amzn2023.0.5.noarch.rpm                                                                                                                               3.0 MB/s | 718 kB     00:00    
(5/6): python3.11-pip-wheel-22.3.1-2.amzn2023.0.2.noarch.rpm                                                                                                                                      3.4 MB/s | 1.4 MB     00:00    
(6/6): python3.11-libs-3.11.6-1.amzn2023.0.3.x86_64.rpm                                                                                                                                           4.0 MB/s | 9.3 MB     00:02    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                                                             4.0 MB/s |  12 MB     00:02     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                                                          1/1 
  Installing       : python3.11-setuptools-wheel-65.5.1-2.amzn2023.0.5.noarch                                                                                                                                                 1/6 
  Installing       : mpdecimal-2.5.1-3.amzn2023.0.3.x86_64                                                                                                                                                                    2/6 
  Installing       : libxcrypt-compat-4.4.33-7.amzn2023.x86_64                                                                                                                                                                3/6 
  Installing       : python3.11-pip-wheel-22.3.1-2.amzn2023.0.2.noarch                                                                                                                                                        4/6 
  Installing       : python3.11-3.11.6-1.amzn2023.0.3.x86_64                                                                                                                                                                  5/6 
  Installing       : python3.11-libs-3.11.6-1.amzn2023.0.3.x86_64                                                                                                                                                             6/6 
  Running scriptlet: python3.11-libs-3.11.6-1.amzn2023.0.3.x86_64                                                                                                                                                             6/6 
  Verifying        : libxcrypt-compat-4.4.33-7.amzn2023.x86_64                                                                                                                                                                1/6 
  Verifying        : mpdecimal-2.5.1-3.amzn2023.0.3.x86_64                                                                                                                                                                    2/6 
  Verifying        : python3.11-3.11.6-1.amzn2023.0.3.x86_64                                                                                                                                                                  3/6 
  Verifying        : python3.11-libs-3.11.6-1.amzn2023.0.3.x86_64                                                                                                                                                             4/6 
  Verifying        : python3.11-pip-wheel-22.3.1-2.amzn2023.0.2.noarch                                                                                                                                                        5/6 
  Verifying        : python3.11-setuptools-wheel-65.5.1-2.amzn2023.0.5.noarch                                                                                                                                                 6/6 
==================================================================================================================================================================================================================================
WARNING:
  A newer release of "Amazon Linux" is available.

  Available Versions:

  Version 2023.5.20240819:
    Run the following command to upgrade to 2023.5.20240819:

      dnf upgrade --releasever=2023.5.20240819

    Release notes:
     https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes-2023.5.20240819.html

==================================================================================================================================================================================================================================

Installed:
  libxcrypt-compat-4.4.33-7.amzn2023.x86_64                 mpdecimal-2.5.1-3.amzn2023.0.3.x86_64                            python3.11-3.11.6-1.amzn2023.0.3.x86_64         python3.11-libs-3.11.6-1.amzn2023.0.3.x86_64        
  python3.11-pip-wheel-22.3.1-2.amzn2023.0.2.noarch         python3.11-setuptools-wheel-65.5.1-2.amzn2023.0.5.noarch        

Complete!
[ec2-user@ip-172-31-156-11 ~]$ python3.11 -m pip --version
/usr/bin/python3.11: No module named pip
[ec2-user@ip-172-31-156-11 ~]$ /usr/bin/python3.11: No module named pip
bash: /usr/bin/python3.11:: No such file or directory
[ec2-user@ip-172-31-156-11 ~]$ sudo dnf install python3.11-pip -y
Last metadata expiration check: 0:10:19 ago on Wed Aug 21 00:17:42 2024.
Dependencies resolved.
==================================================================================================================================================================================================================================
 Package                                                      Architecture                                  Version                                                      Repository                                          Size
==================================================================================================================================================================================================================================
Installing:
 python3.11-pip                                               noarch                                        22.3.1-2.amzn2023.0.2                                        amazonlinux                                        2.7 M
Installing weak dependencies:
 python3.11-setuptools                                        noarch                                        65.5.1-2.amzn2023.0.5                                        amazonlinux                                        1.5 M

Transaction Summary
==================================================================================================================================================================================================================================
Install  2 Packages

Total download size: 4.3 M
Installed size: 20 M
Downloading Packages:
(1/2): python3.11-setuptools-65.5.1-2.amzn2023.0.5.noarch.rpm                                                                                                                                     1.9 MB/s | 1.5 MB     00:00    
(2/2): python3.11-pip-22.3.1-2.amzn2023.0.2.noarch.rpm                                                                                                                                            3.3 MB/s | 2.7 MB     00:00    
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                                                             3.8 MB/s | 4.3 MB     00:01     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                                                          1/1 
  Installing       : python3.11-setuptools-65.5.1-2.amzn2023.0.5.noarch                                                                                                                                                       1/2 
  Installing       : python3.11-pip-22.3.1-2.amzn2023.0.2.noarch                                                                                                                                                              2/2 
  Running scriptlet: python3.11-pip-22.3.1-2.amzn2023.0.2.noarch                                                                                                                                                              2/2 
  Verifying        : python3.11-pip-22.3.1-2.amzn2023.0.2.noarch                                                                                                                                                              1/2 
  Verifying        : python3.11-setuptools-65.5.1-2.amzn2023.0.5.noarch                                                                                                                                                       2/2 
==================================================================================================================================================================================================================================
WARNING:
  A newer release of "Amazon Linux" is available.

  Available Versions:

  Version 2023.5.20240819:
    Run the following command to upgrade to 2023.5.20240819:

      dnf upgrade --releasever=2023.5.20240819

    Release notes:
     https://docs.aws.amazon.com/linux/al2023/release-notes/relnotes-2023.5.20240819.html

==================================================================================================================================================================================================================================

Installed:
  python3.11-pip-22.3.1-2.amzn2023.0.2.noarch                                                                  python3.11-setuptools-65.5.1-2.amzn2023.0.5.noarch                                                                 

Complete!
[ec2-user@ip-172-31-156-11 ~]$ python3.11 --version
Python 3.11.6
[ec2-user@ip-172-31-156-11 ~]$ python3.11 -m pip --version
pip 22.3.1 from /usr/lib/python3.11/site-packages/pip (python 3.11)
[ec2-user@ip-172-31-156-11 ~]$ 
