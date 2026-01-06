# numscale

[![test](https://github.com/Saito-Ayumu/robosys2025/actions/workflows/test.yml/badge.svg)](https://github.com/Saito-Ayumu/robosys2025/actions/workflows/test.yml)

標準入力の数値を正規化して出力します。

## 使い方

### 基本（min-max 正規化）

```bash
$ seq 5 | ./numscale
0.000
0.250
0.500
0.750
1.000
```

### zスコア正規化

```bash
$ printf "0\n2\n" | ./numscale -z
-1.000
1.000
```

### 小数点以下の桁数を指定

```bash
$ seq 5 | ./numscale -p 1
0.0
0.2
0.5
0.8
1.0
```

---

## 入出力の仕様

* 入力: 標準入力から **1行につき1つの数値**（整数/小数）を読み込みます。空行と`#` から始まる行は **無視**します。
* 出力: 正規化後の数値を **1行ずつ stdout** に出力します。
* エラー: 入力が不明な場合は終了コード1を返します。

---

## インストール
```bash
git clone https://github.com/Saito-Ayumu/robosys2025.git
cd robosys2025
chmod +x numscale test.bash
```

---

## テスト
```bash
bash -xv ./test.bash
```

---

## ライセンス

このソフトウェアパッケージは，BSD-3-Clauseライセンスの下，再頒布および使用が許可されます．

© 2025 Ayumu Saito
