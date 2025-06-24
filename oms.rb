# Create access_tokens table
class CreateAccessTokens < ActiveRecord::Migration[8.0]
  def change
    create_table :access_tokens do |t|
      t.bigint :user_id, null: false
      t.text :token, null: false
      t.text :sha256, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :access_tokens, :sha256, unique: true
    add_index :access_tokens, :user_id
    add_foreign_key :access_tokens, :users
  end
end

# Create account_accesses table
class CreateAccountAccesses < ActiveRecord::Migration[8.0]
  def change
    create_table :account_accesses do |t|
      t.bigint :account_id, null: false
      t.bigint :user_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :account_accesses, [:account_id, :user_id], unique: true
    add_foreign_key :account_accesses, :accounts
    add_foreign_key :account_accesses, :users
  end
end

# Create account_configs table
class CreateAccountConfigs < ActiveRecord::Migration[8.0]
  def change
    create_table :account_configs do |t|
      t.bigint :account_id, null: false
      t.string :key, null: false
      t.text :value, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :account_configs, [:account_id, :key], unique: true
    add_index :account_configs, :account_id
    add_foreign_key :account_configs, :accounts
  end
end

# Create account_linked_accounts table
class CreateAccountLinkedAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :account_linked_accounts do |t|
      t.bigint :account_id, null: false
      t.bigint :linked_account_id, null: false
      t.text :account_type, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :account_linked_accounts, [:account_id, :linked_account_id], unique: true, name: 'idx_on_account_id_linked_account_id'
    add_index :account_linked_accounts, :account_id
    add_index :account_linked_accounts, :linked_account_id
    add_foreign_key :account_linked_accounts, :accounts
    add_foreign_key :account_linked_accounts, :accounts, column: :linked_account_id
  end
end

# Create accounts table
class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :timezone, null: false
      t.string :locale, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :uuid, null: false
      t.datetime :archived_at
    end
    add_index :accounts, :uuid, unique: true
  end
end

# Create active_storage_attachments table
class CreateActiveStorageAttachments < ActiveRecord::Migration[8.0]
  def change
    create_table :active_storage_attachments do |t|
      t.string :name, null: false
      t.string :uuid, null: false
      t.string :record_type, null: false
      t.bigint :record_id, null: false
      t.bigint :blob_id, null: false
      t.datetime :created_at, null: false
    end
    add_index :active_storage_attachments, :blob_id, name: 'index_active_storage_attachments_on_blob_id'
    add_index :active_storage_attachments, [:record_type, :record_id, :name, :blob_id], name: 'idx_on_record_type_record_id_name_blob_id_0be5805727'
    add_index :active_storage_attachments, :uuid, name: 'index_active_storage_attachments_on_uuid'
    add_foreign_key :active_storage_attachments, :active_storage_blobs, column: :blob_id
  end
end

# Create active_storage_blobs table
class CreateActiveStorageBlobs < ActiveRecord::Migration[8.0]
  def change
    create_table :active_storage_blobs do |t|
      t.string :key, null: false
      t.string :filename, null: false
      t.string :content_type
      t.text :metadata
      t.string :service_name, null: false
      t.bigint :byte_size, null: false
      t.string :checksum
      t.datetime :created_at, null: false
      t.string :uuid
    end
    add_index :active_storage_blobs, :checksum, name: 'index_active_storage_blobs_on_checksum'
    add_index :active_storage_blobs, :key, unique: true
    add_index :active_storage_blobs, :uuid, unique: true
  end
end

# Create active_storage_variant_records table
class CreateActiveStorageVariantRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :active_storage_variant_records do |t|
      t.bigint :blob_id, null: false
      t.string :variation_digest, null: false
    end
    add_index :active_storage_variant_records, [:blob_id, :variation_digest], unique: true, name: 'index_active_storage_variant_records_uniqueness'
    add_foreign_key :active_storage_variant_records, :active_storage_blobs, column: :blob_id
  end
end

# Create completed_documents table
class CreateCompletedDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :completed_documents do |t|
      t.bigint :submitter_id, null: false
      t.string :sha256, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :completed_documents, :sha256
    add_index :completed_documents, :submitter_id
    add_foreign_key :completed_documents, :submitters
  end
end

# Create completed_submitters table
class CreateCompletedSubmitters < ActiveRecord::Migration[8.0]
  def change
    create_table :completed_submitters do |t|
      t.bigint :submitter_id, null: false
      t.bigint :submission_id, null: false
      t.bigint :account_id, null: false
      t.bigint :template_id
      t.string :source, null: false
      t.integer :sms_count, null: false
      t.datetime :completed_at, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :name
      t.string :phone
      t.string :external_id
      t.text :preferences, null: false
      t.text :metadata, null: false
      t.datetime :archived_at
    end
    add_index :completed_submitters, :account_id
    add_index :completed_submitters, :submitter_id, unique: true
    add_foreign_key :completed_submitters, :accounts
    add_foreign_key :completed_submitters, :submitters
    add_foreign_key :completed_submitters, :submissions
  end
end

# Create console1984_commands table
class CreateConsole1984Commands < ActiveRecord::Migration[8.0]
  def change
    create_table :console1984_commands do |t|
      t.text :statements
      t.bigint :sensitive_access_id
      t.bigint :session_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :console1984_commands, :sensitive_access_id
    add_index :console1984_commands, [:session_id, :created_at, :sensitive_access_id], name: 'on_session_and_sensitive_chronologically'
    add_foreign_key :console1984_commands, :console1984_sensitive_accesses, column: :sensitive_access_id
    add_foreign_key :console1984_commands, :console1984_sessions, column: :session_id
  end
end

# Create console1984_sensitive_accesses table
class CreateConsole1984SensitiveAccesses < ActiveRecord::Migration[8.0]
  def change
    create_table :console1984_sensitive_accesses do |t|
      t.text :justification
      t.bigint :session_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :console1984_sensitive_accesses, :session_id
    add_foreign_key :console1984_sensitive_accesses, :console1984_sessions, column: :session_id
  end
end

# Create console1984_sessions table
class CreateConsole1984Sessions < ActiveRecord::Migration[8.0]
  def change
    create_table :console1984_sessions do |t|
      t.text :reason
      t.bigint :user_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :console1984_sessions, :created_at
    add_index :console1984_sessions, [:user_id, :created_at], name: 'index_console1984_sessions_on_user_id_and_created_at'
    add_foreign_key :console1984_sessions, :console1984_users, column: :user_id
  end
end

# Create console1984_users table
class CreateConsole1984Users < ActiveRecord::Migration[8.0]
  def change
    create_table :console1984_users do |t|
      t.string :username, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :console1984_users, :username
  end
end

# Create document_generation_events table
class CreateDocumentGenerationEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :document_generation_events do |t|
      t.bigint :submitter_id, null: false
      t.string :event_name, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :document_generation_events, [:submitter_id, :event_name], unique: true, name: 'index_document_generation_events_on_submitter_id_and_event_name'
    add_index :document_generation_events, :submitter_id
  end
end

# Create email_events table
class CreateEmailEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :email_events do |t|
      t.bigint :account_id, null: false
      t.string :emailable_type, null: false
      t.bigint :emailable_id, null: false
      t.string :message_id, null: false
      t.string :tag, null: false
      t.string :event_type, null: false
      t.string :email, null: false
      t.text :data, null: false
      t.datetime :event_datetime, null: false
    end
    add_index :email_events, [:account_id, :event_datetime]
    add_index :email_events, :email
    add_index :email_events, :message_id
    add_index :email_events, [:emailable_type, :emailable_id], name: 'index_email_events_on_emailable'
    add_index :email_events, :event_type, where: "((event_type)::text = ANY ((ARRAY['bounce','soft_bounce','complaint','soft_complaint'])::text[]))"
  end
end

# Create email_messages table
class CreateEmailMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :email_messages do |t|
      t.string :uuid, null: false
      t.bigint :author_id, null: false
      t.bigint :account_id, null: false
      t.text :subject, null: false
      t.text :body, null: false
      t.string :sha1, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :email_messages, :account_id
    add_index :email_messages, :sha1
    add_index :email_messages, :uuid
    add_foreign_key :email_messages, :accounts
    add_foreign_key :email_messages, :users, column: :author_id
  end
end

# Create encrypted_configs table
class CreateEncryptedConfigs < ActiveRecord::Migration[8.0]
  def change
    create_table :encrypted_configs do |t|
      t.bigint :account_id, null: false
      t.string :key, null: false
      t.text :value, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :encrypted_configs, [:account_id, :key], unique: true
    add_index :encrypted_configs, :account_id
    add_foreign_key :encrypted_configs, :accounts
  end
end

# Create encrypted_user_configs table
class CreateEncryptedUserConfigs < ActiveRecord::Migration[8.0]
  def change
    create_table :encrypted_user_configs do |t|
      t.bigint :user_id, null: false
      t.string :key, null: false
      t.text :value, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :encrypted_user_configs, [:user_id, :key], unique: true
    add_index :encrypted_user_configs, :user_id
    add_foreign_key :encrypted_user_configs, :users
  end
end

# Create oauth_access_grants table
class CreateOauthAccessGrants < ActiveRecord::Migration[8.0]
  def change
    create_table :oauth_access_grants do |t|
      t.bigint :resource_owner_id, null: false
      t.bigint :application_id, null: false
      t.string :token, null: false
      t.integer :expires_in, null: false
      t.text :redirect_uri, null: false
      t.string :scopes, default: "", null: false
      t.datetime :created_at, null: false
      t.datetime :revoked_at
    end
    add_index :oauth_access_grants, :application_id
    add_index :oauth_access_grants, :resource_owner_id
    add_index :oauth_access_grants, :token, unique: true
    add_foreign_key :oauth_access_grants, :oauth_applications, column: :application_id
    add_foreign_key :oauth_access_grants, :users, column: :resource_owner_id
  end
end

# Create oauth_access_tokens table
class CreateOauthAccessTokens < ActiveRecord::Migration[8.0]
  def change
    create_table :oauth_access_tokens do |t|
      t.bigint :resource_owner_id
      t.bigint :application_id, null: false
      t.string :token, null: false
      t.string :refresh_token
      t.integer :expires_in
      t.string :scopes
      t.datetime :created_at, null: false
      t.datetime :revoked_at
      t.string :previous_refresh_token, default: "", null: false
    end
    add_index :oauth_access_tokens, :application_id
    add_index :oauth_access_tokens, :refresh_token, unique: true
    add_index :oauth_access_tokens, :resource_owner_id
    add_index :oauth_access_tokens, :token, unique: true
    add_foreign_key :oauth_access_tokens, :oauth_applications, column: :application_id
    add_foreign_key :oauth_access_tokens, :users, column: :resource_owner_id
  end
end

# Create oauth_applications table
class CreateOauthApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :oauth_applications do |t|
      t.string :name, null: false
      t.string :uid, null: false
      t.string :secret, null: false
      t.text :redirect_uri
      t.string :scopes, default: "", null: false
      t.boolean :confidential, default: true, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :oauth_applications, :uid, unique: true
  end
end

# Create search_entries table
class CreateSearchEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :search_entries do |t|
      t.string :record_type, null: false
      t.bigint :record_id, null: false
      t.bigint :account_id, null: false
      t.tsvector :tsvector, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.tsvector :ngram
    end
    # Indexes with conditions
    add_index :search_entries, [:account_id, :ngram], name: 'index_search_entries_on_account_id_ngram_submission', where: "record_type = 'Submission'", using: :gin
    add_index :search_entries, [:account_id, :ngram], name: 'index_search_entries_on_account_id_ngram_submitter', where: "record_type = 'Submitter'", using: :gin
    add_index :search_entries, [:account_id, :ngram], name: 'index_search_entries_on_account_id_ngram_template', where: "record_type = 'Template'", using: :gin
    add_index :search_entries, [:account_id, :tsvector], name: 'index_search_entries_on_account_id_tsvector_submission', where: "record_type = 'Submission'", using: :gin
    add_index :search_entries, [:account_id, :tsvector], name: 'index_search_entries_on_account_id_tsvector_submitter', where: "record_type = 'Submitter'", using: :gin
    add_index :search_entries, [:account_id, :tsvector], name: 'index_search_entries_on_account_id_tsvector_template', where: "record_type = 'Template'", using: :gin
    add_index :search_entries, [:record_id, :record_type], unique: true
  end
end

# Create submission_events table
class CreateSubmissionEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :submission_events do |t|
      t.bigint :submission_id, null: false
      t.bigint :submitter_id
      t.text :data, null: false
      t.string :event_type, null: false
      t.datetime :event_timestamp, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :submission_events, :created_at
    add_index :submission_events, :submission_id
    add_index :submission_events, :submitter_id
    add_foreign_key :submission_events, :submissions
    add_foreign_key :submission_events, :submitters
  end
end

# Create submissions table
class CreateSubmissions < ActiveRecord::Migration[8.0]
  def change
    create_table :submissions do |t|
      t.bigint :template_id
      t.bigint :created_by_user_id
      t.datetime :archived_at
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.text :template_fields
      t.text :template_schema
      t.text :template_submitters
      t.string :source, null: false
      t.string :submitters_order, null: false
      t.string :slug, null: false
      t.text :preferences, null: false
      t.bigint :account_id, null: false
      t.datetime :expire_at
      t.text :name
    end
    # Add indexes
    add_index :submissions, [:account_id, :id]
    add_index :submissions, [:account_id, :template_id, :id], where: "archived_at IS NULL"
    add_index :submissions, [:account_id, :template_id, :id], where: "archived_at IS NOT NULL"
    add_index :submissions, :created_by_user_id
    add_index :submissions, :slug, unique: true
    add_index :submissions, :template_id
    add_foreign_key :submissions, :templates
    add_foreign_key :submissions, :users, column: :created_by_user_id
  end
end

# Create submitters table
class CreateSubmitters < ActiveRecord::Migration[8.0]
  def change
    create_table :submitters do |t|
      t.bigint :submission_id, null: false
      t.string :uuid, null: false
      t.string :email
      t.string :slug, null: false
      t.text :values, null: false
      t.string :ua
      t.string :ip
      t.datetime :sent_at
      t.datetime :opened_at
      t.datetime :completed_at
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :name
      t.string :phone
      t.string :external_id
      t.text :preferences, null: false
      t.text :metadata, null: false
      t.bigint :account_id, null: false
      t.datetime :declined_at
      t.string :timezone
    end
    add_index :submitters, [:account_id, :id]
    add_index :submitters, [:completed_at, :account_id]
    add_index :submitters, :email
    add_index :submitters, :external_id
    add_index :submitters, :slug, unique: true
    add_index :submitters, :submission_id
    add_foreign_key :submitters, :submissions
    add_foreign_key :submitters, :accounts
  end
end

# Create template_accesses table
class CreateTemplateAccesses < ActiveRecord::Migration[8.0]
  def change
    create_table :template_accesses do |t|
      t.bigint :template_id, null: false
      t.bigint :user_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :template_accesses, [:template_id, :user_id], unique: true
    add_foreign_key :template_accesses, :templates
    add_foreign_key :template_accesses, :users
  end
end

# Create template_folders table
class CreateTemplateFolders < ActiveRecord::Migration[8.0]
  def change
    create_table :template_folders do |t|
      t.string :name, null: false
      t.bigint :author_id, null: false
      t.bigint :account_id, null: false
      t.datetime :archived_at
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :template_folders, :account_id
    add_index :template_folders, :author_id
    add_foreign_key :template_folders, :accounts
    add_foreign_key :template_folders, :users, column: :author_id
  end
end

# Create template_sharings table
class CreateTemplateSharings < ActiveRecord::Migration[8.0]
  def change
    create_table :template_sharings do |t|
      t.bigint :template_id, null: false
      t.bigint :account_id, null: false
      t.string :ability, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :template_sharings, [:account_id, :template_id], unique: true
    add_index :template_sharings, :template_id
    add_foreign_key :template_sharings, :templates
    add_foreign_key :template_sharings, :accounts
  end
end

# Create templates table
class CreateTemplates < ActiveRecord::Migration[8.0]
  def change
    create_table :templates do |t|
      t.string :slug, null: false
      t.string :name, null: false
      t.text :schema, null: false
      t.text :fields, null: false
      t.text :submitters, null: false
      t.bigint :author_id, null: false
      t.bigint :account_id, null: false
      t.datetime :archived_at
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.text :source, null: false
      t.bigint :folder_id, null: false
      t.string :external_id
      t.text :preferences, null: false
      t.boolean :shared_link, default: false, null: false
    end
    add_index :templates, [:account_id, :folder_id, :id], where: "archived_at IS NULL", name: 'index_templates_on_account_id_and_folder_id_and_id'
    add_index :templates, [:account_id, :id], where: "archived_at IS NOT NULL", name: 'index_templates_on_account_id_and_id_archived'
    add_index :templates, :account_id
    add_index :templates, :author_id
    add_index :templates, :external_id
    add_index :templates, :folder_id
    add_index :templates, :slug, unique: true
    add_foreign_key :templates, :accounts
    add_foreign_key :templates, :template_folders, column: :folder_id
    add_foreign_key :templates, :users, column: :author_id
  end
end

# Create user_configs table
class CreateUserConfigs < ActiveRecord::Migration[8.0]
  def change
    create_table :user_configs do |t|
      t.bigint :user_id, null: false
      t.string :key, null: false
      t.text :value, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :user_configs, [:user_id, :key], unique: true
    add_index :user_configs, :user_id
    add_foreign_key :user_configs, :users
  end
end

# Create users table
class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :role, null: false
      t.string :encrypted_password, null: false
      t.bigint :account_id, null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.integer :failed_attempts, default: 0, null: false
      t.string :unlock_token
      t.datetime :locked_at
      t.datetime :archived_at
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :uuid, null: false
      t.string :otp_secret
      t.integer :consumed_timestep
      t.boolean :otp_required_for_login, default: false, null: false
    end
    add_index :users, :account_id
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :unlock_token, unique: true
    add_index :users, :uuid, unique: true
    add_foreign_key :users, :accounts
  end
end

# Create webhook_urls table
class CreateWebhookUrls < ActiveRecord::Migration[8.0]
  def change
    create_table :webhook_urls do |t|
      t.bigint :account_id, null: false
      t.text :url, null: false
      t.text :events, null: false
      t.string :sha1, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.text :secret, null: false
    end
    add_index :webhook_urls, :account_id
    add_index :webhook_urls, :sha1
    add_foreign_key :webhook_urls, :accounts
  end
end
