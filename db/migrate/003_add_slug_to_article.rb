class AddSlugToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :slug, :string
    add_index :articles, :slug
  end

  def self.down
    remove_column :articles, :slug
    remove_index :articles, :slug
  end
end
