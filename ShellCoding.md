＃ 第四章：SHELL脚本编程基础（实验）

## 实验目标

- 任务一：用bash编写一个图片批处理脚本，实现以下功能：
  - 支持命令行参数方式使用不同功能（完成）

  - 支持对指定目录下所有支持格式的图片文件进行批处理（完成）

  - 支持以下常见图片批处理功能的单独使用或组合使用（完成）

    - 支持对jpeg格式图片进行图片质量压缩（完成）

    - 支持对jpeg / png / svg格式图片在保持原始宽高比的压缩下压缩分辨率（完成）

    - 支持对图片批量添加自定义文本水印（完成）

    - 支持批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）（完成）

    - 支持将png / svg图片统一转换为jpg格式图片（完成）

- [x]任务二：用bash编写一个文本批处理脚本，对以下附件分别进行批量处理完成相应的数据统计任务：

  - [x] 2014世界杯运动员数据（完成）

    - [x]统计不同年龄区间范围（20岁以下，[20-30]，30岁以上）的球员数量，百分比（完成）

    - [x]统计不同场上位置的球员数量，百分比（完成）

    - [x]名字最长的球员是谁？名字最短的球员是谁？（完成）

    - [x]年龄最大的球员是谁？年龄最小的球员是谁？（完成）

  - [x] Web服务器访问日志

    - [x]统计访问来源主机TOP 100和分别对应出现的总次数（完成）

    - [x]统计访问来源主机TOP 100 IP和分别对应出现的总次数（完成）

    - [x]统计最暂时被访问的URL排名前100（完成）

    - [x]统计不同响应状态码的出现次数和对应百分比（完成）

    - [x]分别统计不同4XX状态码对应的前10个网址和对应出现的总次数（完成）

    - [x]给定URL输出TOP 100访问来源主机（完成）

## 实验环境

- Ubuntu的18.04
-使用ImageMagic进行图片处理

## 实验结果
### 任务一

-帮助信息如下
    ```
    ubuntu @ ubuntu: ~/ tasks：5-1.sh -h
    用法：
    -q [quality_num] [dir]对jpeg格式图片进行图片质量压缩
    -r [percent] [dir]对jpeg / png / svg格式图片在保持原始宽高比的预定下压缩分辨率
    -w [watermark_text] [dir]批量添加自定义文本水印
    -p [prefix_text] [dir]统一添加文件名前缀
    -s [suffix_text] [dir]统一添加文件名后缀
    -c [dir]将png / svg图片统一转换为jpg格式图片
    -h帮助文档
    ```

### 任务二

####  2014世界杯运动员数据

-帮助信息如下
  ```
  ubuntu @ ubuntu: ~/ tasks：5-1.sh -a
  用法：[选项] []
  选项：
  -a统计不同年龄区间范围（20岁以下，[20-30]，30岁以上）的球员数量，百分比
  -b统计不同场上位置的球员数量，百分比
  -c名字最高的球员是谁？名字最短的球员是谁？
  -d年龄最大的球员是谁？年龄最小的球员是谁？
  -h查看帮助信息
  ```

-统计结果如下
  ```
  ubuntu @ ubuntu: ~/ tasks：5-1.sh -b
  20岁以下的球员有9个，占比：1.223％
  20-30岁的球员有600个，占比：81.522％
  30岁以上的球员有127个，占比：17.255％
  xujiahui @ ubuntu：〜/ shells $ bash 5-2.sh -b 
  位于Midfielder场上的球员有268个，占比：36.413043％
  在Goalie场上的球员有96个，占比：13.043478％
  在Forward场上的球员有135个，占比：18.342391％
  在Défenseur场上的球员有1个，占比：0.135870％
  在Defender场上的球员有236个，占比：32.065217％
  ubuntu @ ubuntu: ~/ tasks：5-1.sh -c
  名字最长的球员是：
  弗朗西斯科·哈维尔·罗德里格斯
  Lazaros Christodoulopoulos
  Liassine Cadamuro-Bentaeba
  名字最短的球员是：
  乔
  ubuntu @ ubuntu: ~/ tasks：5-1.sh -d
  最小年龄是18，年龄最小的队员是：
  法布里·奥林加（Fabrice Olinga）
  卢克·肖
  最大年龄是42，年龄最大的队员是：
  Faryd Mondragon
  ```

####  Web服务器访问日志

-帮助信息如下
    ```
   ubuntu @ ubuntu: ~/ tasks：5-2.sh -h
    用法：[选项] []
    选项：
    -a统计访问来源主机TOP 100和分别对应出现的总次数
    -b统计访问来源主机TOP 100 IP和分别对应出现的总次数
    -c统计最快速被访问的URL排名前100
    -d统计不同响应状态码的出现次数和对应百分比
    -e分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
    -u [url]给定URL输出TOP 100访问来源主机
    -h查看帮助信息
    ```

-统计结果如下
    ```
    ubuntu @ ubuntu: ~/ tasks：5-2.sh -a
    show_top100_host
    host_name：edams.ksc.nasa.gov 6530	
    host_name：piweba4y.prodigy.com 4846	
    主机名：163.206.89.4 4791	
    host_name：piweba5y.prodigy.com 4607	
    host_name：piweba3y.prodigy.com 4416	
    主机名：www-d1.proxy.aol.com 3889	
    主机名：www-b2.proxy.aol.com 3534	
    主机名：www-b3.proxy.aol.com 3463	
    主机名：www-c5.proxy.aol.com 3423	
    主机名：www-b5.proxy.aol.com 3411	
    主机名：www-c2.proxy.aol.com 3407	
    主机名：www-d2.proxy.aol.com 3404	
    主机名：www-a2.proxy.aol.com 3337	
    host_name：news.ti.com 3298	
    主机名：www-d3.proxy.aol.com 3296	
    主机名：www-b4.proxy.aol.com 3293	
    主机名：www-c3.proxy.aol.com 3272	
    主机名：www-d4.proxy.aol.com 3234	
    主机名：www-c1.proxy.aol.com 3177	
    主机名：www-c4.proxy.aol.com 3134	
    host_name：intgate.raleigh.ibm.com 3123	
    主机名：www-c6.proxy.aol.com 3088	
    主机名：www-a1.proxy.aol.com 3041	
    host_name：mpngate1.ny.us.ibm.net 3011	
    主机名：e659229.boeing.com 2983	
    host_name：piweba1y.prodigy.com 2957	
    host_name：webgate1.mot.com 2906	
    主机名：www-relay.pa-x.dec.com 2761	
    host_name：beta.xerox.com 2318	
    host_name：poppy.hensa.ac.uk 2311	
    host_name：vagrant.vf.mmc.com 2237	
    host_name：palona1.cns.hp.com 1910	
    主机名：www-proxy.crl.research.digital.com 1793	
    host_name：koriel.sun.com 1762	
    主机名：derec 1681	
    主机名：trusty.lmsc.lockheed.com 1637	
    host_name：gw2.att.com 1623	
    host_name：cliffy.lfwc.lockheed.com 1563	
    host_name：inet2.tek.com 1503	
    host_name：disarray.demon.co.uk 1485	
    host_name：gw1.att.com 1467	
    host_name：128.217.62.1 1435	
    host_name：interlock.turner.com 1395	
    主机名：163.205.1.19 1360	
    host_name：sgigate.sgi.com 1354	
    host_name：bocagate.bocaraton.ibm.com 1336	
    host_name：piweba2y.prodigy.com 1324	
    host_name：gw3.att.com 1311	
    host_name：keyhole.es.dupont.com 1310	
    host_name：n1144637.ksc.nasa.gov 1297	
    主机名：163.205.3.104 1292	
    主机名：163.205.156.16 1256	
    主机名：163.205.19.20 1252	
    host_name：erigate.ericsson.se 1216	
    host_name：gn2.getnet.com 1211	
    host_name：gwa.ericsson.com 1089	
    host_name：tiber.gsfc.nasa.gov 1079	
    主机名：128.217.62.2 1054	
    host_name：bstfirewall.bst.bls.com 1017	
    主机名：163.206.137.21 1015	
    host_name：spider.tbe.com 1013	
    host_name：gatekeeper.us.oracle.com 1010	
    主机名：www-c8.proxy.aol.com 995	
    主机名：whopkins.sso.az.honeywell.com 984	
    host_name：news.dfrc.nasa.gov 966	
    主机名：128.159.122.110 949	
    主机名：proxy0.research.att.com 940	
    主机名：proxy.austin.ibm.com 925	
    主机名：www-c9.proxy.aol.com 902	
    主机名：bbuig150.unisys.com 901	
    host_name：corpgate.nt.com 899	
    主机名：sahp315.sandia.gov 890	
    host_name：amdext.amd.com 869	
    主机名：128.159.132.56 848	
    host_name：n1121796.ksc.nasa.gov 830	
    主机名：igate.uswest.com 825	
    host_name：gatekeeper.cca.rockwell.com 819	
    主机名：wwwproxy.sanders.com 815	
    host_name：gw4.att.com 814	
    host_name：goose.sms.fi 812	
    主机名：128.159.144.83 808	
    host_name：jericho3.microsoft.com 805	
    主机名：128.159.111.141 798	
    host_name：jericho2.microsoft.com 786	
    主机名：sdn_b6_f02_ip.dny.rockwell.com 782	
    主机名：lamar.d48.lilly.com 778	
    主机名：163.205.11.31 776	
    主机名：heimdallp2.compaq.com 772	
    host_name：stortek1.stortek.com 771	
    主机名：163.205.16.75 762	
    主机名：mac998.kip.apple.com 759	
    host_name：tia1.eskimo.com 742	
    主机名：www-e1f.gnn.com 733	
    主机名：www-b1.proxy.aol.com 718	
    host_name：reddragon.ksc.nasa.gov 715	
    主机名：128.159.122.137 711	
    host_name：rmcg.cts.com 701	
    host_name：bambi.te.rl.ac.uk 701	
    主机名：electron.mcc.com 697	
    主机名：163.205.23.76 691	
    ```

    ```
    ubuntu @ ubuntu: ~/ tasks：5-2.sh -b
    show_top_100_ip
    ip：163.206.89.4 4791	
    ip：128.217.62.1 1435	
    ip：163.205.1.19 1360	
    ip：163.205.3.104 1292	
    ip：163.205.156.16 1256	
    ip：163.205.19.20 1252	
    ip：128.217.62.2 1054	
    ip：163.206.137.21 1015	
    ip：128.159.122.110 949	
    ip：128.159.132.56 848	
    ip：128.159.144.83 808	
    ip：128.159.111.141 798	
    ip：163.205.11.31 776	
    ip：163.205.16.75 762	
    ip：128.159.122.137 711	
    ip：163.205.23.76 691	
    ip：206.27.25.1 672	
    ip：198.83.19.44 647	
    ip：199.1.50.225 641	
    ip：163.205.23.93 624	
    ip：139.169.174.102 610	
    ip：163.205.121.3 600	
    ip：140.229.116.37 598	
    ip：141.102.82.127 591	
    ip：163.206.140.4 586	
    ip：163.206.104.34 573	
    ip：204.62.245.32 567	
    ip：128.159.122.38 565	
    ip：128.217.62.224 563	
    ip：128.159.122.107 563	
    ip：128.159.122.180 553	
    ip：128.159.123.58 549	
    ip：163.205.154.11 544	
    ip：192.112.22.119 532	
    ip：163.205.16.100 518	
    ip：199.201.186.103 503	
    ip：128.159.146.40 503	
    ip：128.159.122.160 494	
    ip：192.77.40.4 486	
    ip：193.143.192.106 482	
    ip：152.163.192.5 480	
    ip：163.205.23.71 478	
    ip：139.169.30.50 475	
    ip：128.159.122.144 469	
    ip：163.234.140.22 466	
    ip：163.205.150.22 463	
    ip：128.217.61.184 457	
    ip：163.205.23.72 451	
    ip：198.83.19.40 448	
    ip：128.159.122.14 446	
    ip：199.201.186.104 443	
    ip：198.83.19.47 443	
    ip：128.217.61.15 443	
    ip：128.159.121.34 441	
    ip：128.159.121.41 438	
    ip：160.205.119.27 435	
    ip：163.205.154.17 432	
    ip：152.163.192.38 432	
    ip：128.159.122.15 432	
    ip：128.159.135.73 423	
    ip：128.159.135.38 423	
    ip：152.163.192.35 421	
    ip：128.159.76.128 415	
    ip：152.163.192.71 413	
    ip：128.159.63.159 412	
    ip：163.205.12.100 409	
    ip：133.53.64.33 404	
    ip：152.163.192.70 402	
    ip：128.159.121.64 397	
    ip：129.239.68.160 396	
    ip：152.163.192.36 391	
    ip：163.205.16.90 389	
    ip：128.32.196.94 389	
    ip：163.205.1.18 385	
    ip：163.206.136.1 384	
    ip：147.147.191.43 383	
    ip：163.205.16.104 374	
    ip：152.163.192.69 374	
    ip：193.178.53.180 373	
    ip：128.217.63.27 371	
    ip：130.110.74.81 367	
    ip：204.69.0.27 366	
    ip：163.206.130.46 365	
    ip：152.163.192.67 359	
    ip：163.205.54.76 357	
    ip：152.163.192.7 356	
    ip：198.83.19.43 354	
    ip：128.159.137.43 350	
    ip：147.74.110.61 348	
    ip：163.205.23.44 345	
    ip：128.159.168.162 343	
    ip：158.27.59.88 336	
    ip：152.163.192.3 336	
    ip：163.205.166.15 335	
    ip：128.159.145.21 335	
    ip：163.205.2.180 332	
    ip：128.217.61.98 329	
    ip：152.163.192.66 328	
    ip：163.205.3.38 324	
    ip：163.205.2.35 324	
    ```

    ```
    ubuntu @ ubuntu: ~/ tasks：5-2.sh -c
    show_top100_url
    网址：/images/NASA-logosmall.gif 97410	
    网址：/images/KSC-logosmall.gif 75337	
    网址：/images/MOSAIC-logosmall.gif 67448	
    网址：/images/USA-logosmall.gif 67068	
    网址：/images/WORLD-logosmall.gif 66444	
    网址：/images/ksclogo-medium.gif 62778	
    网址：/ksc.html 43687	
    网址：/history/apollo/images/apollo-logo1.gif 37826	
    网址：/images/launch-logo.gif 35138	
    网址：/ 30346	
    网址：/images/ksclogosmall.gif 27810	
    网址：/shuttle/missions/sts-69/mission-sts-69.html 24606	
    网址：/班车/倒数/ 24461	
    网址：/shuttle/missions/sts-69/count69.gif 24383	
    网址：/shuttle/missions/sts-69/sts-69-patch-small.gif 23405	
    网址：/shuttle/missions/missions.html 22453	
    网址：/images/launchmedium.gif 19877	
    网址：/htbin/cdt_main.pl 17247	
    网址：/shuttle/countdown/images/countclock.gif 12160	
    网址：/icons/menu.xbm 12137	
    网址：/icons/blank.xbm 12057	
    网址：/software/winvn/winvn.html 10345	
    网址：/icons/image.xbm 10308	
    网址：/history/history.html 10134	
    网址：/history/apollo/images/footprint-logo.gif 10126	
    网址：/history/apollo/images/apollo-small.gif 9439	
    网址：/history/apollo/images/footprint-small.gif 9230	
    网址：/software/winvn/winvn.gif 9037	
    网址：/history/apollo/apollo.html 8985	
    网址：/software/winvn/wvsmall.gif 8662	
    网址：/software/winvn/bluemarb.gif 8610	
    网址：/htbin/cdt_clock.pl 8583	
    网址：/shuttle/countdown/liftoff.html 7865	
    网址：/shuttle/resources/orbiters/orbiters-logo.gif 7389	
    网址：/images/shuttle-patch-logo.gif 7261	
    网址：/history/apollo/apollo-13/apollo-13.html 7177	
    网址：/ images / 7040	
    网址：/shuttle/countdown/video/livevideo2.gif 7029	
    网址：/images/kscmap-tiny.gif 6615	
    网址：/shuttle/technology/sts-newsref/stsref-toc.html 6517	
    网址：/history/apollo/apollo-13/apollo-13-patch-small.gif 6309	
    网址：/shuttle/missions/sts-71/sts-71-patch-small.gif 5613	
    网址：/shuttle/missions/sts-69/images/images.html 5264	
    网址：/icons/text.xbm 5248	
    网址：/images/construct.gif 5093	
    网址：/images/shuttle-patch-small.gif 4869	
    网址：/shuttle/missions/sts-69/movies/movies.html 4846	
    网址：/shuttle/missions/sts-70/sts-70-patch-small.gif 4791	
    网址：/icons/unknown.xbm 4785	
    网址：/shuttle/missions/sts-69/liftoff.html 4559	
    网址：/facilities/lc39a.html 4464	
    网址：/shuttle/resources/orbiters/endeavour.html 4434	
    网址：/history/apollo/images/apollo-logo.gif 4365	
    网址：/shuttle/missions/sts-70/mission-sts-70.html 4066	
    网址：/images/lc39a-logo.gif 4024	
    网址：/shuttle/resources/orbiters/endeavour-logo.gif 3817	
    网址：/shuttle/technology/sts-newsref/sts_asm.html 3706	
    网址：/shuttle/countdown/countdown.html 3518	
    网址：/shuttle/missions/sts-71/movies/movies.html 3507	
    网址：/shuttle/countdown/video/livevideo.jpeg 3377	
    网址：/history/apollo/apollo-11/apollo-11.html 3140	
    网址：/shuttle/missions/sts-71/mission-sts-71.html 3130	
    网址：/shuttle/missions/sts-70/images/images.html 3087	
    网址：/shuttle/missions/sts-71/images/images.html 2945	
    网址：/shuttle/missions/sts-73/mission-sts-73.html 2939	
    网址：/images/faq.gif 2865	
    网址：/shuttle/technology/images/srb_mod_compare_1-small.gif 2864	
    网址：/shuttle/technology/images/srb_mod_compare_3-small.gif 2818	
    网址：/shuttle/technology/images/srb_mod_compare_6-small.gif 2715	
    网址：/history/apollo/apollo-11/apollo-11-patch-small.gif 2701	
    网址：/elv/elvpage.htm 2586	
    网址：/shuttle/missions/sts-73/sts-73-patch-small.gif 2544	
    网址：/shuttle/countdown/video/sts-69-prelaunch-pad.gif 2385	
    网址：/shuttle/missions/51-l/mission-51-l.html 2343	
    网址：/images/launch-small.gif 2293	
    网址：/facilities/tour.html 2256	
    网址：/shuttle/missions/51-l/51-l-patch-small.gif 2201	
    网址：/images/kscmap-small.gif 2172	
    网址：/shuttle/resources/orbiters/challenger.html 2171	
    网址：/shuttle/missions/sts-71/movies/sts-71-launch.mpg 2159	
    网址：/shuttle/technology/sts-newsref/sts-lcc.html 2146	
    网址：/htbin/wais.pl 2133	
    网址：/facts/about_ksc.html 2120	
    网址：/history/mercury/mercury.html 2107	
    网址：/images/mercury-logo.gif 2040	
    网址：/elv/elvhead3.gif 1991	
    网址：/images/launchpalms-small.gif 1979年	
    网址：/images/whatsnew.gif 1936年	
    网址：/history/apollo/apollo-spacecraft.txt 1929	
    网址：/facilities/vab.html 1915	
    网址：/shuttle/resources/orbiters/columbia.html 1912	
    网址：/shuttle/countdown/lps/fr.html 1908	
    网址：/shuttle/resources/orbiters/challenger-logo.gif 1904年	
    网址：/images/ksclogo.gif 1892	
    网址：/whats-new.html 1891	
    网址：/elv/endball.gif 1874	
    网址：/history/apollo/apollo-13/apollo-13-info.html 1869	
    网址：/shuttle/missions/sts-74/mission-sts-74.html 1868	
    网址：/elv/PEGASUS/minpeg1.gif 1845	
    网址：/elv/SCOUT/scout.gif 1835	
    ```

    ```
    ubuntu @ ubuntu: ~/ tasks：5-2.sh -d
    show_status_code
    状态：200 num：1398987百分比：89.11392％	
    状态：302编号：26497百分比：1.68783％	
    状态：304数量：134146百分比：8.54495％	
    状态：403数量：171百分比：0.01089％	
    状态：404编号：10055百分比：0.64049％	
    状态：500数量：3百分比：0.00019％	
    状态：501数量：27百分比：0.00172％	
    ```

    ```
    ubuntu @ ubuntu: ~/ tasks：5-2.sh -e
    403 top10：
    网址：/software/winvn/winvn.html/wvsmall.gif 32	
    网址：/software/winvn/winvn.html/winvn.gif 32	
    网址：/software/winvn/winvn.html/bluemarb.gif 32	
    网址：/ksc.html/images/ksclogo-medium.gif 12	
    网址：/ksc.html/images/WORLD-logosmall.gif 10	
    网址：/ksc.html/images/USA-logosmall.gif 10	
    网址：/ksc.html/images/NASA-logosmall.gif 10	
    网址：/ksc.html/images/MOSAIC-logosmall.gif 10	
    网址：/ksc.html/facts/about_ksc.html 5	
    网址：/ksc.html/shuttle/missions/missions.html 4	
    
    404 top10：
    网址：/pub/winvn/readme.txt 1337	
    网址：/pub/winvn/release.txt 1185	
    网址：/shuttle/missions/STS-69/mission-STS-69.html 683	
    网址：/images/nasa-logo.gif 319	
    网址：/shuttle/missions/sts-68/ksc-upclose.gif 253	
    网址：/elv/DELTA/uncons.htm 209	
    网址：/history/apollo/sa-1/sa-1-patch-small.gif 200	
    网址：/：//spacelink.msfc.nasa.gov 166	
    网址：/images/crawlerway-logo.gif 160	
    网址：/history/apollo/a-001/a-001-patch-small.gif 154
    ```

    ```
    ubuntu @ ubuntu: ~/ tasks：5-3.sh -u /images/USA-logosmall.gif
    show_url
    输入网址：/images/USA-logosmall.gif
    主持人：edams.ksc.nasa.gov 867	
    主持人：163.206.89.4 237	
    主持人：n1144637.ksc.nasa.gov 213	
    主持人：163.205.19.20 204	
    主持人：128.217.62.1 198	
    主持人：163.205.3.104 166	
    主持人：n1121796.ksc.nasa.gov 136	
    主持人：www-b2.proxy.aol.com 131	
    主持人：www-b3.proxy.aol.com 128	
    主持人：www-b4.proxy.aol.com 126	
    主持人：www-d3.proxy.aol.com 123	
    主持人：163.205.11.31 122	
    主持人：piweba4y.prodigy.com 120	
    主机：mpngate1.ny.us.ibm.net 120	
    主持人：www-d1.proxy.aol.com 117	
    主持人：www-b5.proxy.aol.com 116	
    主持人：piweba5y.prodigy.com 116	
    主持人：www-c6.proxy.aol.com 113	
    主持人：www-c5.proxy.aol.com 113	
    主持人：www-c2.proxy.aol.com 113	
    主持人：www-c1.proxy.aol.com 113	
    主持人：piweba3y.prodigy.com 113	
    主持人：www-d4.proxy.aol.com 111	
    主持人：www-d2.proxy.aol.com 111	
    主持人：www-a1.proxy.aol.com 111	
    主持人：163.205.23.76 111	
    主持人：www-c4.proxy.aol.com 110	
    主持人：www-c3.proxy.aol.com 110	
    主持人：128.159.144.83 110	
    主持人：n1131455.ksc.nasa.gov 108	
    主持人：n1376232.ksc.nasa.gov 107	
    主持人：www-a2.proxy.aol.com 106	
    主持人：n1040681.ksc.nasa.gov 106	
    主持人：128.217.62.2 106	
    主持人：163.205.16.75 105	
    主持人：n1123413.ksc.nasa.gov 104	
    主持人：163.205.23.93 104	
    主持人：n1123543.ksc.nasa.gov 101	
    主持人：163.205.121.3 99	
    主机：webgate1.mot.com 91	
    主机：intgate.raleigh.ibm.com 91	
    主持人：128.159.132.56 91	
    主持人：derec 89	
    主持人：163.206.104.34 89	
    主持人：n1144796.ksc.nasa.gov 88	
    主持人：poppy.hensa.ac.uk 87	
    主持人：163.205.154.11 87	
    主持人：n1142702.ksc.nasa.gov 86	
    主持人：n1031729.ksc.nasa.gov 84	
    主持人：163.205.16.100 84	
    主持人：n1031701.ksc.nasa.gov 82	
    主持人：n1123724.ksc.nasa.gov 79	
    主持人：n1123209.ksc.nasa.gov 79	
    主持人：n1121793.ksc.nasa.gov 79	
    主持人：piweba1y.prodigy.com 76	
    主持人：n167331.ksc.nasa.gov 76	
    主持人：n1031727.ksc.nasa.gov 75	
    主持人：128.217.61.15 73	
    主持人：n1144636.ksc.nasa.gov 71	
    主持人：n1032026.ksc.nasa.gov 71	
    主持人：bensmtp.ksc.nasa.gov 71	
    主持人：news.ti.com 70	
    主持人：n1031857.ksc.nasa.gov 70	
    主持人：163.206.140.4 70	
    主持人：163.205.23.71 70	
    主持人：128.159.135.73 70	
    主持人：n1028288.ksc.nasa.gov 69	
    主持人：n1031627.ksc.nasa.gov 68	
    主持人：n1028722.ksc.nasa.gov 68	
    主持人：163.205.12.100 67	
    主持人：pl01265.ksc.nasa.gov 66	
    主持人：163.205.23.72 66	
    主持人：128.159.146.40 66	
    主持人：n167440.ksc.nasa.gov 65	
    主持人：128.159.122.14 65	
    主持人：163.205.16.90 64	
    主持人：128.217.61.98 64	
    主持人：128.159.63.159 64	
    主持人：www-proxy.crl.research.digital.com 63	
    主持人：192.77.40.4 63	
    主持人：163.205.1.19 63	
    主持人：128.159.135.38 63	
    主持人：palona1.cns.hp.com 61	
    主持人：n1032336.ksc.nasa.gov 61	
    主持人：n1123732.ksc.nasa.gov 60	
    主持人：waldtsvr.ksc.nasa.gov 59	
    主机：bocagate.bocaraton.ibm.com 59	
    主持人：n868370.ksc.nasa.gov 58	
    主持人：128.159.168.162 57	
    主持人：128.159.121.41 57	
    主持人：vagrant.vf.mmc.com 56	
    主持人：n874797.ksc.nasa.gov 56	
    主持人：n1135966.ksc.nasa.gov 56	
    主持人：163.205.162.111 56	
    主持人：163.205.150.22 56	
    主持人：n1121869.ksc.nasa.gov 55	
    主持人：lahal.ksc.nasa.gov 55	
    主持人：192.112.22.119 55	
    主持人：128.159.123.58 55	
    主持人：n1121985.ksc.nasa.gov 54	
    ```