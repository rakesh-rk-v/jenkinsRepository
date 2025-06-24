# db/migrate/20231010120001_create_customers.rb
class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :customer_id
      t.string :customer_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :status
      t.timestamps
    end
  end
end

# db/migrate/20231010120002_create_charges.rb
class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.string :charge_id
      t.string :customer_id
      t.decimal :amount, precision: 10, scale: 2
      t.string :charge_type
      t.datetime :charge_date
      t.string :status
      t.timestamps
    end
  end
end

# db/migrate/20231010120003_create_campaigns.rb
class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :campaign_id
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.timestamps
    end
  end
end

# db/migrate/20231010120004_create_activities.rb
class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :activity_id
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.timestamps
    end
  end
end

# db/migrate/20231010120005_create_resources.rb
class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :resource_id
      t.string :name
      t.text :description
      t.string :type
      t.string :status
      t.timestamps
    end
  end
end

# db/migrate/20231010120006_create_products.rb
class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.string :status
      t.timestamps
    end
  end
end

# db/migrate/20231010120007_create_orders.rb
class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :customer_id
      t.datetime :order_date
      t.string :status
      t.decimal :total_amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end

# db/migrate/20231010120008_create_payments.rb
class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :payment_id
      t.string :order_id
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :payment_date
      t.string :payment_method
      t.string :status
      t.timestamps
    end
  end
end

# db/migrate/20231010120009_create_users.rb
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :name
      t.string :email
      t.string :role
      t.string :status
      t.timestamps
    end
  end
end

# db/migrate/20231010120010_create_roles.rb
class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :role_id
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end

# db/migrate/20231010120011_create_user_roles.rb
class CreateUserRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_roles do |t|
      t.string :user_id
      t.string :role_id
      t.timestamps
    end
  end
end

# db/migrate/20231010120012_create_settings.rb
class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :setting_id
      t.string :name
      t.text :value
      t.timestamps
    end
  end
end

# db/migrate/20231010120013_create_logs.rb
class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :log_id
      t.string :action
      t.string :user_id
      t.datetime :action_time
      t.text :details
      t.timestamps
    end
  end
end

# db/migrate/20231010120014_create_notifications.rb
class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :notification_id
      t.string :type
      t.string :recipient_id
      t.string :status
      t.datetime :sent_at
      t.text :message
      t.timestamps
    end
  end
end

# db/migrate/20231010120015_create_feedback.rb
class CreateFeedback < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.string :feedback_id
      t.string :user_id
      t.text :comments
      t.integer :rating
      t.datetime :submitted_at
      t.timestamps
    end
  end
end

# db/migrate/20231010120016_create_sessions.rb
class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :session_id
      t.string :user_id
      t.datetime :started_at
      t.datetime :ended_at
      t.string :status
      t.timestamps
    end
  end
end

# db/migrate/20231010120017_create_api_keys.rb
class CreateApiKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :api_keys do |t|
      t.string :key_id
      t.string :user_id
      t.string :api_key
      t.datetime :created_at
      t.datetime :expires_at
    end
  end
end

# db/migrate/20231010120018_create_files.rb
class CreateFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :files do |t|
      t.string :file_id
      t.string :name
      t.string :path
      t.string :type
      t.datetime :uploaded_at
      t.string :status
      t.timestamps
    end
  end
end

# ... Continue similarly for remaining tables if any
