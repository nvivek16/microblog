class FixNullCheck < ActiveRecord::Migration
  def up
	change_column :tweets, :tweetContent, :string, :null => false
  end

  def down
  end
end
