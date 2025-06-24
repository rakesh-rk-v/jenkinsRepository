require 'active_record'

# Establish a connection to the database
ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  database: 'dxpoms',
  username: 'your_username',
  password: 'your_password',
  host: 'localhost'
)

# Create the AccountPaymentOwnership model
class AccountPaymentOwnership < ActiveRecord::Base
  self.table_name = 'account_payment_ownership'
  self.primary_key = 'OWNERSHIP_ID'
end

# Create the AccountPaymentOwnershipDetails model
class AccountPaymentOwnershipDetails < ActiveRecord::Base
  self.table_name = 'account_payment_ownership_details'
  self.primary_key = 'OWNERSHIP_DETAILS_ID'

  belongs_to :account_payment_ownership, foreign_key: 'OWNERSHIP_ID'
end

# Create the AccountPaymentOwnershipDetailsHist model
class AccountPaymentOwnershipDetailsHist < ActiveRecord::Base
  self.table_name = 'account_payment_ownership_details_hist'
  self.primary_key = 'HIST_RECORD_ID'
end

# Migration to create the tables
class CreateAccountPaymentOwnershipTables < ActiveRecord::Migration[6.0]
  def change
    create_table :account_payment_ownership do |t|
      t.bigint :OWNING_CUSTOMER_ID, null: false
      t.bigint :OWNING_NODE_ID, null: false
      t.bigint :OWNING_CUSTOMER_ACCOUNT_ID, null: false
      t.bigint :OWNING_BILLING_ACCOUNT_ID, null: false
      t.datetime :EFFECTIVE_FROM, null: false
      t.datetime :EFFECTIVE_TO, null: false
      t.tinyint :STATUS, null: false, default: 1
      t.string :CREATED_BY, limit: 50
      t.string :CREATED_IPADDR, limit: 100
      t.datetime :CREATED_ON, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :MODIFIED_ON, null: false, default: -> { 'CURRENT_TIMESTAMP' }, on_update: -> { 'CURRENT_TIMESTAMP' }
      t.string :MODIFIED_BY, limit: 50
      t.string :MODIFIED_IPADDR, limit: 100
      t.string :APPROVED_BY, limit: 50
      t.datetime :APPROVED_ON

      t.timestamps
    end

    create_table :account_payment_ownership_details do |t|
      t.bigint :OWNERSHIP_ID, null: false
      t.int :OWNERSHIP_TYPE, null: false
      t.bigint :OWNED_CUSTOMER_ACCOUNT_ID, null: false
      t.bigint :OWNED_SERVICE_ID, null: false
      t.bigint :OWNED_CONTRACT_ID, null: false
      t.bigint :OWNED_CHARGE_ID, null: false
      t.bigint :REQUEST_ID
      t.text :REASON
      t.datetime :EFFECTIVE_FROM, null: false
      t.datetime :EFFECTIVE_TO, null: false
      t.tinyint :STATUS, null: false, default: 1
      t.string :CREATED_BY, limit: 50
      t.string :CREATED_IPADDR, limit: 100
      t.datetime :CREATED_ON, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :MODIFIED_ON, null: false, default: -> { 'CURRENT_TIMESTAMP' }, on_update: -> { 'CURRENT_TIMESTAMP' }
      t.string :MODIFIED_BY, limit: 50
      t.string :MODIFIED_IPADDR, limit: 100
      t.string :APPROVED_BY, limit: 50
      t.datetime :APPROVED_ON

      t.timestamps
      t.index :OWNERSHIP_ID
      t.foreign_key :account_payment_ownership, column: :OWNERSHIP_ID, on_delete: :restrict, on_update: :restrict
    end

    create_table :account_payment_ownership_details_hist do |t|
      t.bigint :OWNERSHIP_DETAILS_ID, null: false
      t.bigint :OWNERSHIP_ID, null: false
      t.int :OWNERSHIP_TYPE, null: false
      t.bigint :OWNED_CUSTOMER_ACCOUNT_ID, null: false
      t.bigint :OWNED_SERVICE_ID, null: false
      t.bigint :OWNED_CONTRACT_ID, null: false
      t.bigint :OWNED_CHARGE_ID, null: false
      t.bigint :REQUEST_ID
      t.text :REASON
      t.datetime :EFFECTIVE_FROM, null: false
      t.datetime :EFFECTIVE_TO, null: false
      t.tinyint :STATUS, null: false, default: 1
      t.string :CREATED_BY, limit: 50
      t.string :CREATED_IPADDR, limit: 100
      t.datetime :CREATED_ON, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :MODIFIED_ON, null: false, default: -> { 'CURRENT_TIMESTAMP' }, on_update: -> { 'CURRENT_TIMESTAMP' }
      t.string :MODIFIED_BY, limit: 50
      t.string :MODIFIED_IPADDR, limit: 100
      t.string :APPROVED_BY, limit: 50
      t.datetime :APPROVED_ON

      t.timestamps
    end
  end
end

