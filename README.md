<p align="left">
  <img src="./assets/Perl_tools_title_dark.png#gh-dark-mode-only" alt="banner dark">
  <img src="./assets/Perl_tools_title_light.png#gh-light-mode-only" alt="banner light">
</p>

> [!NOTE]  
> info



## ツール名  
| Item | Description | Usage or screen display |  
|:--|:--|:--|
| ansi_print | ANSI_Color文字列出力ルーチン | [<img src="./assets/prtsc/M_ansi_print.png" height="64">](./assets/prtsc/M_ansi_print.png)  
| bin2dec.pl | 2進数 => 10進数変換Tool | [<img src="./assets/prtsc/M_bin2dec.png">](./assets/prtsc/M_bin2dec.png)  
| dec2bin.pl | 10進数 => 2進数変換Tool | [<img src="./assets/prtsc/M_dec2bin.png">](./assets/prtsc/M_dec2bin.png)  
| exrm.pl | 排他的 File/Dir 削除Tool | [<img src="./assets/prtsc/M_exrm.png">](./assets/prtsc/M_exrm.png)  
| ffmpeg_asp.pl | MP4 aspect比変換コマンド (16:9only) | <img src="./assets/prtsc/M_ffmpeg_asp.png">
| ffmpeg_cut.pl | MP4 先頭削除コマンド | <img src="./assets/prtsc/M_ffmpeg_cut.png">
| ffmpeg_merge.pl | MP4 結合コマンド | <img src="./assets/prtsc/M_ffmpeg_merge.png">
| ffmpeg_split.pl | MP4 分割コマンド (秒指定)           | ffmpeg_split.pl△input_file△split_time(second)|
| ffmpeg_thumb.pl | MP4 サムネール付加コマンド          | ffmpeg_thumb.pl△input_file△thumbnail_file|
| ffmpeg_vol.pl   | MP4 音量変更Tool                    | ffmpeg_vol.pl△input_file△magnification|
| prompt_pt       | LinuxPrompt偽装出力ルーチン         ||
| renm.pl         | File/Dir一括変名ツール(正規表現対応)||
| sccheck         | 特殊文字検出ルーチン                ||
| uzfl.pl         | ZIP file 展張Tool(一括、No付加)     ||

> [!caution]  
> コマンドラインツールです。WSL又はLinux、Mac(Terminal)上で実行して下さい。  
> <img src="./assets/env/M_caution.png" height="14"> これらを使おうとする人には常識かも知れませんが…  
> 　 危険な動作をするツールがあります。  
> 　 問答無用で実行します。  
> 　 自己責任でお願いします。<img src="./assets/env/Jonesy25_I-told-you-so.png" align="top">  
> 引数無しで実行すると**Usage**が表示されるかも知れません。  
> 拡張子無しの <img src="./assets/env/M_file.png" height="14"> もPerlスクリプトです。  
> <img src="./assets/env/M_pointing-L.png" height="14"> 他のスクリプトから呼ばれてますので、利用時には <img src="./assets/env/M_download.png" height="14"> しておいて下さい。  
> <img src="./assets/env/Jonesy19_i-see.png">  


## ツール概要  
*各ツールの使用方法：パラメータを指定せずに実行するとUsageが表示されます(!?)。  
### ansi_print  
・ANSIcolor対応print  
### bin2dec  
・Binary to Decimal Convertion tool  
### dec2bin  
・Decimal to Binary Convertion tool  
### ffmpeg_asp  
・MP4 Aspect Ratio Changer Tool
### ffmpeg_cut  
・Remove the beginning portion of the MP4 file  
### ffmpeg_merge tool  
・Merge MP4 files  
### ffmpeg_it  
・MP4 file itting tool  
### ffmpeg_thumb  
・Insert thumbnails into MP4 files  
### ffmpeg_vol  
・Adjusting the volume of an MP4 file  
### prompt_print  
・Terminal prompt forgery tool  
### renm  
・File batch renaming tool (supports regular expressions)  
### sccheck  
・Special character (my own) check tool  
### uzfl  
・ZIP file extraction tool  
### xdump  
・binファイルダンプツール(O'REILLY@からの引用)  
