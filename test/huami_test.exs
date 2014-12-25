defmodule HuamiTest do
  use ExUnit.Case

  import Huami

  test "encode when key is one" do
    assert encode("one", "123") == "De46A920bB13D37c"
  end

  test "encode when key is two" do
    assert encode("two", "123") == "K924748b267770BE"
  end

  test "hmac" do
    assert hmac("one", "123") == "7370c8d19b0cdee581ab85f92be29de9"
  end

  test "case_swap" do
    rule = ["b", "c", "8", "2", "2", "f", "1", "7", "d", "e", "2", "c", "2", "1", "0", "c", "0", "c", "4", "c", "1", "8", "f", "2", "2", "8", "3", "d", "b", "e", "4", "7"]
    source = ["d", "e", "4", "6", "a", "9", "2", "0", "b", "b", "1", "3", "d", "3", "7", "c", "1", "2", "5", "4", "5", "a", "b", "d", "7", "b", "a", "b", "3", "e", "4", "c"   ]
    swapped_source = ["D", "e", "4", "6", "A", "9", "2", "0", "b", "B", "1", "3", "D", "3", "7", "c", "1", "2", "5", "4", "5", "a", "b", "D", "7", "b", "a", "b", "3", "E", "4", "C"]
    assert case_swap(rule, source) == swapped_source
  end

  test "ensure_first_char_is_str when first char is string" do
    assert ensure_first_char_is_str(["a", "1"]) == "a1"
  end

  test "ensure_first_char_is_str when first char is number" do
    assert ensure_first_char_is_str(["1", "2"]) == "K2"
  end
end
