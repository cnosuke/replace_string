replace_string
==============

カレントディレクトリのファイルの文字列を置換する(再帰的にフォルダは潜る)やつ

ありそうだけどすぐに見つけられなかったので自分で作った。
(sedとかでやってもいいけど、一つ一つ確認したかったので...)

# 使い方

## 基本

`ruby replace_string.rb -t rb$ -s apple -g banana`

これで、カレントディレクトリ以下のappleという文字列がbananaという文字列に置換されます。

## もっと使いこなす

`ruby replace_string.rb -t [対象ファイル] -s [置換対象] -g [置換文字列]`

* [対象ファイル]は正規表現で記述できます。つまり `-t '\.(js|css)$'` て書くと、拡張子が.jsと.cssで終わるファイルが対象になります

* [置換対象]も正規表現で記述できます。つまり(以下略)

* [置換文字列]は当然ながら文字列しか無理でーす ✌（◔ڼ◔）✌

## LICENSE
Copyright (C) 2012 Shinnosuke TAKEDA All rights reserved.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

http://www.gnu.org/licenses/gpl.txt
