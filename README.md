# securityCheck

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Foneclickvirt%2FsecurityCheck&count_bg=%234AFEFF&title_bg=%23555555&icon=sonarcloud.svg&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

IP质量检测 - 安全检测

IP Quality Inspection - Security Check

## 使用-Usage

```
curl https://raw.githubusercontent.com/oneclickvirt/securityCheck/main/sc_install.sh -sSf | bash
```

OR

```
curl https://cdn.spiritlhl.net/https://raw.githubusercontent.com/oneclickvirt/securityCheck/main/sc_install.sh -sSf | bash
```

## 说明

- [x] 支持双语输出，以```-l```指定输出类型为```en```或```zh```，默认不指定时中文输出
- [x] 支持双栈检测，以```-c```指定检测的**本机IP类型**为```both```或```ipv4```或```ipv6```，默认不指定时检测双栈(IPV4和IPV6都检测)
- [x] 支持同时输出查询到的IP的ASN和地区信息，以```-e```指定```yes```或```no```，默认不指定时不打印IP的ASN和地区信息 
- [x] 支持15个IP相关数据库进行检测，由于检测可能过于火爆，不开源源码，仅提供编译后的文件
- [x] 使用有效的DNS黑名单进行查询(大概300多个有效网站)，每次查询都从[multirbl.valli.org](https://multirbl.valli.org/list/)自动获取黑名单查询地址(含邮箱检测)
- [x] 使用并发查询，整体查询最多不超过15秒
- [x] 支持所有主流架构和主流系统查询

## 截图

![图片](https://github.com/oneclickvirt/securityCheck/assets/103393591/4d049fc6-f54d-4e92-b6d5-3d496050ce63)

![图片](https://github.com/oneclickvirt/securityCheck/assets/103393591/cc1e6a8a-0d3f-40aa-b850-7968774c2889)

## Information

- [x] Support bilingual output, use ```-l``` to specify the output type as ```en``` or ```zh```, default is no Chinese output.
- [x] Support double-stack detection, use ```-c``` to specify the detected **local IP type** as ```both``` or ```ipv4``` or ```ipv6```, detect double-stack (both IPV4 and IPV6) when not specified by default.
- [x] Supports simultaneous output of ASN and region information of queried IPs, specify ```yes``` or ```no``` with ```-e```, by default ASN and region information of IPs are not printed when not specified. 
- [x] support 15 IP-related databases for detection, due to the detection may be too hot, not open source source code, only provide compiled files
- [x] use valid DNS blacklist for query(About 300 active website), each query from [multirbl.valli.org](https://multirbl.valli.org/list/) automatically get the blacklist query address (including mailbox detection)
- [x] Use concurrent query, the overall query will not exceed 15 seconds at most
- [x] support all major architectures and mainstream system queries

# 致谢

感谢 [ipinfo.io](https://ipinfo.io) [ip.sb](https://ip.sb) [cheervision.co](https://cheervision.co) [ipip.net](https://en.ipip.net) [cip.cc](http://www.cip.cc) [scamalytics.com](https://scamalytics.com) [abuseipdb.com](https://www.abuseipdb.com/) [virustotal.com](https://www.virustotal.com/) [ip2location.com](ip2location.com/) [ip-api.com](https://ip-api.com) [ipregistry.co](https://ipregistry.co/) [ipdata.co](https://ipdata.co/) [ipgeolocation.io](https://ipgeolocation.io) [ipwhois.io](https://ipwhois.io) [ipapi.com](https://ipapi.com/) [ipapi.is](https://ipapi.is/) 等网站提供的API进行检测，感谢互联网各网站提供的查询资源

# Thanks

Thanks [ipinfo.io](https://ipinfo.io) [ip.sb](https://ip.sb) [cheervision.co](https://cheervision.co) [ipip.net](https://en.ipip.net) [cip.cc](http://www.cip.cc) [scamalytics.com](https://scamalytics.com) [abuseipdb.com](https://www.abuseipdb.com/) [virustotal.com](https://www.virustotal.com/) [ip2location.com](ip2location.com/) [ip-api.com](https://ip-api.com) [ipregistry.co](https://ipregistry.co/) [ipdata.co](https://ipdata.co/) [ipgeolocation.io](https://ipgeolocation.io) [ipwhois.io](https://ipwhois.io) [ipapi.com](https://ipapi.com/) [ipapi.is](https://ipapi.is/) [abstractapi.com](https://abstractapi.com/) [ipqualityscore.com](https://www.ipqualityscore.com/) and so on. They provide APIs for testing, thanks to the query resources provided by various sites on the Internet.
