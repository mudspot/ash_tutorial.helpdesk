defmodule Helpdesk.Support.Resources.Representative do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  postgres do
    table "representatives"
    repo Helpdesk.Repo
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string
  end

  relationships do
    has_many :tickets, Helpdesk.Support.Resources.Ticket
  end

  aggregates do
    # The first argument here is the name of the aggregate
    # The second is the relationship
    count :total_tickets, :tickets

    count :open_tickets, :tickets do
      filter expr(status == :open)
    end

    count :closed_tickets, :tickets do
      filter expr(status == :closed)
    end
  end

  calculations do
    calculate :percent_open, :float, expr(open_tickets / total_tickets)
  end
end
