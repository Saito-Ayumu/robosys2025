- このソフトウェアパッケージは，BSD-3-Clauseライセンスの下，再頒布および使用が許可されます．
- 本パッケージは，第三者の著作物コードを含みません．
- © 2025 Ayumu Saito

# numscale

[![test](https://github.com/Saito-Ayumu/robosys2025/actions/workflows/test.yml/badge.svg)](https://github.com/Saito-Ayumu/robosys2025/actions/workflows/test.yml)

標準入力から数値を読み取り、**正規化した値**を標準出力へ出力するコマンドです。  
パイプでつなぐことを前提に、**stdout には結果のみ**を出し、エラーは **stderr** に出します。

---

## 動作環境

- Python 3.7 以上（GitHub Actions で 3.7〜3.10 をテスト）

---

## 使い方（最短）

```bash
seq 5 | ./numscale
````

出力例（stdout）:

```text
0.000
0.250
0.500
0.750
1.000
```

---

## 入力形式

* 標準入力から **1行につき1つの数値**（整数/小数）を読み込みます
* 空行、`#` から始まる行は **無視**します

---

## 出力形式

* 正常時は、正規化後の数値を **1行ずつ stdout** に出力します
* 余計なメッセージ（説明文など）は **stdout に出しません**

---

## エラーと終了コード

* 入力に数値が1つも無い場合：終了コード `1`（stderr に理由を出力）
* 数値として解釈できない行がある場合：終了コード `1`（stderr に理由を出力）
* 全て同じ値で正規化できない場合（min==max）：終了コード `1`（stderr に理由を出力）

---

## テスト

```bash
chmod +x numscale test.bash
bash -xv ./test.bash
```

---

## ライセンス / 著作権

BSD-3-Clause（`LICENSE` を参照）
© 2025 Ayumu Saito

```
::contentReference[oaicite:0]{index=0}
```

