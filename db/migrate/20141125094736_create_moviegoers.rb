class CreateMoviegoers < ActiveRecord::Migration
  def change
    create_table :moviegoers do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.string :string

      t.timestamps
    end
  end
end
