class CreateSkillLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_levels do |t|
      t.integer :value
      t.string :name
      t.string :description

      t.timestamps
    end

    SkillLevel.create :value => "8", :name => "Very Advanced", :description => "I speak and understand English completelyfluently"
    SkillLevel.create :value => "8", :name => "Advanced", :description => "I speak and understand very well but sometimes have problems with unfamiliar situations andvocabulary"
    SkillLevel.create :value => "7", :name => "Pre-AdvancedI", :description => "I speak and understand well but still make mistakes and fail to make myself understoodoccasionally"
    SkillLevel.create :value => "6", :name => "Upper Intermediate", :description => "I speak and understand well but still make mistakes and fail to make myself understoodoccasionally"
    SkillLevel.create :value => "5", :name => "Intermediate", :description => "I can speak and understand reasonably well and can use basic tenses but have problems with more complex grammar andvocabulary"
    SkillLevel.create :value => "4", :name => "Low IntermediateI", :description => "I can make simple sentences and can understand the main points of a conversation but need much morevocabulary"
    SkillLevel.create :value => "3", :name => "Pre-IntermediateII", :description => "I can communicate simply and understand in familiar situations but only with somedifficulty"
    SkillLevel.create :value => "2", :name => "Elementary", :description => "I can say and understand a few things inEnglish"
    SkillLevel.create :value => "1", :name => "Beginner", :description => "I do not speak anyEnglish"
  end
end
