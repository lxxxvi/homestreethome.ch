class AddArchivedAtToReleases < ActiveRecord::Migration[6.0]
  def change
    add_column :releases, :archived_at, :datetime, null: true
  end
end
