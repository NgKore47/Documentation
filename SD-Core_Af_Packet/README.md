# SD-Core_Af_Packet

#### In SD-Core_Af_Packet, we have to configure the following:
- `~/Aether/sd-core-5g-values.yaml`
	- use external IP for `AMF` --> same as `Data_Iface`
	- ***In the `plmn`, change the `mcc`, `mnc`*** as shown below, this part is very important.

> NOTE: Here is the list of all the changes that needs to be done on fresh OAI-SDR

```patch
diff --git a/sd-core-5g-values.yaml b/sd-core-5g-values.yaml
index 2dccc4f..3d526ad 100644
--- a/sd-core-5g-values.yaml
+++ b/sd-core-5g-values.yaml
@@ -67,9 +67,9 @@ omec-control-plane:
     amf:
       # use externalIP if you need to access your AMF from remote setup and you don't
       # want setup NodePort Service Type
-      #ngapp:
-        #externalIp: "128.110.219.37"
-        #port: 38412
+      ngapp:
+        externalIp: "192.168.2.183"
+        port: 38412
       cfgFiles:
         amfcfg.conf:
           configuration:
@@ -230,8 +230,8 @@ omec-sub-provision:
                 - name: "aiab-gnb2"
                   tac: 2
                 plmn:
-                  mcc: "208"
-                  mnc: "93"
+                  mcc: "001"
+                  mnc: "01"
                 site-name: "aiab"
                 upf:
                   upf-name: "upf"  # associated UPF for this slice. One UPF per Slice. Provide fully qualified name
@@ -300,7 +300,7 @@ omec-user-plane:
       execInParallel: false #run all profiles in parallel
       goProfile:
         enable: false #enable/disable golang profile in gnbsim
-        port: 5000
+      #   port: 5000
       httpServer:
         enable: false #enable httpServer in gnbsim
         port: 6000
```
