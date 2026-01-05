- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- 本パッケージは，第三者の著作物コードを含みません．
- © 2025 Ayumu Saito

# numscale
[![test](https://github.com/Saito-Ayumu/robosys2025/actions/workflows/test.yml/badge.svg)](https://github.com/Saito-Ayumu/robosys2025/actions/workflows/test.yml)
> 標準入力から数値を読み取り、**正規化した値**を標準出力へ出力するコマンドです。
パイプでつなぐことを前提に、**stdoutには結果のみ**を出し、エラーは**stderr**

- デフォルト: min-max 正規化 (最小値→0、最大値→1)
- `-z / --zscore` : zスコア正規化 (平均→0、標準偏差→1)
-　空白・`#` で始まる行は無視します。

## 動作環境

- python 3.7 以上 (GitHub Actions で 3.7~3.10をテスト)
---

## 使い方 (最短)

```bash
seq5 | ./numscale
```

#出力例
```text
0.000
0.250
0.500
0.750
1.000
```

## 使い方
min-max正規化 (デフォルト)
入力(stdin) : 1行に1つの数値
```bash
printf "10\n20\n30\n" | ./numscale
```

## 出力
```bash
0.000
0.500
1.000
```

## zスコア正規化
```bash
printf "0\n2\n" | ./numscale -z
# または
printf "0\n2\n" | ./numscale --zscore
```

## 出力
```text
-1.000
1.000
```

## 小数点以下の桁数を指定
```bash
seq 5 | ./numscale --precision 1
```

## 入力形式
・標準入力から 1行につき1つの数値（整数/小数）を読み込みます
・空行、# から始まる行は 無視します（パイプ入力で混ざっても扱いやすくするため）

## 出力形式
・正常時は、正規化後の数値を 1行ずつ stdout に出力します
・余計なメッセージ（説明文など）は stdout に出しません

## エラーと終了コード
・入力に数値が1つも無い場合：終了コード 1（stderr に理由を出力）
・数値として解釈できない行がある場合：終了コード 1（stderr に理由を出力）
・全て同じ値で正規化できない場合（例：min==max、zscoreで標準偏差0）：終了コード 1

## 例
```bash
printf "1\nabc\n2\n" | ./numscale > out.txt
echo $?
cat out.txt
```

## テスト
```bash
chmod +x numscale test.bash
bash -xv ./test.bash
```
