# 此分支是用于个人服务器的个人修改版
### 由于Github限制，分支仓库无法隐藏，故在此特别声明
__下方的更新内容在成熟后可能会提PR到上游仓库(开学之后就没时间整了，所以可能不会提)__

## 除针对个人服务器使用外的功能更新:
 - 音乐包生成器(目前支持自定义音高与音色转换规则，可调整音色组中每个音色的音量)。后续如果有需求可能会加立体声支持与NBS控制的音符音量同步。用Json写转换规则的功能可以做，但是我懒)

## 音乐包生成器使用方法(粗略)
### 您需要一定的编程基础才能无障碍地使用此脚本
__音色转换规则只在需要时才会添加，所以您可能需要自行添加转换规则，方法如下：__

使用任意文本编辑器打开py文件，在ToneCmdGenerator枚举类中按照已有音色规则的格式添加新的音色规则，ToneConversionSettings中的注释有对每个参数进行说明。

---

# MiniGames
如果您想要使用此地图，请遵守：
1. 请不要删除任何原作者信息
2. 如果进行修改请添加明显提示
3. 不可商用

# 快速开始、强制进入游戏（管理员）
详见 [QUICKPLAY.md](QUICKPLAY.md)

# 反馈BUG
请在 GitHub Issue 或者qq群里反馈

# 关于对于部分插件的支持
我尝试支持了 `ViaVersion` 以及 `Geyser` 模组。

请使用 `/function via:use1_8` 命令启用支持

使用 `/function via:use1_18` 命令关闭支持

# 资源包的使用
您可以在服务器配置资源包的 GitHub / GitLab 直链达到自动下载资源包。

GitLab 下载速度更快。

GitLab 的 URL 为：[https://gitlab.com/wifi-left/Map-MiniGames/-/raw/master/resourcepack/MiniGameRes.zip?inline=false](https://gitlab.com/wifi-left/Map-MiniGames/-/raw/master/resourcepack/MiniGameRes.zip?inline=false)

GitHub 的 URL 为：[https://github.com/wifi-left/Map-MiniGames/raw/master/resourcepack/MiniGameRes.zip](https://github.com/wifi-left/Map-MiniGames/raw/master/resourcepack/MiniGameRes.zip)

# 目前待做列表
[To-do List](./datapacks/todo.md)

# 服务端安装教程
1. [开服教程 - MCAdmin](https://mcadmin.cn/server/)
2. [教程 - 服务器建设 - Minecraft Wiki](https://minecraft.fandom.com/zh/wiki/%E6%95%99%E7%A8%8B#%E6%9C%8D%E5%8A%A1%E5%99%A8%E8%AE%BE%E7%BD%AE)

请参考上述教程。
