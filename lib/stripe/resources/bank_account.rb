# File generated from our OpenAPI spec
# frozen_string_literal: true

module Stripe
  # These bank accounts are payment methods on `Customer` objects.
  #
  # On the other hand [External Accounts](https://stripe.com/api#external_accounts) are transfer
  # destinations on `Account` objects for accounts where [controller.requirement_collection](https://stripe.com/api/accounts/object#account_object-controller-requirement_collection)
  # is `application`, which includes [Custom accounts](https://stripe.com/connect/custom-accounts).
  # They can be bank accounts or debit cards as well, and are documented in the links above.
  #
  # Related guide: [Bank debits and transfers](https://stripe.com/payments/bank-debits-transfers)
  class BankAccount < APIResource
    include Stripe::APIOperations::Delete
    extend Stripe::APIOperations::List
    include Stripe::APIOperations::Save

    OBJECT_NAME = "bank_account"
    def self.object_name
      "bank_account"
    end

    def verify(params = {}, opts = {})
      resp, opts = execute_resource_request(:post, resource_url + "/verify", params, opts)
      initialize_from(resp.data, opts)
    end

    def resource_url
      if respond_to?(:customer)
        "#{Customer.resource_url}/#{CGI.escape(customer)}/sources/#{CGI.escape(id)}"
      elsif respond_to?(:account)
        "#{Account.resource_url}/#{CGI.escape(account)}/external_accounts/#{CGI.escape(id)}"
      end
    end

    def self.update(_id, _params = nil, _opts = nil)
      raise NotImplementedError,
            "Bank accounts cannot be updated without a customer ID or an  " \
            "account ID. Update a bank account using " \
            "`Customer.update_source('customer_id', 'bank_account_id', " \
            "update_params)` or `Account.update_external_account(" \
            "'account_id', 'bank_account_id', update_params)`"
    end

    def self.retrieve(_id, _opts = nil)
      raise NotImplementedError,
            "Bank accounts cannot be retrieve without a customer ID or an " \
            "account ID. Retrieve a bank account using " \
            "`Customer.retrieve_source('customer_id', 'bank_account_id')` " \
            "or `Account.retrieve_external_account('account_id', " \
            "'bank_account_id')`"
    end

    def self.delete(id, params = {}, opts = {})
      request_stripe_object(
        method: :delete,
        path: "#{resource_url}/#{id}",
        params: params,
        opts: opts
      )
    end

    def delete(params = {}, opts = {})
      request_stripe_object(
        method: :delete,
        path: resource_url.to_s,
        params: params,
        opts: opts
      )
    end

    def self.list(filters = {}, opts = {})
      request_stripe_object(
        method: :delete,
        path: resource_url.to_s,
        params: filters,
        opts: opts
      )
    end
  end
end
