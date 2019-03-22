require 'rails_helper'

describe Astronaut, type: :model do
  before(:each) do
    @a1 = Astronaut.create(name:"Neil Armstrong", age: 37, job: "Commander")
    @a2 = Astronaut.create(name:"Scott Kelly", age: 55, job: "Station Master")
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Calculations' do
    it 'can calculate astronauts average age' do

    expect(Astronaut.average_age).to eq(46)
    end
  end 
end
