class AddAttachmentSolutionFileToProblems < ActiveRecord::Migration
  def self.up
    change_table :problems do |t|
      t.attachment :solution_file
    end
  end

  def self.down
    drop_attached_file :problems, :solution_file
  end
end
