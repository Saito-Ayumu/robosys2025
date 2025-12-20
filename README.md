- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- 本パッケージは，第三者の著作物コードを含みません．
- © 2025 Ayumu Saito

# plusコマンド
[![test](https://github.com/Saito-Ayumu/robosys2025/actions/workflows/test.yml/badge.svg)](https://github.com/Saito-Ayumu/robosys2025/actions/workflows/test.yml)
> 標準入力から読み込んだ**数値**を合計して出力するシンプルなコマンドです。

## これは何？
- パイプで渡した数値列を合計し、小数 1 桁で表示します（例: `15.0`）。
- 非数値や空入力が含まれるとエラー終了（出力なし・終了コード 1）。

## 使い方（Usage）
```bash
# 例: 1〜5 を合計
seq 5 | ./plus
# => 15.0

# 非数値が混ざると失敗（出力なし、終了コード 1）
echo あ | ./plus ; echo $?
# => 1

