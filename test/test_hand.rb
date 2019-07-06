require 'minitest/unit'
require './services/hand'

MiniTest::Unit.autorun

class TestHand < MiniTest::Unit::TestCase
  def setup
    @guu = Hand.new 'guu'
    @choki = Hand.new 'choki'
    @paa = Hand.new 'paa'
  end

  # コンストラクタに 'guu' を渡したときに #hand が 'guu' になる
  def test_hand_with_guu
    assert_equal 'guu', @guu.hand
  end

  # コンストラクタに 'choki' を渡したときに #hand が 'choki' になる
  def test_hand_with_choki
    assert_equal 'choki', @choki.hand
  end

  # コンストラクタに 'paa' を渡したときに #hand が 'paa' になる
  def test_hand_with_paa
    assert_equal 'paa', @paa.hand
  end

  # コンストラクタに無効な値を渡したときには ArgumentError が発生する
  def test_construct_with_invalid_value
    %w(some invalid values).each do |value|
      assert_raises ArgumentError do
        Hand.new value
      end
    end
  end

  # execute メソッド: guu vs. guu は 'graw'
  def test_execute_guu_vs_goo
    assert_equal 'draw', @guu.execute(@guu)
  end

  # execute メソッド: guu vs. choki は 'win'
  def test_execute_guu_vs_choki
    assert_equal 'win', @guu.execute(@choki)
  end

  # execute メソッド: guu vs. paa は 'lose'
  def test_execute_guu_vs_paa
    assert_equal 'lose', @guu.execute(@paa)
  end

  # execute メソッド: choki vs. guu は 'lose'
  def test_execute_choki_vs_goo
    assert_equal 'lose', @choki.execute(@guu)
  end

  # execute メソッド: choki vs. choki は 'draw'
  def test_execute_choki_vs_choki
    assert_equal 'draw', @choki.execute(@choki)
  end

  # execute メソッド: choiki vs. paa は 'win'
  def test_execute_choki_vs_paa
    assert_equal 'win', @choki.execute(@paa)
  end

  # execute メソッド: paa vs. guu は 'win'
  def test_execute_paa_vs_goo
    assert_equal 'win', @paa.execute(@guu)
  end

  # execute メソッド: paa vs. choki は 'lose'
  def test_execute_paa_vs_choki
    assert_equal 'lose', @paa.execute(@choki)
  end

  # execute メソッド: paa vs. paa は 'draw'
  def test_execute_paa_vs_paa
    assert_equal 'draw', @paa.execute(@paa)
  end

  # execute メソッド に Hand クラスのインスタンス以外を渡すと TypeError
  def test_execute_with_invalid_values
    assert_raises TypeError do
      @guu.execute 'guu'
    end
  end

  # random クラスメソッドのランダム性チェック
  def test_random
    t = 1000000
    hands = t.times.map{ Hand.random }.map(&:hand)
    guu_count = hands.select{|v| v == 'guu'}.count
    assert_in_epsilon(guu_count, t / 3.0, 0.01)
  end
end
