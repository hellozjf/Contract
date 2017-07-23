set IP=192.168.128.131
call native2ascii -encoding utf-8 properties/emxFrameworkStringResource_zh_CNNative.properties properties/emxFrameworkStringResource_zh_CN.properties
call pscp -pw webapp -r jpo webapp@%IP%:/home/webapp/
call pscp -pw webapp jsp/* webapp@%IP%:/home/webapp/data/as17x01/as-3dspaceNoCas/webapps/internal/common
call pscp -pw webapp -r mql webapp@%IP%:/home/webapp/
call pscp -pw webapp properties/* webapp@%IP%:/home/webapp/data/as17x01/as-3dspaceNoCas/webapps/internal/WEB-INF/classes