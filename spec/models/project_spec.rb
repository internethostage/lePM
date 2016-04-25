# - Validation of the presence of the project title
# - Validation of the uniqueness of the project title
# - Validation that the due_date must be greater than today's date

require 'rails_helper'

RSpec.describe Project, type: :model do

  describe "Project Validations" do
    it "requires the presence of a project title" do
        p = Project.new due_date: (Date.today + 1)
        p.valid?
        expect(p.errors[:title]).to include("can't be blank!")
    end

    it "requires that a project title is unique" do
      p = Project.new(title: "Hello", due_date: (Date.today + 1))
      p.save
      p2 = Project.new(title: "Hello", due_date: (Date.today + 1))
      p2.valid?
      expect(p2.errors[:title]).to include("already exists, please try a different one!")
    end

    it "requires that due date is greater than today" do
      p = Project.new(title: "Hello", due_date: (Date.today - 1))
      p.valid?
      expect(p.errors[:due_date]).to include("must be greater than today")
    end

  end

end
