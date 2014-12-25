defmodule HuamiTest do
  use ExUnit.Case

  import Huami, only: [ encode: 2 ]

  test "key is one" do
    assert encode('one', '123') == 'De46A920bB13D37c'
  end

  test "key is two" do
    assert encode('two', '123') == 'K924748b267770BE'
  end
end
