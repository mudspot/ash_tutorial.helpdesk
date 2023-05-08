defmodule Helpdesk.Support.Registry do
  use Ash.Registry

  entries do
    entry Helpdesk.Support.Resources.Ticket
    entry Helpdesk.Support.Resources.Representative
  end
end
