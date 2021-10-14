# atcoder-practice

https://kenkoooo.com/atcoder/#/table/


## memo

便利関数

* [invmod](https://docs.julialang.org/en/v1/base/math/#Base.invmod)
* [ndigits](https://docs.julialang.org/en/v1/base/math/#Base.ndigits)
* [powermod](https://docs.julialang.org/en/v1/base/math/#Base.powermod)

### Int64

```
$ 2^63 - 1 |> log10 ≒ 18.96
```

`10^19`以上はBigIntを使う必要がある

### ステップ

```julia
for i in start:step:stop
    do_something
end
```
