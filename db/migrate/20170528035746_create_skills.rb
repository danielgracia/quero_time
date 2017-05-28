class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    # https://www.mymajors.com/career/computer-programmers/skills/

    Skill.create :name => "Programming", :description => "Writing computer programs for various purposes."
    Skill.create :name => "Reading Comprehension", :description => "Understanding written sentences and paragraphs in work related documents."
    Skill.create :name => "Critical Thinking", :description => "Using logic and reasoning to identify the strengths and weaknesses of alternative solutions, conclusions or approaches to problems."
    Skill.create :name => "Complex Problem Solving", :description => "Identifying complex problems and reviewing related information to develop and evaluate options and implement solutions."
    Skill.create :name => "Quality Control Analysis", :description => "Conducting tests and inspections of products, services, or processes to evaluate quality or performance."
    Skill.create :name => "Active Listening", :description => "Giving full attention to what other people are saying, taking time to understand the points being made, asking questions as appropriate, and not interrupting at inappropriate times."
    Skill.create :name => "Judgment and Decision Making", :description => "Considering the relative costs and benefits of potential actions to choose the most appropriate one."
    Skill.create :name => "Operations Analysis", :description => "Analyzing needs and product requirements to create a design."
    Skill.create :name => "Systems Evaluation", :description => "Identifying measures or indicators of system performance and the actions needed to improve or correct performance, relative to the goals of the system."
    Skill.create :name => "Time Management", :description => "Managing one's own time and the time of others."
    Skill.create :name => "Mathematics", :description => "Using mathematics to solve problems."
    Skill.create :name => "Systems Analysis", :description => "Determining how a system should work and how changes in conditions, operations, and the environment will affect outcomes."
    Skill.create :name => "Writing", :description => "Communicating effectively in writing as appropriate for the needs of the audience."
    Skill.create :name => "Active Learning", :description => "Understanding the implications of new information for both current and future problem-solving and decision-making."
    Skill.create :name => "Monitoring", :description => "Monitoring/Assessing performance of yourself, other individuals, or organizations to make improvements or take corrective action."
    Skill.create :name => "Speaking", :description => "Talking to others to convey information effectively."
    Skill.create :name => "Social Perceptiveness", :description => "Being aware of others' reactions and understanding why they react as they do."
    Skill.create :name => "Coordination", :description => "Adjusting actions in relation to others' actions."
    Skill.create :name => "Technology Design", :description => "Generating or adapting equipment and technology to serve user needs."
    Skill.create :name => "Science", :description => "Using scientific rules and methods to solve problems."
    Skill.create :name => "Persuasion", :description => "Persuading others to change their minds or behavior."
    Skill.create :name => "Management of Personnel Resources", :description => "Motivating, developing, and directing people as they work, identifying the best people for the job."

    Skill.create :name => "Computers and Electronics", :description => "Knowledge of circuit boards, processors, chips, electronic equipment, and computer hardware and software, including applications and programming."
    Skill.create :name => "English Language", :description => "Knowledge of the structure and content of the English language including the meaning and spelling of words, rules of composition, and grammar."
    Skill.create :name => "Mathematics", :description => "Knowledge of arithmetic, algebra, geometry, calculus, statistics, and their applications."
    Skill.create :name => "Customer and Personal Service", :description => "Knowledge of principles and processes for providing customer and personal services. This includes customer needs assessment, meeting quality standards for services, and evaluation of customer satisfaction."
    Skill.create :name => "Administration and Management", :description => "Knowledge of business and management principles involved in strategic planning, resource allocation, human resources modeling, leadership technique, production methods, and coordination of people and resources."
    Skill.create :name => "Design", :description => "Knowledge of design techniques, tools, and principles involved in production of precision technical plans, blueprints, drawings, and models."
    Skill.create :name => "Education and Training", :description => "Knowledge of principles and methods for curriculum and training design, teaching and instruction for individuals and groups, and the measurement of training effects."

    Skill.create :name => "Analytical Thinking", :description => "Job requires analyzing information and using logic to address work-related issues and problems."
    Skill.create :name => "Attention to Detail", :description => "Job requires being careful about detail and thorough in completing work tasks."
    Skill.create :name => "Initiative", :description => "Job requires a willingness to take on responsibilities and challenges."
    Skill.create :name => "Achievement/Effort", :description => "Job requires establishing and maintaining personally challenging achievement goals and exerting effort toward mastering tasks."
    Skill.create :name => "Cooperation", :description => "Job requires being pleasant with others on the job and displaying a good-natured, cooperative attitude."
    Skill.create :name => "Stress Tolerance", :description => "Job requires accepting criticism and dealing calmly and effectively with high stress situations."
    Skill.create :name => "Persistence", :description => "Job requires persistence in the face of obstacles."
    Skill.create :name => "Adaptability/Flexibility", :description => "Job requires being open to change (positive or negative) and to considerable variety in the workplace."
    Skill.create :name => "Independence", :description => "Job requires developing one's own ways of doing things, guiding oneself with little or no supervision, and depending on oneself to get things done."
    Skill.create :name => "Innovation", :description => "Job requires creativity and alternative thinking to develop new ideas for and answers to work-related problems."
    Skill.create :name => "Dependability", :description => "Job requires being reliable, responsible, and dependable, and fulfilling obligations."
    Skill.create :name => "Integrity", :description => "Job requires being honest and ethical."
    Skill.create :name => "Leadership", :description => "Job requires a willingness to lead, take charge, and offer opinions and direction."
    Skill.create :name => "Self Control", :description => "Job requires maintaining composure, keeping emotions in check, controlling anger, and avoiding aggressive behavior, even in very difficult situations."
    Skill.create :name => "Concern for Others", :description => "Job requires being sensitive to others' needs and feelings and being understanding and helpful on the job."
    Skill.create :name => "Social Orientation", :description => "Job requires preferring to work with others rather than alone, and being personally connected with others on the job."


  end
end
