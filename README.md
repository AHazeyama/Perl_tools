<!--
<p align="left">
  <img src="./assets/Perl_tools_title_dark.png#gh-dark-mode-only" alt="banner dark">
  <img src="./assets/Perl_tools_title_light.png#gh-light-mode-only" alt="banner light">
</p>
-->

<img src="./assets/Perl_tools_title_light.png">

# Overview
　Perlで作成したツール群です。  
　主に環境運用の容易化を目的としています。  

## ツール名  
| Item <img src="./assets/env/M_file.png" height="14"> | Description | Usage or screen display |  
|:--|:--|:--|  
| [ansi_print](./source/ansi_print) | ANSI_Color文字列出力ルーチン | [<img src="./assets/prtsc/M_ansi_print.png" height="64">](./assets/prtsc/M_ansi_print.png) |  
| [bin2dec.pl](./source/bin2dec.pl) | 2進数 => 10進数変換Tool | [<img src="./assets/prtsc/M_bin2dec.png">](./assets/prtsc/M_bin2dec.png) |  
| [dec2bin.pl](./source/dec2bin.pl) | 10進数 => 2進数変換Tool | [<img src="./assets/prtsc/M_dec2bin.png">](./assets/prtsc/M_dec2bin.png) |  
| [exrm.pl](./source/exrm.pl) | 排他的 File/Dir 削除Tool | [<img src="./assets/prtsc/M_exrm.png">](./assets/prtsc/M_exrm.png) |  
| [ffmpeg_asp.pl](./source/ffmpeg_asp.pl) | MP4 aspect比変換コマンド (16:9only) | [<img src="./assets/prtsc/M_ffmpeg_asp.png">](./assets/prtsc/M_ffmpeg_asp.png) |  
| [ffmpeg_cut.pl](./source/ffmpeg_cut.pl) | MP4 先頭削除コマンド | [<img src="./assets/prtsc/M_ffmpeg_cut.png">](./assets/prtsc/M_ffmpeg_cut.png) |  
| [ffmpeg_merge.pl](./source/ffmpeg_merge.pl) | MP4 結合コマンド | [<img src="./assets/prtsc/M_ffmpeg_merge.png">](./assets/prtsc/M_ffmpeg_merge.png) |  
| [ffmpeg_split.pl](./source/ffmpeg_split.pl) | MP4 分割コマンド (秒指定) | [<img src="./assets/prtsc/M_ffmpeg_split.png">](./assets/prtsc/M_ffmpeg_split.png) |  
| [ffmpeg_thumb.pl](./source/ffmpeg_thumb.pl) | MP4 サムネール付加コマンド | [<img src="./assets/prtsc/M_ffmpeg_thumb.png">](./assets/prtsc/M_ffmpeg_thumb.png) |  
| [ffmpeg_vol.pl](./source/ffmpeg_vol.pl) | MP4 音量変更Tool | [<img src="./assets/prtsc/M_ffmpeg_vol.png">](./assets/prtsc/M_ffmpeg_vol.png) |  
| [hashgc.pl](./source/hashgc.pl) | Hash値算出Tool(sha256 only) | [<img src="./assets/prtsc/M_ffmpeg_vol.png">](./assets/prtsc/M_ffmpeg_vol.png) |  
| [prompt_print](./source/prompt_print) | LinuxPrompt偽装出力ルーチン | [<img src="./assets/prtsc/M_prompt.png" width="540">](./assets/prtsc/M_prompt.png) |  
| [renm.pl](./source/renm.pl) | File/Dir一括変名ツール(正規表現対応) | [<img src="./assets/prtsc/M_renm.png">](./assets/prtsc/M_renm.png) |  
| [sccheck](./source/sccheck) | 特殊文字検出ルーチン | [<img src="./assets/prtsc/M_sccheck.png">](./assets/prtsc/M_sccheck.png) |  
| [unused_assets.pl](./source/unused_assets.pl) | .md未使用ファイル削除 | [<img src="./assets/prtsc/M_unused_assets.png">](./assets/prtsc/M_unused_assets.png) |  
| [uzfl.pl](./source/uzfl.pl) | ZIP file 展張Tool(一括、No付加) | [<img src="./assets/prtsc/M_uzfl.png">](./assets/prtsc/M_uzfl.png) |  

> [!caution]  
> コマンドラインツールです。GUIを面倒くさがる方向けです。  
> WSL又はLinux、Mac(Terminal)上で実行して下さい。  
> <img src="./assets/env/M_caution.png" height="14"> これらを使おうとする人には常識かも知れませんが…  
> 　 危険な動作をするツールがあります。  
> 　 問答無用で実行します。  
> 　 自己責任でお願いします。<img src="./assets/env/Jonesy25_I-told-you-so.png" align="top">  
> 引数無しで実行すると**Usage**が表示されるかも知れません。  
> ffmpegは全て"-hide_banner"オプションを指定しています。  
> 拡張子無しの <img src="./assets/env/M_file.png" height="14"> もPerlスクリプトです。  
> <img src="./assets/env/M_pointing-L.png" height="14"> 他のスクリプトから呼ばれているので、利用時には <img src="./assets/env/M_download.png" height="14"> しておいて下さい。  
> <img src="./assets/env/Jonesy19_i-see.png">  

## GUI version  
　各ツールのGUIバージョンはTOPページから参照できます。  
　[ <img src="./assets/env/M_link.png" height="14"> AHazeyama/public](https://github.com/AHazeyama/public)  

## License  
　TBD  