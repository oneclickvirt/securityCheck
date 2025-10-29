# securityCheck

[![Hits](https://hits.spiritlhl.net/securityCheck.svg?action=hit&title=Hits&title_bg=%23555555&count_bg=%230eecf8&edge_flat=false)](https://hits.spiritlhl.net)

IP质量检测 - 安全检测

IP Quality Inspection - Security Check

## 使用-Usage

相关参考指标见：https://github.com/oneclickvirt/ecs/blob/master/README_NEW_USER.md#ip%E8%B4%A8%E9%87%8F%E6%A3%80%E6%B5%8B

```
curl https://raw.githubusercontent.com/oneclickvirt/securityCheck/main/sc_install.sh -sSf | bash
```

OR

```
curl https://cdn.spiritlhl.net/https://raw.githubusercontent.com/oneclickvirt/securityCheck/main/sc_install.sh -sSf | bash
```

无环境依赖，理论上适配所有系统和主流架构，更多架构请查看 https://github.com/oneclickvirt/securityCheck/releases/tag/output

或使用docker容器执行

```
docker run --rm spiritlhl/security-check:latest
```

## 说明

- [x] 支持双语输出，以```-l```指定输出类型为```en```或```zh```，默认不指定时中文输出
- [x] 支持双栈检测，以```-c```指定检测的**本机IP类型**为```both```或```ipv4```或```ipv6```，默认不指定时检测双栈(IPV4和IPV6都检测)
- [x] 支持同时输出查询到的IP的ASN和地区信息，以```-e```指定```yes```或```no```，默认不指定时不打印IP的ASN和地区信息 
- [x] 支持18个IP相关数据库进行检测，由于检测可能过于火爆，不开源源码，仅提供编译后的文件
- [x] 使用有效的DNS黑名单进行查询(大概300多个有效网站)，每次查询都从[multirbl.valli.org](https://multirbl.valli.org/list/)自动获取黑名单查询地址(含邮箱检测)
- [x] 使用并发查询，整体查询最多不超过15秒
- [x] 支持所有主流架构和主流系统查询

```
Usage: ./securityCheck [options]
  -c string
        Specific chcek type (both or ipv4 or ipv6, default use both)
  -e string
        Enable print IP Info (yes or no, default not to print)
  -h    Show help information
  -l string
        Language parameter (en or zh, default use zh)
  -log
        Enable logging
  -v    show version
```

## 截图

![图片](https://github.com/oneclickvirt/securityCheck/assets/103393591/cd5d215b-2b67-486f-865f-c3e0d526aa34)

![图片](https://github.com/oneclickvirt/securityCheck/assets/103393591/ddf338f2-b82c-41be-b159-0b930b0f2797)

## Information

- [x] Support bilingual output, use ```-l``` to specify the output type as ```en``` or ```zh```, default is no Chinese output.
- [x] Support double-stack detection, use ```-c``` to specify the detected **local IP type** as ```both``` or ```ipv4``` or ```ipv6```, detect double-stack (both IPV4 and IPV6) when not specified by default.
- [x] Supports simultaneous output of ASN and region information of queried IPs, specify ```yes``` or ```no``` with ```-e```, by default ASN and region information of IPs are not printed when not specified. 
- [x] support 15 IP-related databases for detection, due to the detection may be too hot, not open source source code, only provide compiled files
- [x] use valid DNS blacklist for query(About 300 active website), each query from [multirbl.valli.org](https://multirbl.valli.org/list/) automatically get the blacklist query address (including mailbox detection)
- [x] Use concurrent query, the overall query will not exceed 15 seconds at most
- [x] support all major architectures and mainstream system queries

For relevant reference indicators, see: https://github.com/oneclickvirt/ecs/blob/master/README_NEW_USER.md#IP-Quality-Detection
