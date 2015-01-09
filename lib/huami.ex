defmodule Huami do

  @str1 "snow"
  @str2 "kise"
  @str3 "sunlovesnow1990090127xykab"

  def main(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help   ])
    case parse do
      { [ help: true ], _,           _ } -> :help
      { _, [ key, password ],        _ } -> { key, password }
      _                                  -> :help
    end
  end

  def process(:help) do
     IO.puts """
     usage:  huami <key> <password>
     """
    System.halt(0)
  end

  def process({ key, password }) do
    IO.puts encode(key, password)
    System.halt(2)
  end

  def encode(key, password) do
    hmac_str1 = hmac(key, password)
    hmac_str2 = hmac(@str1, hmac_str1)
    hmac_str3 = hmac(@str2, hmac_str1)

    rule = String.split(hmac_str3, "", trim: true)
    source = String.split(hmac_str2, "", trim: true)

    case_swapped_source = case_swap(rule, source)

    ensure_first_char_is_str(case_swapped_source)
  end

  def hmac(key, password) do
    :crypto.hmac(:md5, key, password)
    |> Base.encode16
    |> String.downcase
  end

  def case_swap(rule, source) do
    _case_swap(rule, source, [])
  end

  def _case_swap([], [], swapped_source) do
    swapped_source
  end

  def _case_swap([rule_head | rule_tail], [source_head | source_tail], swapped_source) do
    if String.contains?(@str3, rule_head) do
      swapped_source = swapped_source ++ [ String.upcase(source_head) ]
    else
      swapped_source = swapped_source ++ [ source_head ]
    end
    _case_swap(rule_tail, source_tail, swapped_source)
  end

  def ensure_first_char_is_str(source = [head | tail]) do
    if Regex.match?(~r/[0-9]/, head) do
      "K" <> (Enum.slice(source, 1, 15) |> Enum.join(""))
    else
      Enum.slice(source, 0, 16) |> Enum.join("")
    end
  end
end

