defmodule Helpdesk.Support do
  use Ash.Api

  resources do
    registry Helpdesk.Support.Registry
  end
end
