defmodule Helpdesk.Support.Resources.Ticket do
  # turn module into resource
  use Ash.Resource, data_layer: Ash.DataLayer.Ets

  actions do
    # Add set of simple actions. Customize later
    defaults [:create, :read, :update, :destroy]

    create :open do
      accept [:subject]
    end

    update :close do
      accept []

      change set_attribute(:status, :closed)
    end

    update :assign do
      accept []

      argument :representative_id, :uuid do
        allow_nil? false
      end

      change manage_relationship(:representative_id, :representative, type: :append_and_remove)
    end
  end

  attributes do
    uuid_primary_key :id

    attribute :subject, :string do
      allow_nil? false
    end

    attribute :status, :atom do
      constraints [one_of: [:open, :closed]]
      default :open
      allow_nil? false
    end
  end

  relationships do
    belongs_to: representative, Helpdesk.Support.Resources.Representative
  end
end
