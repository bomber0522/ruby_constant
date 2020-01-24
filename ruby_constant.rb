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