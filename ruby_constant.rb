# Rubyの定数

# 定数はクラスの外部から直接参照が可能

# 参照の方法は クラス名::定数名

class Hoge
  DEFAULT_COUNT = 0
end

p Hoge::DEFAULT_COUNT #=> 0 