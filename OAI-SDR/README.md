# OAI-SDR

#### In OAI-SDR, we have to configure the following:
- `~/openairinterface5g/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band78.fr1.106PRB.usrpb210.conf`
	- ***In the `plmn_list`, change the *mcc*, *mnc*, and *sd**** section as shown below, this part is very important.
	- Change the `amf_ip_address` with your core *amf ip address*
	- Also change the Network Interface of `GNB` for `NG_AMF` and `NGU`

> NOTE: Here is the list of all the changes that needs to be done on fresh OAI-SDR

```patch
diff --git a/cmake_targets/tools/build_helper b/cmake_targets/tools/build_helper
index ed02847387..9cbf21863e 100755
--- a/cmake_targets/tools/build_helper
+++ b/cmake_targets/tools/build_helper
@@ -349,7 +349,7 @@ check_install_usrp_uhd_driver(){
             $SUDO apt-get -y install libuhd-dev libuhd3.15.0 uhd-host
             ;;
           "ubuntu18.04" | "ubuntu20.04" | "ubuntu22.04")
-            $SUDO apt-get -y install libuhd-dev libuhd4.2.0 uhd-host
+            $SUDO apt-get -y install libuhd-dev uhd-host
             ;;
         esac
     elif [[ "$OS_BASEDISTRO" == "fedora" ]]; then

diff --git a/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band78.fr1.106PRB.usrpb210.conf b/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band78.fr1.106PRB.usrpb210.conf
index ccfd5ea56c..0fb5f854f6 100644
--- a/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band78.fr1.106PRB.usrpb210.conf
+++ b/targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band78.fr1.106PRB.usrpb210.conf

@@ -7,11 +7,11 @@ gNBs =
  {
     ////////// Identification parameters:
     gNB_ID    =  0xe00;
-    gNB_name  =  "gNB-OAI";
+    gNB_name  =  "aiab-gnb1";
 
     // Tracking area code, 0x0000 and 0xfffe are reserved values
     tracking_area_code  =  1;
-    plmn_list = ({ mcc = 001; mnc = 01; mnc_length = 2; snssaiList = ({ sst = 1; sd = 0x1; }) });
+    plmn_list = ({ mcc = 001; mnc = 01; mnc_length = 2; snssaiList = ({ sst = 1; sd = 0x010203; }) });
 
     nr_cellid = 12345678L;
 
@@ -166,7 +166,7 @@ gNBs =
 
 
     ////////// AMF parameters:
-    amf_ip_address      = ( { ipv4       = "192.168.70.132";
+    amf_ip_address      = ( { ipv4       = "128.110.219.37";
                               ipv6       = "192:168:30::17";
                               active     = "yes";
                               preference = "ipv4";
@@ -176,10 +176,10 @@ gNBs =
 
     NETWORK_INTERFACES :
     {
-        GNB_INTERFACE_NAME_FOR_NG_AMF            = "demo-oai";
-        GNB_IPV4_ADDRESS_FOR_NG_AMF              = "192.168.70.129/24";
-        GNB_INTERFACE_NAME_FOR_NGU               = "demo-oai";
-        GNB_IPV4_ADDRESS_FOR_NGU                 = "192.168.70.129/24";
+        GNB_INTERFACE_NAME_FOR_NG_AMF            = "enp5s0";
+        GNB_IPV4_ADDRESS_FOR_NG_AMF              = "192.168.1.136/24";
+        GNB_INTERFACE_NAME_FOR_NGU               = "enp5s0";
+        GNB_IPV4_ADDRESS_FOR_NGU                 = "192.168.1.136/24";
         GNB_PORT_FOR_S1U                         = 2152; # Spec 2152
     };
```
