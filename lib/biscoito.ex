defmodule Biscoito do
  alias Biscoito.Lists

  defdelegate create_list(attrs), to: Lists.Create, as: :call

end
