require 'fileutils' 

class Submission < ActiveRecord::Base
  after_save :save_file
  after_update :save_file
  belongs_to :user
  belongs_to :problem
  belongs_to :contest

  validates :languageUsed, presence: true, inclusion: {in: [".cpp", ".java", ".py", ".c"]}
  validates :submissionFile, presence: true

  
  protected
    def save_file
      directory="/Users/pratyushsharma/Documents/second_trial/public/system/submissions"
      path=File.join(directory, Problem.find_by(id: self.problem_id).title ,self.id.to_s + self.languageUsed )
      dirname = File.dirname(path) 
      unless File.directory?(dirname) 
        FileUtils.mkdir_p(dirname) 
      end
      File.open(path, 'wb') do |file|
          file.write(self.submissionFile)
      end
      update_column(:submissionFile, path)
    end
end
