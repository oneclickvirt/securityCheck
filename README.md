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
- [x] 支持15个IP相关数据库进行检测，由于检测可能过于火爆，不开源源码，仅提供编译后的文件
- [x] 使用有效的DNS黑名单进行查询，每次查询都从[multirbl.valli.org](https://multirbl.valli.org/list/)自动获取黑名单查询地址(含邮箱检测)
- [x] 使用并发查询，整体查询最多不超过15秒
- [x] 支持所有主流架构和主流系统查询

## Information

- [x] Support bilingual output, use ```-l``` to specify the output type as ```en``` or ```zh```, default is no Chinese output.
- [x] Support double-stack detection, use ```-c``` to specify the detected **local IP type** as ```both``` or ```ipv4``` or ```ipv6```, detect double-stack (both IPV4 and IPV6) when not specified by default.
- [x] support 15 IP-related databases for detection, due to the detection may be too hot, not open source source code, only provide compiled files
- [x] use valid DNS blacklist for query, each query from [multirbl.valli.org](https://multirbl.valli.org/list/) automatically get the blacklist query address (including mailbox detection)
- [x] Use concurrent query, the overall query will not exceed 15 seconds at most
- [x] support all major architectures and mainstream system queries