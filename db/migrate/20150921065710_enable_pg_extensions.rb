class EnablePgExtensions < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'hstore'
  end if Rails.env.development?
end
