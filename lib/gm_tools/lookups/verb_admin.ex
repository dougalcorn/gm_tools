defmodule GmTools.Lookups.VerbAdmin do

  def index(_) do
    [
      id: nil,
      verb: nil
    ]
  end

  def ordering(_) do
    [asc: :verb]
  end
end
