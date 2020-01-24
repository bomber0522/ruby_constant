# Rubyの定数

# 定数はクラスの外部から直接参照が可能

# 参照の方法は クラス名::定数名

class Hoge
  DEFAULT_COUNT = 0
end

p Hoge::DEFAULT_COUNT #=> 0

# private_constantで外部から参照できなくなる(Rubyの場合、滅多にprivateにすることはない)。

class Foo
  DEFAULT_COUNT = 0
  # 定数をprivateにする
  private_constant :DEFAULT_COUNT
end

# privateにした定数をクラスの外部から参照
p Foo::DEFAULT_COUNT
#=> private constant Foo::DEFAULT_COUNT referenced (NameError)

class Bar
  def fuga
    # メソッドの内部で定数を作成
    DEFAULT_STATUS = true
  end
end
# 構文エラーになる
#=> dynamic constant assignment
#   DEFAULT_PRICE = 0
#                  ^

# --------------------------------------------------------------------------------

# Ruby定数はそのままの状態では定数をいろいろと変更できてしまう。
# 定数には再代入が可能。
# 定数の値を後から書き換えも可能。

class Buz
  DEFAULT_PRICE = 0
  # 再代入して定数の値を書き換え
  DEFAULT_PRICE = 100
end
#=> already initialized constant Product::DEFAULT_PRICE

# 再代入後の値が返る
p Buz::DEFAULT_PRICE #=> 100

# クラスの外部からでも再代入が可能
Buz::DEFAULT_PRICE = 300
#=> warning: already initialized constant Product::DEFAULT_PRICE

p Buz::DEFAULT_PRICE #=> 300